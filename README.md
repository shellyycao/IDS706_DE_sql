# IDS706_DE_sql

For this assignment, I use SQLite in the terminal to perform data analysis.

Here is what I did:
1. Put db file in the folder.
2. Run 'sqlite < filename >.db' to allow SQLite operation, my filename is 'university_databas', so I ran 'sqlite.university_database.db in the terminal.

————————

**CRUD Operations:**  

Insert a new record for Duke Tech in 2014 with a world rank of 350 and a score of 60.5, where the rest of the fields remains as null:

```bash
INSERT INTO university_rankings (institution, country, year, world_rank, score)
VALUES ('Duke Tech', 'USA', 2014, 350, 60.5)
```
——————————

How many universities from Japan show up in the global top 200 in 2013?

```bash
SELECT COUNT(DISTINCT institution) 
FROM university_rankings
WHERE year = 2013
  AND country = 'Japan'
  AND world_rank BETWEEN 1 AND 200;
```
There are 6 distinct institutions in Japan ranked between 1 and 200 in 2013.

——————————

The score for University of Oxford in 2014 was miscalculated:

```bash
UPDATE university_rankings
SET score = score + 1.2
WHERE institution = 'University of Oxford'
  AND year = 2014;
```
This update the score of University of Oxford in 2014 from 97.51 to 98.71

——————————

Clean up the records

```bash
DELETE FROM university_rankings
WHERE year = 2015
  AND score < 45;
```

This delete all records in 2015 where the score is less than 45


————————————————————————————————

**Criterion Long Description:**

Q: How many observations/rows are there?

```bash
SELECT COUNT(*) AS total_rows 
FROM university_rankings
```
A: This query returns the total number of rows in the university_rankings table, which is 1645

———————————

Q: What is the top 10 institutions in 2015?

```bash
SELECT world_rank, institution, country, score
FROM university_rankings
WHERE year = 2015
ORDER BY world_rank ASC
LIMIT 10;
```

A: This query returns the top 10 institutions in 2015 based on their world rank, along with their country and score.

--1|Harvard University|USA|100.0  
--2|Stanford University|USA|98.66  
--3|Massachusetts Institute of Technology|USA|97.54  
--4|University of Cambridge|United Kingdom|96.81  
--5|University of Oxford|United Kingdom|96.46  
--6|Columbia University|USA|96.14  
--7|University of California, Berkeley|USA|92.25  
--8|University of Chicago|USA|90.7  
--9|Princeton University|USA|89.42  
--10|Cornell University|USA|86.79  

———————————

Q: How many distinct institution and countires are there?

```bash
SELECT COUNT(DISTINCT institution) AS unique_institutions
FROM university_rankings;

SELECT COUNT(DISTINCT country) AS unique_countries 
FROM university_rankings;
```

A:This query returns the number of unique institutions and countries in the university_rankings table. There are 1005 unique institutions and 59 unique countries in the university_rankings table.  

———————————

Q: What is the minimum, maximum, and average scores from the university_rankings table for each year?

```bash
SELECT
  year,
  MIN(score) AS min_score,
  MAX(score) AS max_score,
  AVG(score) AS avg_score
FROM university_rankings
GROUP BY year
ORDER BY year;
```

A: This query returns the minimum, maximum, and average scores from the university_rankings table for each year.

year|min_score|max_score|avg_score  
2012|43.36|100.0|54.9409  
2013|44.26|100.0|55.2712  
2014|44.18|100.0|47.2858241758242  
2015|45.0|100.0|49.9744369369369  

———————————

Q: How many institutions in the USA that are ranked between 1 and 100 each year?

```bash
SELECT
  year,
  COUNT(*) AS usa_top100
FROM university_rankings
WHERE country = 'USA'
  AND world_rank BETWEEN 1 AND 100
GROUP BY year
ORDER BY year;
```

A: This query returns the number institutions in the USA that are ranked between 1 and 100 each year.

year|usa_top100  
2012|58  
2013|57  
2014|53  
2015|55  

————————————————

Q: What is the average score of USA institutions ranked <= 50 by year?

```bash
SELECT
  year,
  AVG(score) AS avg_score_usa_top50
FROM university_rankings
WHERE country = 'USA'
  AND world_rank <= 50
GROUP BY year
ORDER BY year;
```

A: This returns the average score among USA institutions whose world_rank is in the top 50.

year|avg_score_usa_top50  
2012|63.5424324324324  
2013|65.1211764705882  
2014|73.3648387096774  
2015|71.3666666666667  

Looks like US top 50 schools’ average score rose a lot from 2012→2014, then dropped a bit in 2015, but still stayed well above 2012–2013 levels! Which is a good sign that indicates the performance of top institutions in USA is improving!


————————————



*Note: The qr.sql is used to take notes/ record my commands, everything is transferred to this README file.