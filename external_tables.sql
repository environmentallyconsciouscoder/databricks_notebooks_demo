%python
race_results_df.write.format("parquet").option("path", f"{presentation_folder_path}/race_results_ext_py").saveAsTable("demo.race_results_ext_py")

DESC EXTENDED demo.race_results_ext_py

CREATE TABLE demo.race_results_ext_sql
(
    race_year INT,
    race_name STRING,
    race_date TIMESTAMP,
    circuit_location STRING,
    driver_name STRING,
    driver_number INT,
    driver_nationality: STRING,
    team STRING,
    grid INT,
    fastest_lap INT,
    race_time STRING,
    points FLOAT,
    position INT,
    created_date TIMESTAMP
)
USING parquet
LOCATION "/mnt/formula1dl/presentation/race_results_ext_sql"

INSERT INTO demo.race_results_ext_sql
SELECT * FROM demo.race_results_ext_py WHERE race_year = 2020;

SELECT COUNT(1) FROM demo.race_results_ext_sql;

SHOW TABLES IN demo;

-- # after you delete it , it won't show up when you type show tables but it will still be in the storage account
DROP TABLE demo.race_results_ext_sql;

