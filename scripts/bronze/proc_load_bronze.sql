/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CVS files.
	It performs the following actions:
	- Truncates the bronze tables before loading data.
	- Uses the 'COPY' command to load data from CSV files to bronze tables.
	* Note for Macbook users: the datasets need to be moved to /Users/Shared folder to avoid MacOS TCC privacy. 

Parameters:
	None. This stored procedure does not accept any parameters or return any values.

Usage Example:
	CALL bronze.load_bronze()
===============================================================================
*/

CREATE OR REPLACE PROCEDURE bronze.load_bronze ()
LANGUAGE plpgsql 
AS $body$
BEGIN
DO $$
DECLARE
	inserted_rows_count INTEGER;
	start_time timestamptz;
    end_time timestamptz;
    duration interval;
	batch_start timestamptz := clock_timestamp();
BEGIN
	RAISE NOTICE '========================================';
	RAISE NOTICE 'Loading Bronze Layer';
	RAISE NOTICE '========================================';

	RAISE NOTICE '----------------------------------------';
	RAISE NOTICE 'Loading CRM Tables';
	RAISE NOTICE '----------------------------------------';	
	
	RAISE NOTICE '>> Truncating Table: bronze.crm_cust_info';
	start_time := clock_timestamp();
	TRUNCATE TABLE bronze.crm_cust_info;
	RAISE NOTICE '>> Inserting Data Into: bronze.crm_cust_info';
	COPY bronze.crm_cust_info
		(cst_id, 
		cst_key, 
		cst_firstname, 
		cst_lastname, 
		cst_marital_status, 
		cst_gndr, 
		cst_create_date)
	FROM '/Users/Shared/datasets/source_crm/cust_info.csv'
	WITH (FORMAT CSV, HEADER TRUE);
	GET DIAGNOSTICS inserted_rows_count = ROW_COUNT;
	RAISE NOTICE '(Rows Inserted:%)', inserted_rows_count;
	end_time := clock_timestamp();
    duration := end_time - start_time;
    RAISE NOTICE '>> Load Duration: %', duration;
	RAISE NOTICE '----------------------------------------';
	
	RAISE NOTICE '>> Truncating Table: bronze.crm_prd_info';
	start_time := clock_timestamp();
	TRUNCATE TABLE bronze.crm_prd_info;
	RAISE NOTICE '>> Inserting Data Into: bronze.crm_prd_info';
	COPY bronze.crm_prd_info
		(prd_id, 
		prd_key, 
		prd_nm, 
		prd_cost, 
		prd_line, 
		prd_start_dt, 
		prd_end_dt)
	FROM '/Users/Shared/datasets/source_crm/prd_info.csv'
	WITH (FORMAT CSV, HEADER TRUE);
	GET DIAGNOSTICS inserted_rows_count = ROW_COUNT;
	RAISE NOTICE '(Rows Inserted:%)', inserted_rows_count;
	end_time := clock_timestamp();
    duration := end_time - start_time;
    RAISE NOTICE '>> Load Duration: %', duration;
	RAISE NOTICE '----------------------------------------';
	
	RAISE NOTICE '>> Truncating Table: bronze.crm_sales_details';
	start_time := clock_timestamp();
	TRUNCATE TABLE bronze.crm_sales_details;
	RAISE NOTICE '>> Inserting Data Into: bronze.crm_sales_details';
	COPY bronze.crm_sales_details
		(sls_ord_num, 
		sls_prd_key, 
		sls_cust_id, 
		sls_order_dt, 
		sls_ship_dt, 
		sls_due_dt, 
		sls_sales, 
		sls_quantity, 
		sls_price)
	FROM '/Users/Shared/datasets/source_crm/sales_details.csv'
	WITH (FORMAT CSV, HEADER TRUE);
	GET DIAGNOSTICS inserted_rows_count = ROW_COUNT;
	RAISE NOTICE '(Rows Inserted:%)', inserted_rows_count;
	end_time := clock_timestamp();
    duration := end_time - start_time;
    RAISE NOTICE '>> Load Duration: %', duration;
	
	RAISE NOTICE '----------------------------------------';
	RAISE NOTICE 'Loading ERP Tables';
	RAISE NOTICE '----------------------------------------';	

	RAISE NOTICE '>> Truncating Table: bronze.erp_cust_az12';
	start_time := clock_timestamp();
	TRUNCATE TABLE bronze.erp_cust_az12;
	RAISE NOTICE '>> Inserting Data Into: bronze.erp_cust_az12';
	COPY bronze.erp_cust_az12
		(cid,
		bdate,
		gen)
	FROM '/Users/Shared/datasets/source_erp/CUST_AZ12.csv'
	WITH (FORMAT CSV, HEADER TRUE);
	GET DIAGNOSTICS inserted_rows_count = ROW_COUNT;
	RAISE NOTICE '(Rows Inserted:%)', inserted_rows_count;
	end_time := clock_timestamp();
    duration := end_time - start_time;
    RAISE NOTICE '>> Load Duration: %', duration;
	RAISE NOTICE '----------------------------------------';

	RAISE NOTICE '>> Truncating Table: bronze.erp_loc_a101';
	start_time := clock_timestamp();
	TRUNCATE TABLE bronze.erp_loc_a101;
	RAISE NOTICE '>> Inserting Data Into: bronze.erp_loc_a101';
	COPY bronze.erp_loc_a101
		(cid,
		cntry)
	FROM '/Users/Shared/datasets/source_erp/LOC_A101.csv'
	WITH (FORMAT CSV, HEADER TRUE);
	GET DIAGNOSTICS inserted_rows_count = ROW_COUNT;
	RAISE NOTICE '(Rows Inserted:%)', inserted_rows_count;
	end_time := clock_timestamp();
    duration := end_time - start_time;
    RAISE NOTICE '>> Load Duration: %', duration;
	RAISE NOTICE '----------------------------------------';

	RAISE NOTICE '>> Truncating Table: bronze.erp_px_cat_g1v2';
	start_time := clock_timestamp();
	TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	RAISE NOTICE '>> Inserting Data Into: bronze.erp_px_cat_g1v2';
	COPY bronze.erp_px_cat_g1v2
		(id,
		cat,
		subcat,
		maintenance)
	FROM '/Users/Shared/datasets/source_erp/PX_CAT_G1V2.csv'
	WITH (FORMAT CSV, HEADER TRUE);
	GET DIAGNOSTICS inserted_rows_count = ROW_COUNT;
	RAISE NOTICE '(Rows Inserted:%)', inserted_rows_count;
	end_time := clock_timestamp();
    duration := end_time - start_time;
    RAISE NOTICE '>> Load Duration: %', duration;
	RAISE NOTICE '----------------------------------------';
	
	RAISE NOTICE '>> Total Duration: %', clock_timestamp() - batch_start;
	RAISE NOTICE '----------------------------------------';
END $$;
END;
$body$;

CALL bronze.load_bronze();
