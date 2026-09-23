view: nyc_taxi_trips {
  sql_table_name: `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2018` ;;

  dimension: trip_id {
    primary_key: yes
    hidden: yes
    sql: CONCAT(CAST(${TABLE}.pickup_datetime AS STRING), CAST(${TABLE}.dropoff_datetime AS STRING), CAST(${TABLE}.rand() AS STRING)) ;;
  }

  dimension_group: pickup {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year, hour_of_day, day_of_week]
    sql: ${TABLE}.pickup_datetime ;;
  }

  dimension_group: dropoff {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year, hour_of_day, day_of_week]
    sql: ${TABLE}.dropoff_datetime ;;
  }

  dimension: vendor_id {
    type: string
    sql: ${TABLE}.vendor_id ;;
  }

  dimension: passenger_count {
    type: number
    sql: ${TABLE}.passenger_count ;;
  }

  dimension: trip_distance {
    type: number
    sql: ${TABLE}.trip_distance ;;
  }

  dimension: pickup_location_id {
    type: number
    sql: ${TABLE}.pickup_location_id ;;
  }

  dimension: dropoff_location_id {
    type: number
    sql: ${TABLE}.dropoff_location_id ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  dimension: fare_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.fare_amount ;;
  }

  dimension: tip_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.tip_amount ;;
  }

  dimension: tolls_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.tolls_amount ;;
  }

  dimension: total_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.total_amount ;;
  }

  measure: trip_count {
    type: count
    drill_fields: [trip_id, pickup_date, dropoff_date, total_amount]
  }

  measure: total_fare_revenue {
    type: sum
    sql: ${fare_amount} ;;
    value_format_name: usd
  }

  measure: total_tip_revenue {
    type: sum
    sql: ${tip_amount} ;;
    value_format_name: usd
  }

  measure: average_trip_distance {
    type: average
    sql: ${trip_distance} ;;
    value_format_name: decimal_2
  }

  measure: average_fare_amount {
    type: average
    sql: ${fare_amount} ;;
    value_format_name: usd
  }
}
