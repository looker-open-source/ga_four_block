
- dashboard: ga4_page_funnel
  title: "[GA4] Page Funnel"
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Page Funnel
    name: Page Funnel
    model: ga4
    explore: sessions
    type: looker_column
    fields: [sessions.audience_trait, sessions.count_of_page_1, sessions.count_of_page_2,
      sessions.count_of_page_3, sessions.count_of_page_4, sessions.count_of_page_5,
      sessions.count_of_page_6]
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
      Session Date: sessions.session_date
      Host Name: events.event_param_host
      Audience Selector: sessions.audience_selector
      Page 3: sessions.page_3_filter
      Page 2: sessions.page_2_filter
      Page 1: sessions.page_1_filter
      Page 4: sessions.page_4_filter
      Page 5: sessions.page_5_filter
      Page 6: sessions.page_6_filter
    row: 4
    col: 0
    width: 24
    height: 14
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div  style=\"text-align: center;\">\n\t<div>\n\t\t<h1 style=\"font-size:\
      \ 28px;\">GA4 Page Pathing Page Funnel</h1><h2 style=\"font-size: 16px;\">How\
      \ are customers moving through our site?<br><b>Recommended Action</b>\U0001f447\
      Update the filters above to create your own custom path pathing funnel. Then\
      \ link from any page in the funnel to see what actions occur on that page.</h2></div>\n\
      </div>"
    row: 0
    col: 0
    width: 24
    height: 4
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div  style=\"text-align: center;\">\n\t<div><h1 style=\"font-size:\
      \ 20px;\"><b>Page Path Funnel</b><br></h1><h2 style=\"font-size: 16px;\">How\
      \ are people moving through the website as a % of Total<br><b>\nRecommended\
      \ Action</b>\U0001f447 Use the page filters at the top to define the different\
      \ steps in the funnel.\n</h2></div>\n</div>"
    row: 18
    col: 0
    width: 24
    height: 4
  - title: Page Path Funnel % of Total
    name: Page Path Funnel % of Total
    model: ga4
    explore: sessions
    type: looker_column
    fields: [sessions.count_of_page_1, sessions.count_of_page_2, sessions.count_of_page_3,
      sessions.count_of_page_4, sessions.count_of_page_5, sessions.count_of_page_6]
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
      Session Date: sessions.session_date
      Host Name: events.event_param_host
      Audience Selector: sessions.audience_selector
      Page 3: sessions.page_3_filter
      Page 2: sessions.page_2_filter
      Page 1: sessions.page_1_filter
      Page 4: sessions.page_4_filter
      Page 5: sessions.page_5_filter
      Page 6: sessions.page_6_filter
    row: 22
    col: 0
    width: 24
    height: 8
  - title: Top Page Paths
    name: Top Page Paths
    model: ga4
    explore: sessions
    type: looker_grid
    fields: [sessions.total_sessions, events.event_param_page, events.current_page_plus_1,
      events.current_page_plus_2, events.current_page_plus_3, events.current_page_plus_4,
      events.current_page_plus_5, events.current_page_plus_6]
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
      Session Date: sessions.session_date
      Host Name: events.event_param_host
      Audience Selector: sessions.audience_selector
    row: 34
    col: 0
    width: 24
    height: 7
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div  style=\"text-align: center;\">\n\t<div><h1 style=\"font-size:\
      \ 20px;\"><b>Natural Page Path</b><br></h1><h2 style=\"font-size: 16px;\">How\
      \ are users naturally flowing through the site?<br><b>\nRecommended Action</b>\U0001f447\
      \ Drill in to see the breakdown by source medium.\n</h2></div>\n</div>"
    row: 30
    col: 0
    width: 24
    height: 4
  filters:
  - name: Session Date
    title: Session Date
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
  - name: Host Name
    title: Host Name
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
    field: events.event_param_host
  - name: Page 1
    title: Page 1
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
    field: sessions.page_1_filter
  - name: Page 2
    title: Page 2
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
    field: sessions.page_2_filter
  - name: Page 3
    title: Page 3
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
    field: sessions.page_3_filter
  - name: Page 4
    title: Page 4
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
    field: sessions.page_4_filter
  - name: Page 5
    title: Page 5
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
    field: sessions.page_5_filter
  - name: Page 6
    title: Page 6
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
    field: sessions.page_6_filter
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
