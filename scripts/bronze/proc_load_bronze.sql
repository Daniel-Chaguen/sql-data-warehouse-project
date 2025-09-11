EXEC bronze.load_bronze

CREATE OR ALTER PROCEDURE bronze.load_bronze AS

BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	BEGIN TRY
		PRINT '========================================================';
		PRINT 'Loading data into bronze schema...';
		PRINT '========================================================';

		PRINT '--------------------------------------------------------';
		PRINT'Loading CRM Tables';
		PRINT '--------------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT'>> Truncating Table: bronze.crm_cust_info';
		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT'>> Inserting data into Table: bronze.crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM "C:\Users\danie\OneDrive\Escritorio\progra 2025pt2\minería de datos\sql\warehouse\datasets\source_crm\cust_info.csv"
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>>--------------------------------------------------------';


		SET @start_time = GETDATE();
		PRINT'>> Truncating Table: bronze.crm_prd_info';
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT'>> Inserting data into Table: bronze.crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM "C:\Users\danie\OneDrive\Escritorio\progra 2025pt2\minería de datos\sql\warehouse\datasets\source_crm\prd_info.csv"
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>>--------------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT'>> Truncating Table: bronze.crm_sales_details';
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT'>> Inserting data into Table: bronze.crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM "C:\Users\danie\OneDrive\Escritorio\progra 2025pt2\minería de datos\sql\warehouse\datasets\source_crm\sales_details.csv"
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);

		PRINT '--------------------------------------------------------';
		PRINT'Loading erp Tables';
		PRINT '--------------------------------------------------------';

		PRINT'>> Truncating Table: bronze.erp_cust_az12';
		TRUNCATE TABLE bronze.erp_cust_az12;
		PRINT'>> Inserting data into Table: bronze.erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM "C:\Users\danie\OneDrive\Escritorio\progra 2025pt2\minería de datos\sql\warehouse\datasets\source_erp\CUST_AZ12.csv"
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>>--------------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT'>> Truncating Table: bronze.erp_inv_dtl_a201';
		TRUNCATE TABLE bronze.erp_loc_a101;
		PRINT'>> Inserting data into Table: bronze.erp_inv_dtl_a201';
		BULK INSERT bronze.erp_loc_a101
		FROM "C:\Users\danie\OneDrive\Escritorio\progra 2025pt2\minería de datos\sql\warehouse\datasets\source_erp\LOC_A101.csv"
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>>--------------------------------------------------------';

		SET @start_time = GETDATE();
		PRINT'>> Truncating Table: bronze.erp_inv_dtl_a201';
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		PRINT'>> Inserting data into Table: bronze.erp_inv_dtl_a201';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM "C:\Users\danie\OneDrive\Escritorio\progra 2025pt2\minería de datos\sql\warehouse\datasets\source_erp\PX_CAT_G1V2.csv"
		WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT'>> Load Duration: ' + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>>--------------------------------------------------------';
	END TRY
	BEGIN CATCH
		PRINT '--------------------------------------------------------';
		PRINT 'An error occurred while loading data into bronze schema.';
		PRINT 'Error Occurred: ' + ERROR_MESSAGE();
		PRINT 'Error Occurred: ' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Occurred: ' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '--------------------------------------------------------';
	END CATCH

END;
