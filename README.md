# Streamlining-Healthcare-Insights-ETL-Pipeline-for-Hospital-Management

- [Description](#description)
- [DataBase Design](#DataBase-Design)
    - [ERD](#ERD)
    - [Mapping Schema](#Mapping-Schema)
- [Data Warehouse](#Data-Warehouse)
    - [Snowflake Schema](#Snowflake-Schema)
    - [DWH Implementation](#DWH-Implementation)
- [Tools](#Tools)


## Description

- Project Overview:
This project focuses on designing and implementing a robust Hospital Management System integrated with a sophisticated Data Warehouse. The system comprises modules for nurses, pharmacy, and doctors, centered around the common factor of patient care. It started by creating an Entity-Relationship Diagram (ERD) and mapping schema, ensuring data normalization and efficient organization. Physical tables were built with constraints followed by generating random data using Python scripts for testing purposes.

Moving forward, It transitioned to data warehousing, constructing a snowflake schema for analytical insights. Using SQL Server Integration Services (SSIS), It orchestrated the Extract, Transform, Load (ETL) process, ensuring data accuracy and integrity. Additionally, we implemented slowly changing dimensions (SCD) to track source data changes. A meta table was also created to monitor data transfer activities.

This project showcases our comprehensive approach to healthcare data management, blending database design principles with advanced data warehousing techniques to support efficient hospital operations and informed decision-making.



## DataBase Design

1) ERD Creation and Normalization:
- Initiated by crafting an Entity-Relationship Diagram (ERD) tailored for the hospital management system, encompassing entities such as nurses, pharmacy, doctors, and patients alongside their interrelationships and attributes. Employed robust database design methodologies to normalize the ERD up to the 3rd normal form, enhancing data integrity by reducing redundancy.

2) Mapping Schema and Physical Tables:
- Developed a comprehensive mapping schema post-ERD finalization, delineating the translation of entities and attributes into tangible physical tables within the database. Implemented essential constraints including primary keys, foreign keys, and composite keys to ensure data integrity and relational cohesion among tables.

3) Random Data Generation with Python:
- Executed Python scripts to generate randomized data for each column within the defined physical tables, a pivotal step for populating the database with diverse sample data essential for testing and developmental purposes.


### ERD
![Demo Sample](https://github.com/Sandra-Essa/Streamlining-Healthcare-Insights-ETL-Pipeline-for-Hospital-Management_/blob/main/Media/ERD.png)

### Mapping Schema
![Demo Sample](https://github.com/Sandra-Essa/Streamlining-Healthcare-Insights-ETL-Pipeline-for-Hospital-Management_/blob/main/Media/Mapping.png)


## Data Warehouse

4) Data Warehouse Modeling:
- Transitioned to data warehouse modeling after establishing a functional database with populated tables, addressing specific business needs. Designed a snowflake schema characterized by centralized fact tables interconnected with multiple dimensions, adhering to dimensional modeling principles crucial for effective data warehousing.

5) ETL Process:
- Executed the Extract, Transform, Load (ETL) process seamlessly using SSIS (SQL Server Integration Services), crafting purpose-specific ETL packages for transferring data from operational databases (e.g., nurses, pharmacy, doctors) to the data warehouse. Ensured data transformation accuracy and efficiency across dimensions, sub-dimensions, and fact tables through distinct ETL packages.

6) Slowly Changing Dimensions (SCD):
- Implemented Slowly Changing Dimensions (SCD) techniques to monitor and track changes in source data over time, ensuring historical accuracy within the data warehouse and reflecting real-time modifications in source systems effectively. Adhering to the three rules of SCD, this approach maintained historical data accuracy and provided insights into data evolution within the data warehouse.

7) Meta Table for Data Transfer Tracking:
- Established a meta table within the data warehouse infrastructure, serving as a centralized repository to track and monitor the timestamp of the last data transfer from operational databases to the data warehouse. This meta table facilitates streamlined management and monitoring of data integration processes.

### Snowflake Schema
![Demo Sample](https://github.com/Sandra-Essa/Streamlining-Healthcare-Insights-ETL-Pipeline-for-Hospital-Management_/blob/main/Media/Snowflake%20schema.png)

### SSIS DWH
![Demo Sample](https://github.com/Sandra-Essa/Streamlining-Healthcare-Insights-ETL-Pipeline-for-Hospital-Management_/blob/main/Media/OLAP_Hospital%20_Management_system.gif)

## Tools

1. Utilize Draw.io, an online platform, for crafting Entity Relationship Diagrams (ERD) and Database schemas.
2. Employ SQL Server Management Studio for the execution of database implementations.
3. Utilize SQL Server Management Studio and SQL Server Integration Service (SSIS) for the establishment of Datawarehouses.
