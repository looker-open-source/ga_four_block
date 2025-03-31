- dashboard: custom_goal_conversions
  title: "[GA4] Custom Goal Conversions"
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div  style=\"text-align: center;\">\n\t<div>\n\t\t<h1 style=\"font-size:\
      \ 28px;\">Custom Conversions</h1><h2 style=\"font-size: 16px;\"><b>Instructions:</b>\
      \ Select any permutation of <b>Event Name</b> and/or <b>Page</b> filters at\
      \ the top to select your goal(s). Then click the <b>Load/Update</b> button at\
      \ the top right.\n<br>\n<b>Optional:</b> Update <b>Audience Selector</b> filter\
      \ to update the Conversion Rate by Audience Cohort tile</h2></div>\n</div>\n"
    row: 4
    col: 0
    width: 24
    height: 4
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "---\n<div  style=\"text-align: center;\">\n\t<div><h2 style=\"font-size:\
      \ 16px;\">Sessions that have at least one goal completed compared to total sessions\
      \ in timeframe</h2></div>\n</div>\n"
    row: 8
    col: 0
    width: 24
    height: 2
  - title: Sessions
    name: Sessions
    model: ga4
    explore: sessions
    type: single_value
    fields: [sessions.total_sessions]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: legacy
      palette_id: looker_classic
    custom_color: "#FFF"
    single_value_title: Sessions
    comparison_label: First Visit Sessions
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#F9AB00",
        font_color: "#FFF", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
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
    listen:
      'Goal: Event Name': events.event_name_goal_selection
      'Goal: Event Page': events.page_goal_selection
      Audience Selector: sessions.audience_selector
      Session Date: sessions.session_date
    row: 10
    col: 0
    width: 14
    height: 2
  - title: Sessions with Conversion
    name: Sessions with Conversion
    model: ga4
    explore: sessions
    type: single_value
    fields: [events.sessions_with_conversions]
    sorts: [events.sessions_with_conversions desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: events.sessions_with_conversions,
            id: events.sessions_with_conversions, name: Sessions with Conversion}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: bottom,
        series: [{axisId: event_data.session_conversion_rate, id: event_data.session_conversion_rate,
            name: Session Conversion Rate}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    series_types: {}
    point_style: circle
    series_colors:
      event_data.session_conversion_rate: "#4285F4"
      events.sessions_with_conversions: "#34A853"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color: "#FFF"
    single_value_title: Converting Sessions
    comparison_label: First Visit Sessions
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: "#FFF", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    listen:
      'Goal: Event Name': events.event_name_goal_selection
      'Goal: Event Page': events.page_goal_selection
      Audience Selector: sessions.audience_selector
      Session Date: sessions.session_date
    row: 10
    col: 14
    width: 5
    height: 2
  - title: Session CNV Rate
    name: Session CNV Rate
    model: ga4
    explore: sessions
    type: single_value
    fields: [events.session_conversion_rate]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    custom_color: "#FFF"
    single_value_title: Session CNV Rate
    comparison_label: First Visit Sessions
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#1A73E8",
        font_color: "#FFF", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
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
      'Goal: Event Name': events.event_name_goal_selection
      'Goal: Event Page': events.page_goal_selection
      Audience Selector: sessions.audience_selector
      Session Date: sessions.session_date
    row: 10
    col: 19
    width: 5
    height: 2
  - title: Custom Goal Conversion Rate
    name: Custom Goal Conversion Rate
    model: ga4
    explore: sessions
    type: looker_column
    fields: [sessions.total_sessions, sessions.session_date, events.has_completed_goal]
    pivots: [events.has_completed_goal]
    fill_fields: [sessions.session_date, events.has_completed_goal]
    sorts: [events.has_completed_goal, sessions.total_sessions 2]
    limit: 500
    column_limit: 50
    row_total: right
    dynamic_fields: [{table_calculation: rolling_7_day_conversion_rate, label: Rolling
          7-day Conversion Rate, expression: "pivot_where(\n  ${events.has_completed_goal}=yes\n\
          \  , mean(\n    offset_list(${sessions.total_sessions}/${sessions.total_sessions:row_total},-6,7)\n\
          \  )\n)", value_format: !!null '', value_format_name: percent_0, _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: sessions, label: Sessions, expression: "${sessions.total_sessions}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    y_axes: [{label: '', orientation: left, series: [{axisId: No - sessions, id: No
              - sessions, name: Sessions}, {axisId: Yes - sessions, id: Yes - sessions,
            name: Sessions with Conversion}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: rolling_7_day_conversion_rate,
            id: rolling_7_day_conversion_rate, name: Rolling 7-day Conversion Rate}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    hidden_series: [Row Total - sessions.total_sessions]
    series_types:
      Row Total - sessions.total_sessions: scatter
      rolling_7_day_conversion_rate: line
    series_colors:
      Row Total - sessions.total_sessions: "#e3e6e0"
      Yes - sessions: "#34A853"
      No - sessions: "#FBBC04"
      rolling_7_day_conversion_rate: "#1A73E8"
    series_labels:
      No - sessions: Sessions
      Yes - sessions: Sessions with Conversion
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#FFF"
    single_value_title: Converting Sessions
    comparison_label: First Visit Sessions
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: "#FFF", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    hidden_fields: [sessions.total_sessions]
    listen:
      'Goal: Event Name': events.event_name_goal_selection
      'Goal: Event Page': events.page_goal_selection
      Audience Selector: sessions.audience_selector
      Session Date: sessions.session_date
    row: 12
    col: 0
    width: 14
    height: 10
  - title: Session Conversion Rate by Audience Cohort
    name: Session Conversion Rate by Audience Cohort
    model: ga4
    explore: sessions
    type: looker_bar
    fields: [events.sessions_with_conversions, sessions.audience_trait, events.session_conversion_rate]
    sorts: [events.sessions_with_conversions desc]
    limit: 500
    column_limit: 50
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    y_axes: [{label: '', orientation: bottom, series: [{axisId: events.sessions_with_conversions,
            id: events.sessions_with_conversions, name: Sessions with Conversion}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: bottom,
        series: [{axisId: events.session_conversion_rate, id: events.session_conversion_rate,
            name: Session Conversion Rate}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      events.session_conversion_rate: scatter
    series_colors:
      events.sessions_with_conversions: "#34A853"
      events.session_conversion_rate: "#4285F4"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#FFF"
    single_value_title: Converting Sessions
    comparison_label: First Visit Sessions
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: "#FFF", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    listen:
      'Goal: Event Name': events.event_name_goal_selection
      'Goal: Event Page': events.page_goal_selection
      Audience Selector: sessions.audience_selector
      Session Date: sessions.session_date
    row: 12
    col: 14
    width: 10
    height: 10
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "---\n<div  style=\"text-align: center;\">\n\t<div>\n\t\t<h1 style=\"\
      font-size: 28px;\">Total Conversions</h1><h2 style=\"font-size: 16px;\">Total\
      \ number of hits (Page or Event) that match the goals set in dashboard filters</h2></div></div>"
    row: 22
    col: 0
    width: 24
    height: 4
  - title: Events with Conversion
    name: Events with Conversion
    model: ga4
    explore: sessions
    type: single_value
    fields: [events.conversion_count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    custom_color: "#FFF"
    single_value_title: Total Conversions
    comparison_label: First Visit Sessions
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#B31412",
        font_color: "#FFF", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: bottom, series: [{axisId: event_data.sessions_with_conversions,
            id: event_data.sessions_with_conversions, name: Sessions with Conversion}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: bottom,
        series: [{axisId: event_data.session_conversion_rate, id: event_data.session_conversion_rate,
            name: Session Conversion Rate}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    series_types: {}
    point_style: circle
    series_colors:
      event_data.sessions_with_conversions: "#34A853"
      event_data.session_conversion_rate: "#4285F4"
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
    hidden_fields: []
    listen:
      'Goal: Event Name': events.event_name_goal_selection
      'Goal: Event Page': events.page_goal_selection
      Audience Selector: sessions.audience_selector
      Session Date: sessions.session_date
    row: 26
    col: 0
    width: 24
    height: 2
  - title: Top Goal Completion Page(s)
    name: Top Goal Completion Page(s)
    model: ga4
    explore: sessions
    type: looker_bar
    fields: [events.conversion_count, events.event_param_page, events.session_conversion_rate]
    filters:
      events.event_param_page: "-EMPTY"
    sorts: [events.conversion_count desc]
    limit: 10
    column_limit: 50
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    y_axes: [{label: !!null '', orientation: bottom, series: [{axisId: events.session_conversion_rate,
            id: events.session_conversion_rate, name: Session Conversion Rate}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: bottom, series: [{axisId: events.conversion_count,
            id: events.conversion_count, name: Total Conversions}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, type: linear}]
    size_by_field: event_data.session_conversion_rate
    series_types:
      events.session_conversion_rate: scatter
    series_colors:
      event_data.sessions_with_conversions: "#34A853"
      events.conversion_count: "#B31412"
      events.session_conversion_rate: "#4285F4"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#FFF"
    single_value_title: Total Conversions
    comparison_label: First Visit Sessions
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#B31412",
        font_color: "#FFF", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    listen:
      'Goal: Event Name': events.event_name_goal_selection
      'Goal: Event Page': events.page_goal_selection
      Audience Selector: sessions.audience_selector
      Session Date: sessions.session_date
    row: 28
    col: 0
    width: 12
    height: 11
  - title: Top Events
    name: Top Events
    model: ga4
    explore: sessions
    type: looker_bar
    fields: [events.conversion_count, events.full_event]
    filters:
      events.event_param_page: "-EMPTY"
    sorts: [events.conversion_count desc]
    limit: 10
    column_limit: 50
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    y_axes: [{label: !!null '', orientation: bottom, series: [{axisId: event_data.session_conversion_rate,
            id: event_data.session_conversion_rate, name: Session Conversion Rate}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: '', orientation: bottom, series: [
          {axisId: events.conversion_count, id: events.conversion_count, name: Total
              Conversions}], showLabels: false, showValues: false, unpinAxis: false,
        tickDensity: default, type: linear}]
    size_by_field: event_data.session_conversion_rate
    series_types:
      event_data.session_conversion_rate: scatter
    series_colors:
      event_data.sessions_with_conversions: "#34A853"
      event_data.session_conversion_rate: "#4285F4"
      events.conversion_count: "#B31412"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#FFF"
    single_value_title: Total Conversions
    comparison_label: First Visit Sessions
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#B31412",
        font_color: "#FFF", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    listen:
      'Goal: Event Name': events.event_name_goal_selection
      'Goal: Event Page': events.page_goal_selection
      Audience Selector: sessions.audience_selector
      Session Date: sessions.session_date
    row: 28
    col: 12
    width: 12
    height: 11
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "---\n<div  style=\"text-align: center;\">\n\t<div>\n\t\t<h1 style=\"\
      font-size: 28px;\">Reverse Goal Path</h1><h2 style=\"font-size: 16px;\">Read\
      \ Data from Right to Left:</h2></div></div>\n<ul>\n<li>The column furthest to\
      \ the right is where the Goal was completed.\n<li>Every subsequent column to\
      \ the left is the hit (Page or Event Action) that took place directly before\
      \ it.\n<li> Every path that flows into a NULL value is the “Entrance” into the\
      \ website (i.e. NULL values represent that the user had not entered the website\
      \ yet)</ul>\n\n"
    row: 39
    col: 0
    width: 24
    height: 5
  - title: Reverse Goal Path
    name: Reverse Goal Path
    model: ga4
    explore: sessions
    type: looker_grid
    fields: [events.current_page_minus_1, events.current_page_minus_2, events.current_page_minus_3,
      events.event_param_page, events.sessions_with_conversions]
    filters:
      events.has_completed_goal: 'Yes'
    sorts: [events.sessions_with_conversions desc]
    limit: 50
    column_limit: 50
    total: true
    dynamic_fields: [{table_calculation: of_total_sessions, label: "% of Total Sessions",
        expression: "${events.sessions_with_conversions}/${events.sessions_with_conversions:total}",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
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
    show_totals: false
    show_row_totals: true
    series_cell_visualizations:
      event_data.sessions_with_conversions:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {steps: 5, constraints: {
              max: {type: percentile, value: 99}}}}, bold: false, italic: false, strikethrough: false,
        fields: [of_total_sessions]}]
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
      'Goal: Event Name': events.event_name_goal_selection
      'Goal: Event Page': events.page_goal_selection
      Audience Selector: sessions.audience_selector
      Session Date: sessions.session_date
    row: 44
    col: 0
    width: 12
    height: 11
  - title: Reverse Event Action Path
    name: Reverse Event Action Path
    model: ga4
    explore: sessions
    type: looker_grid
    fields: [events.current_event_minus_3, events.current_event_minus_2, events.current_event_minus_1,
      events.full_event, events.sessions_with_conversions]
    filters:
      events.has_completed_goal: 'Yes'
    sorts: [events.sessions_with_conversions desc]
    limit: 50
    column_limit: 50
    total: true
    dynamic_fields: [{table_calculation: of_total_sessions, label: "% of Total Sessions",
        expression: "${events.sessions_with_conversions}/${events.sessions_with_conversions:total}",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
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
    show_totals: false
    show_row_totals: true
    series_cell_visualizations:
      event_data.sessions_with_conversions:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab, options: {steps: 5, constraints: {
              max: {type: percentile, value: 99}}}}, bold: false, italic: false, strikethrough: false,
        fields: [of_total_sessions]}]
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
      'Goal: Event Name': events.event_name_goal_selection
      'Goal: Event Page': events.page_goal_selection
      Session Date: sessions.session_date
    row: 44
    col: 12
    width: 12
    height: 11
  - name: " (5)"
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
    ></path>\n</svg>\nPropensity Model</a>\n</nav>\n</div>"
    row: 0
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
  - name: 'Goal: Event Name'
    title: 'Goal: Event Name'
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: ga4
    explore: sessions
    listens_to_filters: []
    field: events.event_name_goal_selection
  - name: 'Goal: Event Page'
    title: 'Goal: Event Page'
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: ga4
    explore: sessions
    listens_to_filters: []
    field: events.page_goal_selection
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
