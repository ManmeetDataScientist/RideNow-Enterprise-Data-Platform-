
**Warehouse Design**

| Warehouse           | Size   | Purpose                          | Auto Suspend |
| ------------------- | ------ | -------------------------------- | ------------ |
| **WH_ETL**          | XSMALL | ETL, COPY INTO, MERGE, Tasks     | 60 sec       |
| **WH_ANALYTICS**    | SMALL  | Power BI, Tableau, SQL Analytics | 60 sec       |
| **WH_DATA_SCIENCE** | SMALL  | Python, ML, Ad-hoc Analysis      | 300 sec      |


| Warehouse         | Used By                                         |
| ----------------- | ----------------------------------------------- |
| `WH_ETL`          | ETL pipelines, COPY INTO, MERGE, Streams, Tasks |
| `WH_ANALYTICS`    | Power BI, Tableau, Business Analysts            |
| `WH_DATA_SCIENCE` | Python, Jupyter Notebooks, Data Scientists      |


| Schema      | Purpose                      |
| ----------- | ---------------------------- |
| BRONZE      | Raw source data              |
| SILVER      | Cleansed & transformed data  |
| GOLD        | Analytics-ready data         |
| STAGE       | Snowflake stages             |
| FILE_FORMAT | File format definitions      |
| METADATA    | ETL metadata & configuration |
| AUDIT       | Audit and logging            |
| SECURITY    | Security-related objects     |

**Purpose of Each Schema**

| Schema          | Objects Stored                                                             |
| --------------- | -------------------------------------------------------------------------- |
| **BRONZE**      | Raw source tables (`CUSTOMER_RAW`, `TRIP_RAW`, `PAYMENT_RAW`, etc.)        |
| **SILVER**      | Cleansed dimension and fact tables with business transformations           |
| **GOLD**        | Reporting views, KPIs, aggregated fact tables                              |
| **STAGE**       | Internal and external Snowflake stages                                     |
| **FILE_FORMAT** | CSV, JSON, Parquet file formats                                            |
| **METADATA**    | ETL job metadata, pipeline configuration, load history                     |
| **AUDIT**       | Audit logs, error logs, rejected records, data quality checks              |
| **SECURITY**    | Masking policies, row access policies, tags, and future governance objects |
