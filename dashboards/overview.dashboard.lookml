- dashboard: overview
  title: "[GA4] Overview"
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Session Count
    name: Session Count
    model: ga4
    explore: sessions
    type: single_value
    fields: [sessions.total_sessions, sessions.total_first_visit_sessions_percentage]
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
    hidden_fields: []
    y_axes: []
    listen:
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 8
    col: 0
    width: 6
    height: 4
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "---\n<div  style=\"text-align: center;\">\n\t<div>\n\t\t<h1 style=\"\
      font-size: 28px;\">GA Overview</h1><h2 style=\"font-size: 16px;\">\nOverview\
      \ of traffic to website</h2></div>\n</div>"
    row: 4
    col: 0
    width: 24
    height: 4
  - title: Bounces
    name: Bounces
    model: ga4
    explore: sessions
    type: single_value
    fields: [sessions.total_bounced_sessions, sessions.total_bounced_sessions_percentage]
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
    color_application:
      collection_id: legacy
      palette_id: looker_classic
    custom_color: "#FFF"
    single_value_title: Bounces
    comparison_label: Bounce Rate
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#EA4335",
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
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 8
    col: 6
    width: 6
    height: 4
  - title: Avg Session Duration
    name: Avg Session Duration
    model: ga4
    explore: sessions
    type: single_value
    fields: [sessions.average_session_duration]
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
    single_value_title: Avg Session Duration
    comparison_label: Bounce Rate
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
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 8
    col: 18
    width: 6
    height: 4
  - title: Engaged Sessions
    name: Engaged Sessions
    model: ga4
    explore: sessions
    type: single_value
    fields: [sessions.total_engaged_sessions, sessions.total_engaged_sessions_percentage]
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
    color_application:
      collection_id: legacy
      palette_id: looker_classic
    custom_color: "#FFF"
    single_value_title: Engaged Sessions
    comparison_label: Engaged Session Percentage
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#7CB342",
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
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 8
    col: 12
    width: 6
    height: 4
  - title: Traffic
    name: Traffic
    model: ga4
    explore: sessions
    type: looker_column
    fields: [sessions.total_sessions, sessions.session_data_session_start_week, sessions.total_bounced_sessions_percentage,
      sessions.average_session_duration]
    fill_fields: [sessions.session_data_session_start_week]
    sorts: [sessions.session_data_session_start_week desc]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: sessions.total_sessions,
            id: sessions.total_sessions, name: Total Sessions}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: sessions.total_bounced_sessions_percentage,
            id: sessions.total_bounced_sessions_percentage, name: Total Bounced Sessions
              Percentage}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: sessions.average_session_duration, id: sessions.average_session_duration,
            name: 'Average Session Duration (HH:MM:SS)'}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      sessions.total_bounced_sessions_percentage: line
      sessions.average_session_duration: line
    series_colors:
      sessions.total_sessions: "#F9AB00"
      sessions.average_session_duration: "#1A73E8"
      sessions.total_bounced_sessions_percentage: "#12B5CB"
    series_labels:
      sessions.total_sessions: Sessions
      sessions.total_bounced_sessions_percentage: Bounce Rate
      sessions.average_session_duration: Avg Session Duration
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
    single_value_title: Sessions
    comparison_label: First Visit Sessions
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#F9AB00",
        font_color: "#FFF", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    listen:
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 12
    col: 0
    width: 16
    height: 9
  - title: Session Duration Tier
    name: Session Duration Tier
    model: ga4
    explore: sessions
    type: looker_bar
    fields: [sessions.session_data_session_duration_tier, sessions.total_sessions]
    filters:
      sessions.session_data_session_duration_tier: "-Undefined"
    sorts: [sessions.session_data_session_duration_tier]
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
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: sessions.total_sessions,
            id: sessions.total_sessions, name: Total Sessions}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: sessions.total_bounced_sessions_percentage,
            id: sessions.total_bounced_sessions_percentage, name: Total Bounced Sessions
              Percentage}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: sessions.average_session_duration, id: sessions.average_session_duration,
            name: 'Average Session Duration (HH:MM:SS)'}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      sessions.total_sessions: "#1A73E8"
      sessions.average_session_duration: "#1A73E8"
      sessions.total_bounced_sessions_percentage: "#12B5CB"
    series_labels:
      sessions.total_sessions: Sessions
      sessions.total_bounced_sessions_percentage: Bounce Rate
      sessions.average_session_duration: Avg Session Duration
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
    single_value_title: Sessions
    comparison_label: First Visit Sessions
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#F9AB00",
        font_color: "#FFF", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    listen:
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 12
    col: 16
    width: 8
    height: 9
  - title: Users
    name: Users
    model: ga4
    explore: sessions
    type: single_value
    fields: [sessions.total_users, sessions.percentage_returning_users]
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
    color_application:
      collection_id: legacy
      palette_id: looker_classic
    custom_color: "#FFF"
    single_value_title: Total Users
    comparison_label: Returning Users
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
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 25
    col: 0
    width: 24
    height: 4
  - title: Sessions by Continent
    name: Sessions by Continent
    model: ga4
    explore: sessions
    type: looker_area
    fields: [sessions.session_data_session_start_week, sessions.total_sessions, sessions.geo_data_continent]
    pivots: [sessions.geo_data_continent]
    fill_fields: [sessions.session_data_session_start_week]
    filters:
      sessions.geo_data_continent: -NULL, -"(not set)"
    sorts: [sessions.session_data_session_start_week desc]
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
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: sessions.total_sessions,
            id: sessions.total_sessions, name: Total Sessions}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: sessions.total_bounced_sessions_percentage,
            id: sessions.total_bounced_sessions_percentage, name: Total Bounced Sessions
              Percentage}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: sessions.average_session_duration, id: sessions.average_session_duration,
            name: 'Average Session Duration (HH:MM:SS)'}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      sessions.total_sessions: "#F9AB00"
      sessions.average_session_duration: "#1A73E8"
      sessions.total_bounced_sessions_percentage: "#12B5CB"
    series_labels:
      sessions.total_sessions: Sessions
      sessions.total_bounced_sessions_percentage: Bounce Rate
      sessions.average_session_duration: Avg Session Duration
    ordering: none
    show_null_labels: false
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
    single_value_title: Sessions
    comparison_label: First Visit Sessions
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#F9AB00",
        font_color: "#FFF", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    listen:
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 29
    col: 0
    width: 9
    height: 8
  - title: Top US States
    name: Top US States
    model: ga4
    explore: sessions
    type: looker_geo_choropleth
    fields: [sessions.total_sessions, sessions.geo_data_region]
    filters:
      sessions.geo_data_country: United States
    sorts: [sessions.total_sessions desc]
    limit: 500
    column_limit: 50
    map: usa
    map_projection: ''
    show_view_names: false
    quantize_colors: false
    colors: ["#f9f9f9", "#4285F4", "#185ABC"]
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: sessions.total_sessions,
            id: sessions.total_sessions, name: Total Sessions}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: sessions.total_bounced_sessions_percentage,
            id: sessions.total_bounced_sessions_percentage, name: Total Bounced Sessions
              Percentage}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: sessions.average_session_duration, id: sessions.average_session_duration,
            name: 'Average Session Duration (HH:MM:SS)'}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      sessions.total_sessions: "#F9AB00"
      sessions.average_session_duration: "#1A73E8"
      sessions.total_bounced_sessions_percentage: "#12B5CB"
    series_labels:
      sessions.total_sessions: Sessions
      sessions.total_bounced_sessions_percentage: Bounce Rate
      sessions.average_session_duration: Avg Session Duration
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
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
    single_value_title: Sessions
    comparison_label: First Visit Sessions
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#F9AB00",
        font_color: "#FFF", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 36.94989178681327
    map_longitude: -91.142578125
    map_zoom: 3
    hidden_fields: []
    listen:
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 29
    col: 9
    width: 7
    height: 8
  - title: Top Countries (Non-US)
    name: Top Countries (Non-US)
    model: ga4
    explore: sessions
    type: looker_geo_choropleth
    fields: [sessions.total_sessions, sessions.geo_data_country]
    filters:
      sessions.geo_data_country: "-United States"
    sorts: [sessions.total_sessions desc]
    limit: 500
    column_limit: 50
    map: world
    map_projection: ''
    show_view_names: false
    quantize_colors: false
    colors: ["#f9f9f9", "#4285F4", "#185ABC"]
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: sessions.total_sessions,
            id: sessions.total_sessions, name: Total Sessions}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: sessions.total_bounced_sessions_percentage,
            id: sessions.total_bounced_sessions_percentage, name: Total Bounced Sessions
              Percentage}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: sessions.average_session_duration, id: sessions.average_session_duration,
            name: 'Average Session Duration (HH:MM:SS)'}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      sessions.total_sessions: "#F9AB00"
      sessions.average_session_duration: "#1A73E8"
      sessions.total_bounced_sessions_percentage: "#12B5CB"
    series_labels:
      sessions.total_sessions: Sessions
      sessions.total_bounced_sessions_percentage: Bounce Rate
      sessions.average_session_duration: Avg Session Duration
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
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
    single_value_title: Sessions
    comparison_label: First Visit Sessions
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#F9AB00",
        font_color: "#FFF", color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 36.94989178681327
    map_longitude: -91.142578125
    map_zoom: 3
    hidden_fields: []
    listen:
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 29
    col: 16
    width: 8
    height: 8
  - title: Sessions by Source Channel
    name: Sessions by Source Channel
    model: ga4
    explore: sessions
    type: looker_bar
    fields: [sessions.audience_trait, sessions.total_sessions, audience_cohorts.rank]
    pivots: [sessions.audience_trait, audience_cohorts.rank]
    filters:
      sessions.audience_selector: Channel
    sorts: [audience_cohorts.rank, sessions.audience_trait]
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
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 41
    col: 0
    width: 24
    height: 7
  - title: Top Referrers
    name: Top Referrers
    model: ga4
    explore: sessions
    type: looker_bar
    fields: [sessions.session_attribution_source, sessions.total_sessions]
    filters:
      sessions.session_attribution_medium: referral
    sorts: [sessions.total_sessions desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: of_total, label: "% of Total", expression: "${sessions.total_sessions}/sum(${sessions.total_sessions})",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
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
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hidden_series: [of_total]
    series_types: {}
    series_colors:
      sessions.total_sessions: "#F9AB00"
      of_total: "#facb04"
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Channel groups are default, as defined by Google https://support.google.com/analytics/answer/9756891?hl=en
    listen:
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 48
    col: 0
    width: 12
    height: 11
  - title: Top Landing Pages
    name: Top Landing Pages
    model: ga4
    explore: sessions
    type: looker_bar
    fields: [sessions.total_sessions, events.event_param_page]
    filters:
      events.event_param_page: "-EMPTY"
      events.page_view_rank: '1'
    sorts: [sessions.total_sessions desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: of_total, label: "% of Total", expression: "${sessions.total_sessions}/sum(${sessions.total_sessions})",
        value_format: !!null '', value_format_name: percent_0, _kind_hint: measure,
        _type_hint: number}]
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
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hidden_series: [of_total]
    series_types: {}
    series_colors:
      sessions.total_sessions: "#F9AB00"
      of_total: "#facb04"
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Top 10 Landing pages based on Sessions within timeframe
    listen:
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 48
    col: 12
    width: 12
    height: 11
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
    row: 63
    col: 0
    width: 12
    height: 4
  - title: Average Time on Page
    name: Average Time on Page
    model: ga4
    explore: sessions
    type: single_value
    fields: [events.average_time_to_next_page]
    sorts: [events.average_time_to_next_page desc]
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
    single_value_title: Avg Time on Page
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Avg time spent on each page in session
    listen:
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 63
    col: 12
    width: 12
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
    note_state: collapsed
    note_display: hover
    note_text: Top Pages based on Page Views within timeframe
    listen:
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 67
    col: 0
    width: 12
    height: 12
  - title: Average Time by Page
    name: Average Time by Page
    model: ga4
    explore: sessions
    type: looker_bar
    fields: [events.event_param_page, events.average_time_to_next_page, events.total_page_views]
    filters:
      events.event_param_page: "-EMPTY"
    sorts: [events.total_page_views desc]
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
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: events.average_time_to_next_page,
            id: events.average_time_to_next_page, name: Average Time to Next Event}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Avg Time on Page
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    hidden_fields: [events.total_page_views]
    note_state: collapsed
    note_display: hover
    note_text: Avg time spent on each page in session
    listen:
      Date: sessions.session_date
      Landing Page: sessions.landing_page
    row: 67
    col: 12
    width: 12
    height: 12
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "---\n<div  style=\"text-align: center;\">\n\t<div>\n\t\t<h1 style=\"\
      font-size: 28px;\">Behavior\n</h1><h2 style=\"font-size: 16px;\">What are people\
      \ doing on your website?\n</h2></div>\n</div>"
    row: 59
    col: 0
    width: 24
    height: 4
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "---\n<div  style=\"text-align: center;\">\n\t<div>\n\t\t<h1 style=\"\
      font-size: 28px;\">Audience</h1><h2 style=\"font-size: 16px;\">Who is visiting\
      \ your website?</h2></div>\n</div>"
    row: 21
    col: 0
    width: 24
    height: 4
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "---\n<div  style=\"text-align: center;\">\n\t<div>\n\t\t<h1 style=\"\
      font-size: 28px;\">Acquisition\n</h1><h2 style=\"font-size: 16px;\">How are\
      \ people finding you?</h2></div>\n</div>"
    row: 37
    col: 0
    width: 24
    height: 4
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
    ></path>\n</svg>\nModels</a>\n</nav>\n</div>"
    row: 0
    col: 0
    width: 24
    height: 4
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: 14 day
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
