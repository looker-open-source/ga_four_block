# Google Analytics 4

**This is not an officially supported Google product** 

## What does this Looker Block do for me?

This block allows GA4 users to continue to view the dashboards and metrics that they are familiar with from GA360.
In order to mirror a lot of the high level dashboards you see in your existing GA 360 UI by looking at an Overview, Behavior, Audiences,  Acquisition, and Custom Goal Conversions, this block creates:

- An Incremental Persistent Derived Table that Sessionizes the Event Data (Sessions.view)
- Event Level Data linked to a specific Session (events.view + extended views)
- Retention Cohort Analysis capabilities (audience_cohorts.view)
- Looker dimension for every combination of \_event\_name\_ / \_event\_params.key\_ and \_user_properties_ (event\_data\_dimensions folder) for the automatically collected data.
- A Propensity Model written in BigQuery ML for getting predictive analytics on your customers.


GA4 data is exported in the format of a single flat table with a new entry for each event
This is is similar to Google's Firebase output and can be difficult to query due to date-based partitioned tables and a need for unnesting in all but the most high-level queries.

Documentation for getting GA4 data into BigQuery can be found on the Google Analytics support site [here](https://support.google.com/analytics/answer/9823238?hl=en#zippy=%2Cin-this-article)

# GA4 Data Structure
The GA4 (Google Analytics 4) data is exported as date-partitioned tables consisting of event-level rows.

For anyone moving to GA4 from GA360, this represents a shift in scope. GA360 exported data had rows unique to a session, with nested information about individual hits (or events).

Each row in the event tables is a record of one event. There are several standard columns: event_date, event_timestamp, event_name, user_pseudo_id, for a full list of fields exported by default, see https://support.google.com/firebase/answer/7029846. In addition to single-value fields, there are nested fields as well.

The simpler nested fields can be referenced with dot-notation sql definitions, as shown in this example of the “ECommerce Purchase Revenue” dimension:
````  
  dimension: ecommerce__purchase_revenue {
    type: number
    sql: ${TABLE}.ecommerce.purchase_revenue ;;
    group_label: "Ecommerce"
    group_item_label: "Purchase Revenue"
    value_format_name: usd
  }
````  
Here, “purchase_revenue” is an element of the ecommerce field.

However, Some elements within GA4 are packaged as repeating key/value pairs such as the “event_params” field:

````
`event_params:[
  {
    "value": {
      "string_value": "https://www.google.com/"
      },
    "key": "page_location"
  },
  {
    "value": {
      "string_value": "Google"
    },
    "key": "page_title"
  },
  {
    "value": {
      "int_value": "1"
    },
    "key": "ga_session_number"
  },
  {
    "value": {
      "int_value": "1234567890"
    },
    "key": "ga_session_id"
  }
]`
````
The structure for each element in this array is essentially:

KEY
- KEY_VALUE

VALUE
- INT_VALUE
- DOUBLE_VALUE
- FLOAT_VALUE
- STRING_VALUE

As shown above, there are multiple “key” possibilities as well as multiple “value” possibilities within each key. We will also explain the relationship between these nested fields and their LookML views/dimensions below.

Many desired metrics will be focused on session-level behavior. To facilitate this, sessions need to be identified across multiple rows.

# Sessionization
The core component of the GA4 Block is the sessions.view file. This file contains the derived table that groups the event rows into session rows. This is started by identifying and isolating the session-level key (referred to throughout the block as “sl_key”). The four components of this sl_key are:

**Session Date**
The session date is extracted directly from the table name, using the BigQuery “_TABLE_SUFFIX” function which becomes available when the table source for the query includes a wildcard. (For example: select * from events_* would query across all tables that begin with “events_”. In this scenario, you can also select all or portions of the table name to be displayed in the results as a populated column). Because of this, sessions in which events span multiple days will be counted as one session in each day. This is an inherited behavior from existing processes: If a session crosses a day boundary (e.g. if it starts at 11:55 pm and ends at 12:05 am), it is considered a single session, though it is counted once for each day. (https://support.google.com/analytics/answer/9191807)

**GA Session ID**
This session identifier is used in conjunction with the user ID (user_pseudo_id by default) and the GA Session Number to uniquely identify a session. The GA Session ID by itself may not be unique.

**GA Session Number**
This number indicates the session frequency of a particular user. Each user’s first visit will be 1..

**User Pseudo ID**
This is the default User Identification value populated in GA4.

This ‘sl_key’, along with its components and all columns from the source event row, are grouped within a CTE titled “session_list_with_event_history” alongside several calculations:

**Event Rank**
This is a rank function (no duplicate values) ordered by event_timestamp. Each event will have a rank > 0.

**Time To Next Event**
This is a timestamp_difference function between the event_timestamp of the following event and the event_timestamp of the current event.

**Page View Rank**
This is a rank function exclusively of ‘page_view’ events ordered by event_timestamp. Each ‘page_view’ event will have a rank > 0. Non ‘page_view’ events will have a rank of 0.

**Page View Reverse Rank**
Similar to the Page View Rank, however ordered by descending event_timestamp.

**Time To Next Page**
This timestamp_difference function will only get elapsed time between the present ‘page_view’ event and the following ‘page_view’ event. If a session only has one ‘page_view’ event, this value will be 0.

The results of the “session_list_with_event_history” CTE are then utilized for the following processes:

**“Session_facts” CTE:**
- Session Event Count - A count of all events in a given session (grouped by sl_key).
- Session Page View Count - A count of all “page_view” events in a given session (grouped by sl_key).
- Engaged Events - A count of all events identified as ‘Engaged’, an event_parameter (grouped by sl_key).
- Is Engaged Session? - A boolean (yes/no) value indicating if the session contained one or more events with a ‘session_engaged’ positive value (grouped by sl_key).
- Is First Visit Session? - A boolean (yes/no) value indicating if the session contains a ‘first_visit’ event, indicative of a first visit session.
- Session Length Minutes - A timestamp_difference function between the first event_timestamp in a session and the last event_timestamp in a session. Sessions with a singular event_timestamp (even with multiple events) will have a value of 0.

**“Session Tags” CTE:**
The purpose of this CTE is to extract session-specific tags for Medium, Source, Campaign, and Page Referrer values. These values follow the “Last Non-Direct Click” method of attribution. For the purposes of this block, the “traffic_source” column present in the source event tables was not used. The “traffic_source” values are set on a user’s initial visit to a site or application, and these values can persist beyond the scope of a single session.
- Medium
- Source
- Campaign
- Page Referrer

**“DeviceGeo” CTE:**
The device and geographic metadata of a session are being extracted from the “session_start” event.

**“Session Event Packing” CTE:**
This process takes the original row output of “session_list_with_event_history” and condenses it into one row per session, with all the event history of the session nested into an array. This is used later for efficient unnesting of elements without needing to re-group events into sessions at the time of the query. The output is the sl_key, its components, and a nested field called “event_data”.

The final select statement in this derived table combines the elements of each process into one row for each session that contains:
- SL_KEY
- Session Date
- GA Session ID
- GA Session Number
- User Pseudo ID
- Session Attribution - Nested Element with output of “session_tags”.
- Session Data - Nested Element with output of “session_facts”.
- Device Data - Nested Element with Device columns from output of “DeviceGeo”.
- Geo Data - Nested Element with Geo columns from output of “DeviceGeo”.
- Event Data - Array of all event components that make up this session.

## Incremental Derived Table
The output of this SQL query is stored as an incremental persistent derived table. This allows appending of new rows to an existing table, instead of a complete drop/create with every scheduled run. The key upon which the incremental updates happen is “Session Date”. To accommodate potential delays in full data delivery, the increment_offset is set to 3. This means for each run, up to 3 days of data may be inserted.

The initial build of this table will generate a SQL query inserting “1=1”, running across all event tables present in the target dataset. Subsequent runs will insert appropriate “WHERE” syntax to limit the results to the date range specified by the “increment_offset” value.

**NOTE**: This process of incrementally storing session-data will effectively duplicate the volume of data being exported by GA4. It is important to be aware of the increase in storage; however, this also increases your ability to perform analytics.

# Looker Model and Views
File Structure
The components of the GA4 Block are isolated into folders for the file type/purpose. From the top down the folders are:
- Attributes. The files contained within this folder are attributes that may be included in an explore/model file. By default the two attribute types included are: datagroups, formats (custom value format definitions)
- Dashboards. All included LookML dashboards are present within this folder
- Explores. Explores have been separated from the model file for potential re-use/extension/refinement. The only explore included by default is “sessions”. This “sessions” explore is where the attributes defined above are being included, as well as all views utilized.
- Models. The GA4 model file is present here. It includes the sessions explore, the LookML dashboards, and a datagroup specific to this model.
- Views
- - BQML Sub-Folder contains the predictions.view file that creates the BQML propensity model. This view is commented-out by default. (See BQML under Notes)
- - Event Data Dimensions Sub-Folder contains views that are extended or unnested via the “Events” view in the parent folder.
- The remaining files are the primary views not directly related to Events.
- Other. manifest.lkml is present in the root directory, and is where the instance constants are defined.

## Model File
### Views
**“sessions.view”**
This is the base view of the sessions explore of the GA4 model. While GA4 is event based, the data has been sessionized to mimic the analytics available in GA360.   This was done with a SQL derived table, and the majority of dimensions  defined are direct references to output of the query. Some fields of note are:

- Audience Selector. This parameter is used in conjunction with the “Audience Trait” dimension, to dynamically update the content delivered on a report.
- Audience Trait. This dimension populates with content from other referenced dimensions, based on the selected value of the “Audience Selector” parameter.
- Landing/Exit Page. These dimensions sub-select within unnested event_data values to obtain the page_view events with the highest ‘page_view_rank’ and ‘reverse_page_view_rank’ values for each session.
- Session Attribution Channel. This dimension is calculated on values from various session attribution fields, and its definition is based on the default channel groupings defined here https://support.google.com/analytics/answer/9756891.
- Session Data Is Bounce?. “Bounce” is not a value present in the GA4 data. This determination is using session length, as all “single page view” sessions will also have a 0 session duration, fulfilling the requirements of traditional bounce determinations.
- GA4 BQML Fields. These three fields are used when generating the BQML purchase propensity model. By default, the prediction_window_days parameter value is set on the predictions.view file where needed. These fields are commented out by default (See BQML under Notes).

**“events.view”**
The events view brings together the event level data defined in the various event_data_dimensions views.  Additionally event-level dimensions and measures are defined in this view.

As the event data is a representation of the original source rows from your events_* tables, there are a mixture of single-value fields and simple nested fields, as well as  repeating key/value fields available within the unnested event_data fields. The single-value fields and simple nested fields are defined within this “events.view” file. The repeating key/value fields for the event parameters have been defined in “event_data_event_params.view”, and the repeating key/value fields for the user properties have been defined in “event_data_user_properties.view”. Both “event_data_event_params.view” and “event_data_user_properties.view” are extended into events.view.

The definition for a repeating key/value field uses the following format:
(SELECT value.*value_type* FROM UNNEST(*nested_field*) WHERE key = "*key_value*")


Here is an example of LookML used to define a nested dimension.
dimension: event_param_all_data {
  group_label: "Event: Parameters"
  label: "All Data"
  type: number
  sql: (SELECT value.double_value FROM UNNEST(event_params) WHERE key = "all_data") ;;
}

Using this method of sub-selecting allows a single row to return for an event with all event parameters selected in horizontally extending columns. If we were to unnest event_params directly and define the dimensions from the unnested results, there would be multiple rows per event:

| Row* | Key | String Value | Int Value | Double Value | Float Value |
|------|-----|--------------|------------|-------------|-------------|
| 1    |  a  |     null     |    null   |     1.1      |     null    |
| 2    |  b  |     abc      |    null   |     null     |     null    |
| 3    |  c  |     null     |    61     |     null     |     null    |
 *Row Implied

This is desired on some data, such as the nested ITEMS records. In the case of ITEMS, each nested record is a unique ITEM from the user's purchase, and expanding these into new rows makes sense for filtering and accurate aggregate measures.  However, for the purposes of analysis at the event-level, we want one row with columns representing all of these possible keys.

**“event_data_event_params.view”**
Each event parameter you enable on GA4 will need to have a new dimension and any applicable measures created. The dimensions included in this block correspond to the list of automatically tracked events listed here https://support.google.com/analytics/answer/9234069?hl=en.

If you are initiating the block with a large amount of custom event parameters already in place, it may be beneficial to obtain a list of them along with the value types that are populated:


Sample Query for obtaining a list of all event parameter keys and their respective values:

 ````
 SELECT  ep.key
 , case when count(value.string_value) > 0 then true else false end as string_value_populated
 , case when count(value.int_value) > 0 then true else false end as int_value_populated
 , case when count(value.double_value) > 0 then true else false end as double_value_populated
 , case when count(value.float_value) > 0 then true else false end as float_value_populated
 FROM \`YOUR\_PROJECT.GA4\_DATASET.events\_\*\` e
 , UNNEST(event_params) ep
 group by 1
 order by 1 asc
 ````
**“event_data_user_properties.view”**
Similar to the event parameters, user properties are likely to include custom attributes or tags.

**“goals.view”**
This file is to facilitate the creation of custom cohorts for analysis, based on any data available. It is another view file that is extended into “events.view”, and not directly referenced in the model file. By default, the goals are centered around the event name and the “page” value for that event. It is expected that these default goal points will be customized or expanded on with the addition of custom events and/or event parameters. Instructions on how to add new goals, or new variables to filter on in the goal dashboard, are provided in the view file.

**“page_data.view”**
Another file that is extended into “events.view”, and not referenced in the model directly. Page Data takes advantage of the ‘page_view_rank’ and ‘reverse_page_view_rank’ fields inserted during the initial CTE of the sessions table. These fields allow for analysis of ‘page_view’ events within a session without the need for another derived table.

Similar to how the landing and exit pages are obtained at the session-level, we are able to query within the scope of the session from within the unnested element. For example we can obtain the 3rd page view in a session with this dimension:

````
  dimension: page_path_3 {
    view_label: "Page Flow"
    group_label: "Page Path"
    description: "3rd Page in Session."
    type: string
    sql: (select coalesce(regexp_extract((select value.string_value from UNNEST(event_history.event_params) where key = "page_location"),r"(?:.*?[\.][^\/]*)([\/][^\?]+)"),'/')
    from UNNEST(${sessions.event_data}) as event_history
    where event_history.page_view_rank = 3
    and event_history.event_name = "page_view" limit 1) ;;
  }
 ```` 

If we look at the sql here, and remove the regular expression elements, this is what is occurring:
The sessions table is linked to the events table on the model on the SL_KEY.
When the UNNEST of event_data as event_history occurs, it happens from the scope of an event already associated with a session, and this unnesting is within the scope of the session (all unnested elements belong to the same SL_KEY).
The page_location value for the event in the session to which the original event belongs, and also has a page_view_rank of 3 is returned.
The process of looking “up” at the parent field, re-unnesting, and returning to the original event allows for horizontal columns of page activity to be returned for a single session.

This series of sub-selects defines the page flow, relative path, and relative reverse path of ‘page_view’ events. These have been defined up to 9 iterations (9 Path Dimensions, 9 Relative Path Dimensions, 9 Relative Reverse Path Dimensions), but there is no limit. Additional length to the path can be added by adjusting the iteration on the sql definition of the desired field.

**“event_path.view”**
The event_path.view file is structured similarly to the “page_data.view” file, with an emphasis on event_rank instead of page_view_rank. Functionally the definition of the dimensions are the same, and this view is likewise extended into “events.view” instead of being referenced directly in the model.

**“page_funnel.view”**
The Page Funnel view is extended into “sessions.view”. The dimensions and measures defined here are purpose-built for use with a Page View Funnel/Flow. The same extraction of pages by rank as was used in “page_data.view” is utilized here, with definitions up to 6 pages present by default.

The “tag” dimensions are what qualifies subsequent page views for inclusion in the resultset. If you filter for a value on Page 1, any subsequent page views that do not follow a qualifying “Page 1” event will be excluded from the measures defined in this view. This process repeats for all subsequently filtered page ranks (up to 6). This can be seen in the difference between the page_1_tag dimension and page_6_tag:

````
  dimension: page_1_tag {
    ...
    sql: case when {% condition page_1_filter %} ${page_1} {% endcondition %}
                     and ${page_1} is not null then 1 else 0 end ;;  }

  dimension: page_6_tag {
    ...
    sql: case when {% condition page_1_filter %} ${page_1} {% endcondition %}
               and {% condition page_2_filter %} ${page_2} {% endcondition %}
               and {% condition page_3_filter %} ${page_3} {% endcondition %}
               and {% condition page_4_filter %} ${page_4} {% endcondition %}
               and {% condition page_5_filter %} ${page_5} {% endcondition %}
               and {% condition page_6_filter %} ${page_6} {% endcondition %}
               and ${page_1} is not null and ${page_2} is not null and ${page_3} is not null
     and ${page_4} is not null and ${page_5} is not null and ${page_6} is not null
     then 1 else 0 end ;;  }
````

**“event_funnel.view”**
The event_funnel view is set up similarly to “page_funnel.view”, and is extended into “sessions.view” instead of being referenced in the model. As with the page_funnel, you can easily add/remove further iterations to the funnel by adding new dimensions with incrementing event_rank references. Due to the nature of the event data populated in GA4, it is possible for several (3 or more) events to fire with the exact same timestamp. For example: When a new user visits a site, they will generate “First Visit”, “Session Start”, and “Page View” events with identical event_timestamps. Due to this, the practicality of this funnel is limited without enhancing the event being pulled to include additional event parameters. Instead of “event_name”, another calculated dimension [such as “Full Event”] could be used, or additional filters to exclude events outside of the scope of the request could be added to increase the utility of this view.

## Customizations
* Event Parameters
Each Event Parameter you enable on GA4 will need to have a new dimension and any applicable measures created, the dimensions included in this block correspond to the list of automatically tracked events [here] (https://support.google.com/analytics/answer/9234069?hl=en).

Sample Query for obtaining a list of all event parameter keys and what value they use:
```
 SELECT  ep.key
 , case when count(value.string_value) > 0 then true else false end as string_value_populated
 , case when count(value.int_value) > 0 then true else false end as int_value_populated
 , case when count(value.double_value) > 0 then true else false end as double_value_populated
 , case when count(value.float_value) > 0 then true else false end as float_value_populated
 FROM \`YOUR\_PROJECT.GA4\_DATASET.events\_\*\` e
 , UNNEST(event_params) ep
 group by 1
 order by 1 asc
```

* Goals
The Custom Goal Conversions by default are only focused on Event Type and Page Name. Typically the goals would include fields that are populated in instance-specific event parameters. To enable new goal filters, please see the goals.view file for guidance.

## Notes and Other Known Issues

* The initial run of the Incremental Persistent Derived Table will execute with a where clause of "WHERE 1=1". This will query all historical data in your GA4 Dataset across all date-partitioned tables. If you do not wish to have all historical data, you can add a hard date filter to the where clause within the "session\_list\_with\_event\_history" cte on sessions.view's derived table definition.
* If you are utilizing user\_id instead of user\_pseudo\_id, you will need to replace references to the user\_pseudo\_id with user\_id in the derived key ("sl\_key") definition in sessions.view's derived table definition, and in the user-centric measure definitions.
* BQML Customer Purchase Propensity Score: This block includes a demonstration of utilizing GA4 data to train a BQML customer purchase propensity score. To ease implementation costs, this has been commented-out by default. To implement this feature, uncomment the BQML View Files and BQML Fields on the sessions.view file.
* For GA360 Users migrating to GA4: Not all fields are the same as in the UI due to GA4's integration of mobile apps. The Incremental Persistent Derived Table will help you navigate through the fields you are already familiarized with.

## Coming Soon
1. Leverage advanced analytics to be able to predict which customers are likely to make another purchase in the future based off of their historical actions.
2. Better understand your customers by looking at their natural pathing through pages and events through your pages alongside the ability to create completely custom page and event paths to conduct any A/B testing to see how customers are trending.
3. You can look at the successes of your marketing campaigns as well by using the campaign impact dashboard to identify a specific cohort of customers you targeted with a campaign and seeing how that particular customer base has trended over time to see if the campaign had any effect.
4. Looker will offer an out of the box data action to enable you to push data back into your GA console.
