connection: "default_bigquery_connection"

include: "/views/nyc_taxi_trips.view.lkml"

explore: nyc_taxi_trips {
  label: "NYC Taxi Trips"
  description: "Explore NYC Yellow Taxi trip data from the BigQuery public dataset"
}
