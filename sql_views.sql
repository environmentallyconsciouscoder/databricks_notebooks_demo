-- If you remember from a couple of lessons back where we created temporary views on dataframes. The
-- concepts are pretty much the same, except that here you're going to use the SQL syntax to create views
-- on top of tables themselves rather than dataframes.

CREATE TEMP VIEW v_race_results
AS
SELECT *
    FROM demo_race_results_python
  WHERE race_year = 2018;

--   now you should see the data

SELECT * FROM v_race_results;


--   adding the replace will make sure that if it exists it won't break
CREATE OR REPLACE TEMP VIEW v_race_results
AS
SELECT *
    FROM demo_race_results_python
  WHERE race_year = 2018;

-- global view

CREATE OR REPLACE GLOBAL TEMP VIEW gv_race_results
AS
SELECT *
    FROM demo_race_results_python
  WHERE race_year = 2018;

-- you need to use the global.temp to access

SELECT * FROM global_temp.gv_race_results

SHOW TABLES IN global_temp;

-- So the last thing we want to do is to create a permanent view.
-- So this view would be registered on the Hive Meta Store and it is permanent.
-- So even if you detach from the Databricks cluster or terminate the cluster and restart or from another
-- cluster, you will still be able to use it.

CREATE OR REPLACE VIEW demo.pv_race_results
AS
SELECT *
    FROM demo_race_results_python
  WHERE race_year = 2000;

SHOW TABLES IN demo;

-- global temporary view

-- if you want to create a set of views and then use it in the other notebooks within the same application,
-- and then once you've done that batch process or a job, you don't need those views anymore because we
-- produce the outputs and written to, for example, tables.
-- Then you go for a global temporary view.

-- permanent views.

-- if you want to have views which you want to be able to come back and access, then you want to create permanent views.

-- A typical scenario where you might want to have a permanent view is you have a table with a lot of data
-- which is being populated by pipelines and then you have some dashboards accessing these tables.
-- But the data needs to be summarized for the dashboards.

