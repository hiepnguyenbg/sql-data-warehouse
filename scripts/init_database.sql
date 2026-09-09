/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
	This script creates a new database named 'DataWarehouse'. Additionally, the script sets up 
	three schemas within the database: 'bronze', 'silver', 'gold'.	
*/


-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse;

-- Create Schemas
CREATE SCHEMA bronze;

CREATE SCHEMA silver;

CREATE SCHEMA gold;
