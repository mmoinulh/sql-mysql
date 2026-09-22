--  Reorder the data form a continuous sequence without any gaps.
-- When We use auto_increment of id and delete some rows, then id sequence became inconsecutive.
-- So we need to reorder it in order to get back to normal.

-- This sql will return next value for id column if you don't have one.
ALTER TABLE tablename AUTO_INCREMENT = 1;

-- OR

-- Step 1: Create a temporary table with the reordered data
CREATE TABLE temp_category AS
SELECT
  ROW_NUMBER() OVER (ORDER BY id) AS id,
  cat_name
FROM category;

-- Step 2: Drop the original table
DROP TABLE category;

-- Step 3: Rename the temporary table to the original table name
ALTER TABLE temp_category
RENAME TO category;


-- * Delete all data from a table

DELETE FROM table_name;