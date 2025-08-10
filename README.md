# Task 4: SQL for Data Analysis (Ecommerce)

## How to run (SQLite)
1. Install sqlite3 (if not installed).
2. Run sqlite3 ecommerce.db < ecommerce_schema.sql
3. Open ecommerce.db with DB Browser for SQLite or run queries:
   - sqlite3 ecommerce.db then .tables and SELECT ...
4. Query file: ecommerce_queries.sql contains the queries to run. Screenshots in /screenshots.

## Files
- ecommerce_schema.sql — schema + sample data.
- ecommerce_queries.sql — queries used for analysis (SELECT, GROUP BY, JOINS, subqueries).
- screenshots/ — screenshots of results.

## Notes
- For Postgres/MySQL change autoincrement syntax (SERIAL / AUTO_INCREMENT) and date functions.
