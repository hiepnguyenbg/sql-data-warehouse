
# End-to-End Data Warehouse Project (PostgreSQL)
## Overview

This project demonstrates the design and implementation of a complete data warehousing solution using **PostgreSQL**. It transforms raw data from multiple sources into structured, analytics-ready datasets through a scalable **Medallion Architecture (Bronze, Silver, Gold)**.

The goal is to build a reliable data foundation that supports reporting, analytics, and data-driven decision-making.

---
## Objectives

* Consolidate data from multiple source systems (ERP & CRM)
* Clean and standardize raw data for consistency and accuracy
* Design a scalable data warehouse architecture
* Build analytical data models optimized for reporting
* Enable efficient querying and business insights

---
## Architecture

This project follows the **Medallion Architecture:**
<br>
<br>
<img width="1400" height="1000" alt="data_architecture (2)" src="https://github.com/hiepnguyenbg/sql-data-warehouse/blob/main/docs/data_architecture.png" />


* **Bronze Layer** → Raw data ingestion from CSV files (ERP & CRM)
* **Silver Layer** → Data cleaning, transformation, and integration
* **Gold Layer** → Business-ready data modeled using a **star schema**

This layered approach improves data quality, maintainability, and query performance.

---
## Data Pipeline

The ETL pipeline includes:

**1. Extract**
* Imported raw data from ERP and CRM systems (CSV format)
  
**2. Transform**
* Cleaned and standardized data
* Handled missing values and inconsistencies
* Removed duplicates
* Integrated multiple data sources

**3. Load**
* Loaded transformed data into structured tables
* Built analytical models in the Gold layer

---
## Data Modelling

* Designed **fact and dimension tables**
* Implemented a **star schema** for efficient querying
* Optimized structure for BI tools and reporting use cases

---
## Key Outcomes

* Created a unified data model combining multiple data sources
* Improved data quality and consistency across datasets
* Enabled faster and more efficient analytical queries
* Structured data to support scalable reporting and insights

---
## Skills Demonstrated

* Data warehousing and architecture design
* ETL pipeline development (Bronze → Silver → Gold)
* Data modeling (star schema, fact & dimension tables)
* SQL for data transformation and integration
* Data cleaning and quality handling
* Designing analytics-ready datasets

---
## Repository Structure

```
sql_data_warehouse_project/
│── datasets/              # Raw and processed datasets
│── docs/              # Architecture diagrams and documentation
│── scripts/           # ETL and transformation SQL scripts
│── tests/              # Query testing
│── README.md          # Project documentation
```

---
## What I Learned

This project strengthened my ability to design and build a complete data pipeline—from raw data ingestion to analytics-ready datasets. I gained hands-on experience implementing a Medallion architecture and designing star schemas for efficient querying, while reinforcing the importance of data quality and consistency in building reliable data systems.



