
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
