- dashboard: behavior
  title: "[GA4] Behavior"
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Page Views
    name: Page Views
    model: ga4
    explore: sessions
    type: single_value
    fields: [events.total_page_views, events.total_unique_page_views]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#FFF"
    comparison_label: Unique Page Views
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#c73727",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 7
    col: 0
    width: 24
    height: 4
  - title: Top Pages
    name: Top Pages
    model: ga4
    explore: sessions
    type: looker_bar
    fields: [events.total_page_views, events.total_unique_page_views, events.event_param_page]
    filters:
      events.event_param_page: "-EMPTY"
    sorts: [events.total_page_views desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: events.total_page_views,
            id: events.total_page_views, name: Total Page Views}, {axisId: events.total_unique_page_views,
            id: events.total_unique_page_views, name: Total Unique Page Views}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    size_by_field: event_data.total_unique_page_views
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    series_types:
      events.total_unique_page_views: scatter
    series_colors:
      events.total_page_views: "#B31412"
      events.total_unique_page_views: "#BDC1C6"
    label_color: ["#B31412", transparent]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#FFF"
    comparison_label: Unique Page Views
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#c73727",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    listen:
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 11
    col: 0
    width: 10
    height: 10
  - title: Top Page Detail
    name: Top Page Detail
    model: ga4
    explore: sessions
    type: looker_grid
    fields: [events.event_param_page, events.total_page_views, events.total_unique_page_views,
      events.average_time_to_next_page, events.entrance_rate, events.bounce_rate,
      events.exit_rate]
    filters:
      events.event_param_page: "-EMPTY"
    sorts: [events.total_page_views desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      event_data.total_page_views:
        is_active: false
      event_data.total_unique_page_views:
        is_active: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#c73727",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: 2c56dd64-603d-8884-bf2c-89e6eeba3863, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: "#EA4335", offset: 50},
              {color: "#B31412", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: percentile, value: 10}, max: {type: percentile, value: 99}}}},
        bold: false, italic: false, strikethrough: false, fields: [events.bounce_rate,
          events.exit_rate]}, {type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: 0f27b0fc-14e6-c15e-9c53-7b0f52ed85b4, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: "#34A853", offset: 50},
              {color: "#137333", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: middle}, max: {type: percentile, value: 99}},
            mirror: false, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [events.entrance_rate]}, {type: along a scale...,
        value: !!null '', background_color: "#1A73E8", font_color: !!null '', color_application: {
          collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
          options: {steps: 5, constraints: {min: {type: percentile, value: 1}, mid: {
                type: middle}, max: {type: percentile, value: 99}}, mirror: false,
            reverse: false, stepped: false}}, bold: false, italic: false, strikethrough: false,
        fields: [events.average_time_to_next_page]}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: events.total_page_views,
            id: events.total_page_views, name: Total Page Views}, {axisId: events.total_unique_page_views,
            id: events.total_unique_page_views, name: Total Unique Page Views}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    size_by_field: event_data.total_unique_page_views
    series_types: {}
    series_colors:
      events.total_page_views: "#B31412"
      events.total_unique_page_views: "#BDC1C6"
    label_color: ["#B31412", transparent]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    custom_color: "#FFF"
    comparison_label: Unique Page Views
    defaults_version: 1
    hidden_fields: []
    listen:
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 11
    col: 10
    width: 14
    height: 10
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "---\n<div  style=\"text-align: center;\">\n\t<div>\n\t\t<h1 style=\"\
      font-size: 28px;\">Landing Pages</h1></div>\n</div>"
    row: 21
    col: 0
    width: 24
    height: 3
  - title: Top Landing Page
    name: Top Landing Page
    model: ga4
    explore: sessions
    type: looker_bar
    fields: [sessions.total_sessions, sessions.landing_page, sessions.percentage_new_users]
    sorts: [sessions.total_sessions desc]
    limit: 500
    column_limit: 50
    filter_expression: ${sessions.landing_page} != "null"
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: sessions.total_sessions,
            id: sessions.total_sessions, name: Total Sessions}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: bottom, series: [{axisId: sessions.percentage_new_users,
            id: sessions.percentage_new_users, name: Total New Users - Percentage}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    size_by_field: ''
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hidden_series: [of_total]
    series_types:
      sessions.percentage_new_users: scatter
    series_colors:
      sessions.total_sessions: "#F9AB00"
      of_total: "#facb04"
      sessions.percentage_new_users: "#1A73E8"
    label_color: ["#FBBC04", transparent]
    defaults_version: 1
    hidden_fields: []
    listen:
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 24
    col: 0
    width: 10
    height: 14
  - title: Landing Page Detail
    name: Landing Page Detail
    model: ga4
    explore: sessions
    type: looker_grid
    fields: [sessions.landing_page, sessions.total_sessions, events.total_purchase_revenue_usd,
      events.transaction_conversion_rate, sessions.total_bounced_sessions_percentage,
      sessions.total_first_visit_sessions_percentage, sessions.average_session_duration,
      sessions.average_page_views_per_session]
    filters: {}
    sorts: [sessions.total_sessions desc]
    limit: 500
    filter_expression: ${sessions.landing_page} != "null"
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      sessions.total_sessions: Sessions
      sessions.total_first_visit_sessions_percentage: New Session %
      sessions.average_session_duration: Avg. Session Duration
      sessions.average_page_views_per_session: Avg. Pages/Session
      sessions.total_bounced_sessions_percentage: Bounce Rate
      events.total_purchase_revenue_usd: Total Transaction Revenue (USD)
      events.transaction_conversion_rate: Transaction Conversion Rate
    series_column_widths:
      page_entrance_exit.landing_page: 400
    series_cell_visualizations:
      sessions.total_sessions:
        is_active: false
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '20'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: fa3c8c8a-897c-aa1c-b569-cd8ca8fb0929, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: "#EA4335", offset: 50},
              {color: "#B31412", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: percentile, value: 10}, mid: {type: middle}, max: {type: percentile,
                value: 99}}, mirror: false, reverse: false, stepped: false}}, bold: false,
        italic: false, strikethrough: false, fields: [sessions.total_bounced_sessions_percentage]},
      {type: along a scale..., value: !!null '', background_color: "#1A73E8", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, custom: {
            id: 75d8e36b-a316-d634-6acd-3178ba62b4e7, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: "#34A853", offset: 50},
              {color: "#137333", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: middle}, max: {type: percentile, value: 99}},
            mirror: false, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [events.total_purchase_revenue_usd]}, {type: along
          a scale..., value: !!null '', background_color: "#1A73E8", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, custom: {
            id: 913646fc-3538-c9f1-92b6-326d34356927, label: Custom, type: continuous,
            stops: [{color: "#FFFFFF", offset: 0}, {color: "#34A853", offset: 50},
              {color: "#137333", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: middle}, max: {type: percentile, value: 99}},
            mirror: false, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [events.transaction_conversion_rate]}, {type: along
          a scale..., value: !!null '', background_color: "#1A73E8", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
          options: {steps: 5, constraints: {min: {type: percentile, value: 1}, mid: {
                type: middle}, max: {type: percentile, value: 99}}, mirror: false,
            reverse: false, stepped: false}}, bold: false, italic: false, strikethrough: false,
        fields: [sessions.total_first_visit_sessions_percentage]}, {type: along a
          scale..., value: !!null '', background_color: "#1A73E8", font_color: !!null '',
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab,
          options: {steps: 5, constraints: {min: {type: percentile, value: 1}, mid: {
                type: middle}, max: {type: percentile, value: 99}}, mirror: false,
            reverse: false, stepped: false}}, bold: false, italic: false, strikethrough: false,
        fields: [sessions.average_session_duration]}, {type: along a scale..., value: !!null '',
        background_color: "#1A73E8", font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: middle}, max: {type: percentile, value: 99}},
            mirror: false, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [sessions.average_page_views_per_session]}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 24
    col: 10
    width: 14
    height: 14
  - title: Top Keyword Searches
    name: Top Keyword Searches
    model: ga4
    explore: sessions
    type: looker_bar
    fields: [sessions.total_sessions, events.event_param_term]
    filters: {}
    sorts: [sessions.total_sessions desc]
    limit: 500
    column_limit: 50
    filter_expression: ${events.event_param_term} != "null"
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: sessions.total_sessions,
            id: sessions.total_sessions, name: Total Sessions}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: bottom, series: [{axisId: sessions.percentage_new_users,
            id: sessions.percentage_new_users, name: Total New Users - Percentage}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    size_by_field: ''
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hidden_series: [of_total]
    series_types:
      sessions.percentage_new_users: scatter
    series_colors:
      sessions.total_sessions: "#F9AB00"
      of_total: "#facb04"
      sessions.percentage_new_users: "#1A73E8"
    label_color: ["#FBBC04", transparent]
    defaults_version: 1
    hidden_fields: []
    listen:
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 42
    col: 0
    width: 12
    height: 10
  - title: Top Events
    name: Top Events
    model: ga4
    explore: sessions
    type: looker_bar
    fields: [events.total_events, events.total_unique_events, events.full_event]
    filters: {}
    sorts: [events.total_events desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: true
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: events.total_events,
            id: events.total_events, name: Total Events}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: bottom, series: [{axisId: events.total_unique_events,
            id: events.total_unique_events, name: Total Unique Events}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    series_types:
      events.total_unique_events: scatter
    series_colors:
      events.total_events: "#F9AB00"
      events.total_unique_events: "#1A73E8"
    defaults_version: 1
    hidden_fields: []
    listen:
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 42
    col: 12
    width: 12
    height: 10
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "\n<div  style=\"text-align: center;\">\n\t<div>\n\t\t<h1 style=\"\
      font-size: 28px;\">Events</h1><h2 style=\"font-size: 16px;\">Event Name + Event\
      \ Page</h2></div>\n</div>"
    row: 38
    col: 12
    width: 12
    height: 4
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div  style=\"text-align: center;\">\n\t<div>\n\t\t<h1 style=\"font-size:\
      \ 28px;\">Keywords</h1><h2 style=\"font-size: 16px;\">Keyword of the traffic\
      \ source, usually set when the medium is “organic” or “cpc” (i.e. What phrase\
      \ did they search to get to find the website?)</h2></div>\n</div>"
    row: 38
    col: 0
    width: 12
    height: 4
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div style=\"border: solid 1px #1A73E8; border-radius: 5px; padding:\
    \ 3px 10px; background: #eaf1fe; text-align: center; margin-bottom: 10px;\"\
    >\n\t<div>\n\t\t<img style=\"height: 60px; margin-top: 30px;\" src=\"https://www.gstatic.com/analytics-suite/header/suite/v2/ic_analytics.svg\"\
    />\n\t</div><br>\n<nav style=\"font-size: 18px; position: absolute; bottom:\
    \ 0; text-align: center;\">\n  <a style=\"padding: 5px; line-height: 40px;\"\
    \ href=\"/dashboards-next/ga4::overview\">\n  \t<svg style=\"height: 16px; fill: #4285F4;\" class=\"\
    svg-icon\" viewBox=\"0 0 20 20\">\n\t\t\t\t\t\t\t<path d=\"M17.431,2.156h-3.715c-0.228,0-0.413,0.186-0.413,0.413v6.973h-2.89V6.687c0-0.229-0.186-0.413-0.413-0.413H6.285c-0.228,0-0.413,0.184-0.413,0.413v6.388H2.569c-0.227,0-0.413,0.187-0.413,0.413v3.942c0,0.228,0.186,0.413,0.413,0.413h14.862c0.228,0,0.413-0.186,0.413-0.413V2.569C17.844,2.342,17.658,2.156,17.431,2.156\
    \ M5.872,17.019h-2.89v-3.117h2.89V17.019zM9.587,17.019h-2.89V7.1h2.89V17.019z\
    \ M13.303,17.019h-2.89v-6.651h2.89V17.019z M17.019,17.019h-2.891V2.982h2.891V17.019z\"\
    ></path>\n</svg>\nGA Overview</a>\n<a style=\"padding: 5px; line-height: 40px;\"\
    \ href=\"/dashboards-next/ga4::audience\">\n<svg style=\"height: 16px; fill: #4285F4;\" class=\"svg-icon\"\
    \ viewBox=\"0 0 20 20\">\n<path d=\"M12.075,10.812c1.358-0.853,2.242-2.507,2.242-4.037c0-2.181-1.795-4.618-4.198-4.618S5.921,4.594,5.921,6.775c0,1.53,0.884,3.185,2.242,4.037c-3.222,0.865-5.6,3.807-5.6,7.298c0,0.23,0.189,0.42,0.42,0.42h14.273c0.23,0,0.42-0.189,0.42-0.42C17.676,14.619,15.297,11.677,12.075,10.812\
    \ M6.761,6.775c0-2.162,1.773-3.778,3.358-3.778s3.359,1.616,3.359,3.778c0,2.162-1.774,3.778-3.359,3.778S6.761,8.937,6.761,6.775\
    \ M3.415,17.69c0.218-3.51,3.142-6.297,6.704-6.297c3.562,0,6.486,2.787,6.705,6.297H3.415z\"\
    ></path>\n</svg>\nAudience</a>\n<a style=\"padding: 5px; line-height: 40px;\"\
    \ href=\"/dashboards-next/ga4::acquisition\">\n<svg style=\"height: 16px; fill: #4285F4;\" class=\"svg-icon\"\
    \ viewBox=\"0 0 20 20\">\n<path d=\"M8.749,9.934c0,0.247-0.202,0.449-0.449,0.449H4.257c-0.247,0-0.449-0.202-0.449-0.449S4.01,9.484,4.257,9.484H8.3C8.547,9.484,8.749,9.687,8.749,9.934\
    \ M7.402,12.627H4.257c-0.247,0-0.449,0.202-0.449,0.449s0.202,0.449,0.449,0.449h3.145c0.247,0,0.449-0.202,0.449-0.449S7.648,12.627,7.402,12.627\
    \ M8.3,6.339H4.257c-0.247,0-0.449,0.202-0.449,0.449c0,0.247,0.202,0.449,0.449,0.449H8.3c0.247,0,0.449-0.202,0.449-0.449C8.749,6.541,8.547,6.339,8.3,6.339\
    \ M18.631,4.543v10.78c0,0.248-0.202,0.45-0.449,0.45H2.011c-0.247,0-0.449-0.202-0.449-0.45V4.543c0-0.247,0.202-0.449,0.449-0.449h16.17C18.429,4.094,18.631,4.296,18.631,4.543\
    \ M17.732,4.993H2.46v9.882h15.272V4.993z M16.371,13.078c0,0.247-0.202,0.449-0.449,0.449H9.646c-0.247,0-0.449-0.202-0.449-0.449c0-1.479,0.883-2.747,2.162-3.299c-0.434-0.418-0.714-1.008-0.714-1.642c0-1.197,0.997-2.246,2.133-2.246s2.134,1.049,2.134,2.246c0,0.634-0.28,1.224-0.714,1.642C15.475,10.331,16.371,11.6,16.371,13.078M11.542,8.137c0,0.622,0.539,1.348,1.235,1.348s1.235-0.726,1.235-1.348c0-0.622-0.539-1.348-1.235-1.348S11.542,7.515,11.542,8.137\
    \ M15.435,12.629c-0.214-1.273-1.323-2.246-2.657-2.246s-2.431,0.973-2.644,2.246H15.435z\"\
    ></path>\n</svg>\nAcquisition</a>\n<a style=\"padding: 5px; line-height: 40px;\"\
    \ href=\"/dashboards-next/ga4::behavior\">\n<svg  style=\"height: 16px; fill: #4285F4;\" class=\"\
    svg-icon\" viewBox=\"0 0 20 20\">\n<path d=\"M17.237,3.056H2.93c-0.694,0-1.263,0.568-1.263,1.263v8.837c0,0.694,0.568,1.263,1.263,1.263h4.629v0.879c-0.015,0.086-0.183,0.306-0.273,0.423c-0.223,0.293-0.455,0.592-0.293,0.92c0.07,0.139,0.226,0.303,0.577,0.303h4.819c0.208,0,0.696,0,0.862-0.379c0.162-0.37-0.124-0.682-0.374-0.955c-0.089-0.097-0.231-0.252-0.268-0.328v-0.862h4.629c0.694,0,1.263-0.568,1.263-1.263V4.319C18.5,3.625,17.932,3.056,17.237,3.056\
    \ M8.053,16.102C8.232,15.862,8.4,15.597,8.4,15.309v-0.89h3.366v0.89c0,0.303,0.211,0.562,0.419,0.793H8.053z\
    \ M17.658,13.156c0,0.228-0.193,0.421-0.421,0.421H2.93c-0.228,0-0.421-0.193-0.421-0.421v-1.263h15.149V13.156z\
    \ M17.658,11.052H2.509V4.319c0-0.228,0.193-0.421,0.421-0.421h14.308c0.228,0,0.421,0.193,0.421,0.421V11.052z\"\
    ></path>\n</svg>\nBehavior</a>\n<a style=\"padding: 5px; line-height: 40px;\"\
    \ href=\"/dashboards-next/ga4::custom_goal_conversions\">\n<svg  style=\"height: 16px; fill: #4285F4;\" class=\"\
    svg-icon\" viewBox=\"0 0 20 20\">\n<path d=\"M15.94,10.179l-2.437-0.325l1.62-7.379c0.047-0.235-0.132-0.458-0.372-0.458H5.25c-0.241,0-0.42,0.223-0.373,0.458l1.634,7.376L4.06,10.179c-0.312,0.041-0.446,0.425-0.214,0.649l2.864,2.759l-0.724,3.947c-0.058,0.315,0.277,0.554,0.559,0.401l3.457-1.916l3.456,1.916c-0.419-0.238,0.56,0.439,0.56-0.401l-0.725-3.947l2.863-2.759C16.388,10.604,16.254,10.22,15.94,10.179M10.381,2.778h3.902l-1.536,6.977L12.036,9.66l-1.655-3.546V2.778z\
    \ M5.717,2.778h3.903v3.335L7.965,9.66L7.268,9.753L5.717,2.778zM12.618,13.182c-0.092,0.088-0.134,0.217-0.11,0.343l0.615,3.356l-2.938-1.629c-0.057-0.03-0.122-0.048-0.184-0.048c-0.063,0-0.128,0.018-0.185,0.048l-2.938,1.629l0.616-3.356c0.022-0.126-0.019-0.255-0.11-0.343l-2.441-2.354l3.329-0.441c0.128-0.017,0.24-0.099,0.295-0.215l1.435-3.073l1.435,3.073c0.055,0.116,0.167,0.198,0.294,0.215l3.329,0.441L12.618,13.182z\"\
    ></path>\n</svg>\nConversions</a>\n<a style=\"padding: 5px; line-height: 40px;\"\
    \ href=\"/dashboards-next/ga4::propensity_model\">\n<svg  style=\"height: 16px; fill: #4285F4;\" class=\"\
    svg-icon\" viewBox=\"0 0 20 20\">\n<path d=\"M15.94,10.179l-2.437-0.325l1.62-7.379c0.047-0.235-0.132-0.458-0.372-0.458H5.25c-0.241,0-0.42,0.223-0.373,0.458l1.634,7.376L4.06,10.179c-0.312,0.041-0.446,0.425-0.214,0.649l2.864,2.759l-0.724,3.947c-0.058,0.315,0.277,0.554,0.559,0.401l3.457-1.916l3.456,1.916c-0.419-0.238,0.56,0.439,0.56-0.401l-0.725-3.947l2.863-2.759C16.388,10.604,16.254,10.22,15.94,10.179M10.381,2.778h3.902l-1.536,6.977L12.036,9.66l-1.655-3.546V2.778z\
    \ M5.717,2.778h3.903v3.335L7.965,9.66L7.268,9.753L5.717,2.778zM12.618,13.182c-0.092,0.088-0.134,0.217-0.11,0.343l0.615,3.356l-2.938-1.629c-0.057-0.03-0.122-0.048-0.184-0.048c-0.063,0-0.128,0.018-0.185,0.048l-2.938,1.629l0.616-3.356c0.022-0.126-0.019-0.255-0.11-0.343l-2.441-2.354l3.329-0.441c0.128-0.017,0.24-0.099,0.295-0.215l1.435-3.073l1.435,3.073c0.055,0.116,0.167,0.198,0.294,0.215l3.329,0.441L12.618,13.182z\"\
    ></path>\n</svg>\nModels</a>\n</nav>\n</div>"
    row: 0
    col: 0
    width: 24
    height: 4
  - name: " (5)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "---\n<div  style=\"text-align: center;\">\n\t<div>\n\t\t<h1 style=\"\
      font-size: 28px;\">Behavior</h1></div>\n</div>"
    row: 4
    col: 0
    width: 24
    height: 3
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: ga4
    explore: sessions
    listens_to_filters: []
    field: sessions.session_date
  - name: Landing Page
    title: Landing Page
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: ga4
    explore: sessions
    listens_to_filters: []
    field: sessions.landing_page
