-- GROUP BY
SELECT <select list>
FROM <table>
WHERE <predicates>
GROUP BY <expression>
ORDER BY…

SELECT <select list>
FROM <table>
WHERE <predicates>
GROUP BY <expression>
HAVING <predicates>
ORDER BY…

HAVING:
❑ These predicates can only reference columns or expression
used in the GROUP BY clause.
❑ Aggregation functions are also allowed, even if it's using
columns not in the GROUP BY clause.'



-- SESSION 7
SELECT <select list>
FROM <table>
WHERE <predicates>
ORDER BY…
GROUP BY <expression>
-- These predicates can only reference columns or expression used in the GROUP BY clause.
SELECT CONTINENT, SUM(POPULATION), COUNT(*)
FROM COUNTRIES
GROUP BY CONTINENT
HAVING CONTINENT = 'AMERICA';

SELECT CONTINENT, SUM(POPULATION), COUNT(*)
FROM COUNTRIES
GROUP BY CONTINENT
HAVING COUNT(*) > 2;

SELECT SUBSTR(CONTINENT,1,2), SUM(POPULATION)
FROM COUNTRIES
GROUP BY CONTINENT;

SELECT CONTINENT, SUM(POPULATION)
FROM COUNTRIES
GROUP BY CONTINENT
HAVING COUNT(POPULATION) < 40;