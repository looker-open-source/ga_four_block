- dashboard: ga4_event_funnel
  title: "[GA4] Event Funnel"
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Event Funnel
    name: Event Funnel
    model: ga4
    explore: sessions
    type: looker_column
    fields: [sessions.audience_trait, sessions.count_of_event_1, sessions.count_of_event_2,
      sessions.count_of_event_3, sessions.count_of_event_4, sessions.count_of_event_5,
      sessions.count_of_event_6]
    sorts: [sessions.count_of_event_1 desc]
    limit: 12
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
    trellis: row
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
    series_types: {}
    show_dropoff: true
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Landing Page: sessions.landing_page
      Audience Selector: sessions.audience_selector
      Event 1: sessions.event_1_filter
      Event 2: sessions.event_2_filter
      Event 3: sessions.event_3_filter
      Event 4: sessions.event_4_filter
      Event 5: sessions.event_5_filter
      Event 6: sessions.event_6_filter
      Goal Event: events.event_name
    row: 4
    col: 0
    width: 24
    height: 14
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div  style=\"text-align: center;\">\n\t<div>\n\t\t<h1 style=\"font-size:\
      \ 28px;\">GA4 Event Flow  Event Funnel</h1><h2 style=\"font-size: 16px;\">What\
      \ are customers clicking on our site?\n<br><b>Recommended Action</b>\U0001f447\
      \ Update the filters above to create your own custom event flow. Alter the audience\
      \ cohort to dynamically view your funnel.</h2></div>\n</div>"
    row: 0
    col: 0
    width: 24
    height: 4
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div  style=\"text-align: center;\">\n\t<div><h1 style=\"font-size:\
      \ 20px;\"><b>Customer Event Flow</b><br></h1><h2 style=\"font-size: 16px;\"\
      >What are customers clicking before our conversion event?<br><b>\nRecommended\
      \ Action</b>\U0001f447 Use the Goal Event filter at the top to choose a conversion\
      \ event.\n</h2></div>\n</div>"
    row: 18
    col: 0
    width: 24
    height: 4
  - title: Event Action % of Total Funnel
    name: Event Action % of Total Funnel
    model: ga4
    explore: sessions
    type: looker_column
    fields: [sessions.count_of_event_1, sessions.count_of_event_2, sessions.count_of_event_3,
      sessions.count_of_event_4, sessions.count_of_event_5, sessions.count_of_event_6]
    sorts: [sessions.count_of_event_1 desc]
    limit: 12
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
    series_types: {}
    show_dropoff: true
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Landing Page: sessions.landing_page
      Audience Selector: sessions.audience_selector
      Event 1: sessions.event_1_filter
      Event 2: sessions.event_2_filter
      Event 3: sessions.event_3_filter
      Event 4: sessions.event_4_filter
      Event 5: sessions.event_5_filter
      Event 6: sessions.event_6_filter
      Goal Event: events.event_name
    row: 22
    col: 0
    width: 24
    height: 8
  - title: Event Flow
    name: Event Flow
    model: ga4
    explore: sessions
    type: looker_grid
    fields: [events.event_name, events.current_event_plus_1, events.current_event_plus_2,
      events.current_event_plus_3, events.current_event_plus_4, events.current_event_plus_5,
      events.current_event_plus_6, sessions.total_sessions]
    sorts: [sessions.total_sessions desc]
    limit: 12
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    series_types: {}
    show_dropoff: true
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Landing Page: sessions.landing_page
      Audience Selector: sessions.audience_selector
      Goal Event: events.event_name
    row: 30
    col: 0
    width: 24
    height: 7
  filters:
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
  - name: Event 1
    title: Event 1
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
    field: sessions.event_1_filter
  - name: Event 2
    title: Event 2
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
    field: sessions.event_2_filter
  - name: Event 3
    title: Event 3
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
    field: sessions.event_3_filter
  - name: Event 4
    title: Event 4
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
    field: sessions.event_4_filter
  - name: Event 5
    title: Event 5
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
    field: sessions.event_5_filter
  - name: Event 6
    title: Event 6
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
    field: sessions.event_6_filter
  - name: Goal Event
    title: Goal Event
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
    field: events.event_name
  - name: Audience Selector
    title: Audience Selector
    type: field_filter
    default_value: Device
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
      options: []
    model: ga4
    explore: sessions
    listens_to_filters: []
    field: sessions.audience_selector
