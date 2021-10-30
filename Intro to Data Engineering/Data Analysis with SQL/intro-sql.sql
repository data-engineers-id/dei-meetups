-- SELECT only year, month and west from us_housing_units table 
SELECT
  year,
  month,
  west,
FROM
  tutorial.us_housing_units

-- SELECT all columns then renamed it
SELECT
  year AS "Year",
  month AS "Month",
  west AS "West",
  northeast AS "Northeast",
  month_name AS "Month Name",
  midwest AS "Midwest",
  south AS "South"
FROM
  tutorial.us_housing_units
  
-- SELECT all columns
SELECT *
  FROM tutorial.us_housing_units

-- SELECT with LIMIT the result to prevent non stop query running if the table has million rows
SELECT *
  FROM tutorial.us_housing_units
LIMIT 20

-- SELECT with filter the month to get only October data
SELECT *
  FROM tutorial.us_housing_units
WHERE month = 10

-- SELECT with filter the year to get house unit above 1970
SELECT *
  FROM tutorial.us_housing_units
WHERE year > 1970

-- SELECT with filter the year to get house unit between 1970 and 1980
SELECT *
  FROM tutorial.us_housing_units
WHERE year > 1970 AND year < 1980

-- Filtering non number column
SELECT * 
  FROM tutorial.us_housing_units
WHERE month_name = 'October'

-- Use greater than to get the data that comes after letter 'O' which is S that stands for September in this case
SELECT * 
  FROM tutorial.us_housing_units
WHERE month_name > 'October'

-- Notice that it will includes October in the result, because it checks that 'Oc' greater than 'O'
SELECT * 
  FROM tutorial.us_housing_units
WHERE month_name > 'O'

-- Using arithmetic operator
SELECT 
  month,
  month_name,
  south + west AS total_unit_south_and_west
FROM tutorial.us_housing_units

SELECT 
  month,
  month_name,
  (south + west)/2 AS avg_unit_south_and_west
FROM tutorial.us_housing_units

SELECT 
  * 
FROM 
  tutorial.billboard_top_100_year_end
ORDER BY 
  year DESC, 
  year_rank ASC
  
-- LIKE operator
SELECT * 
  FROM tutorial.billboard_top_100_year_end
WHERE "group" LIKE 'Snoop%' -- Note that group is SQL reserved keyword so that we need to enclosed it with double quotes

-- ILIKE operator, non case sensitive. Meanwhile LIKE operator is case sensitive
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE "group" ILIKE 'snoop%'

-- Something started by capitalize "S" word won't be included in the result
SELECT * 
  FROM tutorial.billboard_top_100_year_end
WHERE "group" LIKE 'snoop%'

-- Underscore to specify any character -> individual char
SELECT * 
  FROM tutorial.billboard_top_100_year_end
WHERE artist ILIKE 'dr_ke' -- drake, druke, droke, drike, etc will be included in the result

-- IN operator
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank IN (1, 2, 3)

-- It produces result same like using OR on each values
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank = 1 OR year_rank = 2 OR year_rank = 3

-- How about non non integer/number value? Use single quote
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE artist IN ('Taylor Swift', 'Usher', 'Elvis Presley', 'Diamonds')

-- BETWEEN operator, acts inclusive that return results within the range specified before AND & after AND logical operator
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE year_rank BETWEEN 5 AND 10

-- Is same as:
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE year_rank >= 5 AND year_rank <= 10

-- IS NULL
SELECT * 
  FROM tutorial.billboard_top_100_year_end
WHERE artist IS NULL

-- AND Logical Operator with both numeric value
SELECT * 
  FROM tutorial.billboard_top_100_year_end
WHERE year_rank <= 10 OR year = 2012

-- Using AND with 3 conditions with different value in the comparison operator
-- Will return results top 10 music chart in 2012 which the group is duet ( X feat Y ) 
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE year = 2012
  AND year_rank <= 10
  AND "group" ILIKE '%feat%'
  
-- OR operator
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE year_rank = 5 OR artist = 'Gotye'

-- Using parantheses to apply the year = 2013 condition with one of the clause inside parantheses
-- year = 2013 AND group ILIKE macklemore OR year = 2013 AND group ILIKE timberlake
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND ("group" ILIKE '%macklemore%' OR "group" ILIKE '%timberlake%')

--Is different with

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND "group" ILIKE '%macklemore%' OR "group" ILIKE '%timberlake%'
   
-- NOT operator
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE year = 2013
  AND year_rank NOT BETWEEN 2 AND 3

-- If you just using BETWEEN with non-range values, it's better to use NOT IN instead
SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE year = 2013
  AND year_rank NOT IN (2, 3)
  
-- Using NOT with string value to filter out
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND "group" NOT ILIKE '%macklemore%'

-- Using NOT to get rows of non null artist
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND artist IS NOT NULL
   
-- ORDER BY operator
SELECT *
  FROM tutorial.billboard_top_100_year_end
ORDER BY year -- by default it will be ordered in ascending order if we don't mention the ORDER BY type

SELECT *
  FROM tutorial.billboard_top_100_year_end
ORDER BY year DESC

-- ORDER DATA by multiple columns
SELECT * 
  FROM tutorial.billboard_top_100_year_end
ORDER BY year DESC, year_rank ASC

-- Specifying column number instead of column name
SELECT * 
  FROM tutorial.billboard_top_100_year_end
ORDER BY 1 DESC, 2 ASC -- 1 is year, 2 is year_rank. It's numbering based on order from left to right

SELECT
  *
FROM tutorial.billboard_top_100_year_end
ORDER BY year