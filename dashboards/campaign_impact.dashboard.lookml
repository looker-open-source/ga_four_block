- dashboard: ga4_campaign_impact
  title: "[GA4] Campaign Impact"
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Users saw the campaign page
    name: Users saw the campaign page
    model: ga4
    explore: sessions
    type: single_value
    fields: [sessions.total_users, user_segment.segment_users, user_segment.retention_rate]
    filters:
      events.event_param_page: ''
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#1A73E8",
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
    hidden_fields: [user_segment.segment_users, user_segment.retention_rate]
    listen:
      Audience Selector: sessions.audience_selector
      Campaign Date: sessions.session_date
      User Return Date: user_segment.user_segment_timeframe
      Page: sessions.landing_page
    row: 5
    col: 0
    width: 12
    height: 4
  - title: Users Returned
    name: Users Returned
    model: ga4
    explore: sessions
    type: single_value
    fields: [sessions.total_users, user_segment.segment_users, user_segment.retention_rate]
    filters:
      events.event_param_page: ''
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#1A73E8",
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
    hidden_fields: [sessions.total_users]
    listen:
      Audience Selector: sessions.audience_selector
      Campaign Date: sessions.session_date
      User Return Date: user_segment.user_segment_timeframe
      Page: sessions.landing_page
    row: 5
    col: 12
    width: 12
    height: 4
  - title: Retained User Transaction Conversion Rate
    name: Retained User Transaction Conversion Rate
    model: ga4
    explore: sessions
    type: single_value
    fields: [events.transaction_conversion_rate, user_segment.segment_transaction_conversion_rate]
    filters:
      events.event_param_page: ''
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: change, _type_hint: number,
        category: table_calculation, expression: "${user_segment.segment_transaction_conversion_rate}-${events.transaction_conversion_rate}",
        label: Change, value_format: !!null '', value_format_name: percent_1}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: conversion rate driven by campaign
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#EA4335",
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
    hidden_fields: [events.transaction_conversion_rate]
    listen:
      Audience Selector: sessions.audience_selector
      Campaign Date: sessions.session_date
      User Return Date: user_segment.user_segment_timeframe
      Page: sessions.landing_page
    row: 9
    col: 12
    width: 12
    height: 4
  - title: Transaction Conversion Rate
    name: Transaction Conversion Rate
    model: ga4
    explore: sessions
    type: single_value
    fields: [events.transaction_conversion_rate, user_segment.segment_transaction_conversion_rate]
    filters:
      events.event_param_page: ''
    limit: 500
    dynamic_fields: [{_kind_hint: measure, table_calculation: change, _type_hint: number,
        category: table_calculation, expression: "${user_segment.segment_transaction_conversion_rate}-${events.transaction_conversion_rate}",
        label: Change, value_format: !!null '', value_format_name: percent_1}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: conversion rate driven by campaign
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#EA4335",
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
    hidden_fields: [user_segment.segment_transaction_conversion_rate, change]
    listen:
      Audience Selector: sessions.audience_selector
      Campaign Date: sessions.session_date
      User Return Date: user_segment.user_segment_timeframe
      Page: sessions.landing_page
    row: 9
    col: 0
    width: 12
    height: 4
  - title: Revenue per User
    name: Revenue per User
    model: ga4
    explore: sessions
    type: single_value
    fields: [events.transaction_revenue_per_user]
    filters:
      events.event_param_page: ''
    limit: 500
    column_limit: 50
    dynamic_fields: [{_kind_hint: measure, table_calculation: change, _type_hint: number,
        category: table_calculation, expression: "${user_segment.segment_transaction_revenue_per_user}/${events.transaction_revenue_per_user}-1",
        label: Change, value_format: !!null '', value_format_name: percent_0, is_disabled: true}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#ffffff"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#F9AB00",
        font_color: "#ffffff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
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
      Audience Selector: sessions.audience_selector
      Campaign Date: sessions.session_date
      User Return Date: user_segment.user_segment_timeframe
      Page: sessions.landing_page
    row: 13
    col: 0
    width: 12
    height: 4
  - title: Revenue per Retained User
    name: Revenue per Retained User
    model: ga4
    explore: sessions
    type: single_value
    fields: [user_segment.segment_transaction_revenue_per_user, events.transaction_revenue_per_user]
    filters:
      events.event_param_page: ''
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${user_segment.segment_transaction_revenue_per_user}/${events.transaction_revenue_per_user}-1",
        label: Change, value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        table_calculation: change, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: ''
    comparison_label: revenue per user driven by campaign
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#F9AB00",
        font_color: "#ffffff", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
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
    hidden_fields: [events.transactions_per_user, events.transaction_revenue_per_user]
    listen:
      Audience Selector: sessions.audience_selector
      Campaign Date: sessions.session_date
      User Return Date: user_segment.user_segment_timeframe
      Page: sessions.landing_page
    row: 13
    col: 12
    width: 12
    height: 4
  - title: Impact by Audience
    name: Impact by Audience
    model: ga4
    explore: sessions
    type: looker_grid
    fields: [sessions.audience_trait, sessions.total_users, user_segment.segment_users,
      events.transaction_revenue_per_user, user_segment.segment_transaction_revenue_per_user,
      events.transaction_conversion_rate, user_segment.segment_transaction_conversion_rate]
    filters:
      events.event_param_page: ''
    sorts: [conversion_rate_change desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{_kind_hint: measure, table_calculation: retention_rate, _type_hint: number,
        category: table_calculation, expression: "${user_segment.segment_users}/${sessions.total_users}",
        label: Retention Rate, value_format: !!null '', value_format_name: percent_1},
      {_kind_hint: measure, table_calculation: conversion_rate_change, _type_hint: number,
        category: table_calculation, expression: "${user_segment.segment_transaction_conversion_rate}-${events.transaction_conversion_rate}",
        label: Conversion Rate Change, value_format: !!null '', value_format_name: percent_1},
      {category: table_calculation, expression: "(${user_segment.segment_transaction_revenue_per_user}/${events.transaction_revenue_per_user})\
          \ -1", label: Rev per User Change, value_format: !!null '', value_format_name: percent_1,
        _kind_hint: measure, table_calculation: rev_per_user_change, _type_hint: number}]
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
    header_font_size: '12'
    rows_font_size: '14'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", sessions.audience_trait, retention_rate,
      events.transaction_revenue_per_user, user_segment.segment_transaction_revenue_per_user,
      rev_per_user_change, events.transaction_conversion_rate, user_segment.segment_transaction_conversion_rate,
      conversion_rate_change]
    show_totals: true
    show_row_totals: true
    series_labels:
      events.transactions_per_user: Transactions / User
      user_segment.segment_transaction_revenue_per_user: Revenue / Retained User
      user_segment.segment_transaction_conversion_rate: Retained User Conversion Rate
      events.transaction_conversion_rate: Conversion Rate
      rev_per_user_change: Δ
      conversion_rate_change: Δ
      events.transaction_revenue_per_user: Revenue / User
    series_cell_visualizations:
      events.transactions_per_user:
        is_active: false
      retention_rate:
        is_active: true
      conversion_rate_change:
        is_active: true
      rev_per_user_change:
        is_active: true
    header_background_color: "#7CB342"
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
    hidden_fields: [sessions.total_users, user_segment.segment_users]
    listen:
      Audience Selector: sessions.audience_selector
      Campaign Date: sessions.session_date
      User Return Date: user_segment.user_segment_timeframe
      Page: sessions.landing_page
    row: 17
    col: 0
    width: 24
    height: 8
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<div  style=\"text-align: center;\">\n\t<div>\n\t\t<h1 style=\"font-size:\
      \ 28px;\">GA4 Campaign Impact</h1><h2 style=\"font-size: 16px;\"><b>Recommended\
      \ Action</b><br>\n Select a <b>period</b> and <b>landing page</b> for a campaign\
      \ you ran, and measure its <b>retention</b> and <b>upsell</b> impact. Observe\
      \ which <b>audiences</b> are benefitting the most from this campaign to <b>better\
      \ target in the future</b>.\n</h2></div>\n</div>"
    row: 0
    col: 0
    width: 24
    height: 5
  filters:
  - name: Campaign Date
    title: Campaign Date
    type: field_filter
    default_value: 30 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: inline
      options: []
    model: ga4
    explore: sessions
    listens_to_filters: []
    field: sessions.session_date
  - name: User Return Date
    title: User Return Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: ga4
    explore: sessions
    listens_to_filters: []
    field: user_segment.user_segment_timeframe
  - name: Page
    title: Page
    type: field_filter
    default_value: "/"
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
  - name: Audience Selector
    title: Audience Selector
    type: field_filter
    default_value: Channel
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
