
INSERT INTO university_rankings (institution, country, year, world_rank, score)
VALUES ('Duke Tech', 'USA', 2014, 350, 60.5)

-- Insert a new record for Duke Tech in 2014 with a world rank of 350 and a score of 60.5, where the rest of the fields remains as null

SELECT COUNT(DISTINCT institution) 
FROM university_rankings
WHERE year = 2013
  AND country = 'Japan'
  AND world_rank BETWEEN 1 AND 200;

-- There are 6 distinct institutions in Japan ranked between 1 and 200 in 2013.

UPDATE university_rankings
SET score = score + 1.2
WHERE institution = 'University of Oxford'
  AND year = 2014;

-- This update the score of University of Oxford in 2014 from 97.51 to 98.71

DELETE FROM university_rankings
WHERE year = 2015
  AND score < 45;
  
-- This delete all records in 2015 where the score is less than 45

-------------------

SELECT COUNT(*) AS total_rows 
FROM university_rankings

-- This query returns the total number of rows in the university_rankings table, which is 1645

SELECT world_rank, institution, country, score
FROM university_rankings
WHERE year = 2015
ORDER BY world_rank ASC
LIMIT 10;

-- This query returns the top 10 institutions in 2015 based on their world rank, along with their country and score.

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

SELECT COUNT(DISTINCT institution) AS unique_institutions
FROM university_rankings;

SELECT COUNT(DISTINCT country) AS unique_countries 
FROM university_rankings;

-- This query returns the number of unique institutions and countries in the university_rankings table.
-- There are 1005 unique institutions and 59 unique countries in the university_rankings table.  

SELECT
  year,
  MIN(score) AS min_score,
  MAX(score) AS max_score,
  AVG(score) AS avg_score
FROM university_rankings
GROUP BY year
ORDER BY year;

-- This query returns the minimum, maximum, and average scores from the university_rankings table.
-- The minimum score is 43.36, the maximum score is 100.0, and the average score is approximately 48.96.

SELECT
  year,
  COUNT(*) AS usa_top100
FROM university_rankings
WHERE country = 'USA'
  AND world_rank BETWEEN 1 AND 100
GROUP BY year
ORDER BY year;

-- This query returns the number institutions in the USA that are ranked between 1 and 100 in the year 2015.
-- There are 55 institutions in the USA ranked between 1 and 100 in 2015.

