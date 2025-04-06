Here’s a SQL query to help you analyze **daily engagement patterns** for each movie title from the Netflix UK clickstream dataset:

Assuming the dataset has a table (say `netflix_clickstream`) with columns similar to:
- `title` (movie/show title)
- `date` (date of the view)
- `duration` or `watch_time` (watch time in seconds or minutes — depending on the schema)
- `user_id` or session identifier

Here’s a SQL query that gives you **daily view counts** and **total watch time** per movie title:

```sql
SELECT
    title,
    DATE(date) AS view_date,
    COUNT(*) AS daily_view_count,
    SUM(duration) AS total_watch_time
FROM
    netflix_clickstream
GROUP BY
    title,
    DATE(date)
ORDER BY
    title,
    view_date;
```

### Notes:
- `duration`: Replace with the actual column name that indicates the time watched.
- `date`: Replace with the actual timestamp column name (e.g., `watch_time_start`, `session_start`, etc.).
- `COUNT(*)`: Counts the number of views per day per title.
- `SUM(duration)`: Aggregates total watch time to track engagement.

If you'd like to also track **unique viewers** per day:

```sql
SELECT
    title,
    DATE(date) AS view_date,
    COUNT(*) AS daily_view_count,
    COUNT(DISTINCT user_id) AS unique_viewers,
    SUM(duration) AS total_watch_time
FROM
    netflix_clickstream
GROUP BY
    title,
    DATE(date)
ORDER BY
    title,
    view_date;
```





# TMM-Demo

# Clickstream Data Analytics with Confluent ksqlDB and Kafka Connect

This project demonstrates how to build a real-time clickstream data analytics pipeline using Confluent's ksqlDB, Kafka Connect, Elasticsearch, and Grafana. It showcases the process of collecting, processing, and visualizing user interaction data from a website to gain insights into user behavior.

## Overview

The clickstream analytics pipeline involves the following components:

1. **Data Collection**: Simulated clickstream events are generated to mimic user interactions on a website.
2. **Stream Processing with ksqlDB**: ksqlDB processes the incoming clickstream data to compute key metrics such as page views, user sessions, and error rates.
3. **Data Storage with Elasticsearch**: Processed data is stored in Elasticsearch to enable efficient querying and analysis.
4. **Visualization with Grafana**: Grafana is used to create dashboards that visualize the analytics derived from the clickstream data.

## Prerequisites

Before setting up the project, ensure you have the following installed:

- **Docker**: Version 1.11 or later.
- **Docker Compose**: Included with Docker for Mac by default.
- **Allocated Memory for Docker**: At least 6 GB.

For detailed setup instructions, refer to the [Clickstream Data Analysis Pipeline tutorial](https://docs.confluent.io/platform/current/ksqldb/tutorials/clickstream.html).

## Setup Instructions

1. **Clone the Repository**:

   ```bash
   git clone git@github.com:confluentinc/examples.git confluentinc-examples
   ```


2. **Navigate to the Clickstream Directory**:

   ```bash
   cd confluentinc-examples/clickstream
   ```


3. **Checkout the Latest Version**:

   ```bash
   git checkout latest
   ```


4. **Start the Docker Containers**:

   Use Docker Compose to start the required services, including Kafka, ksqlDB, Elasticsearch, and Grafana.

   ```bash
   docker-compose up -d
   ```


5. **Access the ksqlDB CLI**:

   After the services are up and running, access the ksqlDB CLI to interact with the stream processing application.

   ```bash
   docker exec -it ksqldb-cli ksql http://ksqldb-server:8088
   ```


6. **Run ksqlDB Statements**:

   Execute the ksqlDB statements provided in the `statements.sql` file to create streams and tables for processing the clickstream data.

   ```sql
   RUN SCRIPT '/path/to/statements.sql';
   ```


## Key Features

- **Real-Time Data Processing**: Utilizes ksqlDB to process and analyze streaming data in real-time.
- **Scalable Data Integration**: Employs Kafka Connect to integrate with various data sources and sinks, facilitating scalable data pipelines.
- **Interactive Visualizations**: Leverages Grafana to create interactive and insightful dashboards for data visualization.
