%run "../includes/configuration"

%python
race_results_df = spark.read.parquet(f"{presentation_folder_path}/race_results")

%python
race_results_df.write.format("parquet").saveAsTable("demo.race_results_python")

USE demo;
SHOW TABLES;

DESC EXTENDED race_results_python;

SELECT *
    FROM demo.race_results_python
   WHERE race_year = 2020;


CREATE TABLE demo.race_results_sql
AS
SELECT *
    FROM demo.race_results_python
   WHERE race_year = 2020;

SELECT CURRENT_DATABASE()

DROP TABLE demo.race_results_sql;