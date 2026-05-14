-- Query 1: 
BEGIN;
SELECT set_system_time('2024-01-01 00:00:00+08');

DELETE FROM internet_usage
WHERE entity = 'Afghanistan' AND code = 'AFG';

INSERT INTO internet_usage (entity, code, year, internet_share)
VALUES ('Afghanistan', 'AFG', 2024, 30.0);
COMMIT;

--   Result:
select * from internet_usage where entity = 'Afghanistan' AND code = 'AFG';

-- Query 2: Entwicklung Thailand (alle Jahre)
SELECT year, internet_share
FROM internet_usage_history
WHERE code = 'THA'
UNION ALL 
SELECT year, internet_share
FROM internet_usage
WHERE code = 'THA'
ORDER BY year;

-- Query 3: Anzahl der Messungen pro Land (absteigend)
SELECT entity, COUNT(*) AS measures
FROM (SELECT entity FROM internet_usage
    UNION ALL
    SELECT entity FROM internet_usage_history) AS entities_overall
GROUP BY entity
ORDER BY measures DESC;

-- Query 4: Länder mit >90% Internet 2015
SELECT entity, code, year, internet_share
FROM internet_usage_history
WHERE year = 2015
AND internet_share > 90
ORDER BY internet_share ASC;

-- Query 5: Österreich erstes Jahr >80%
SELECT entity, code, year, internet_share
FROM internet_usage_history
WHERE code = 'AUT'
AND internet_share > 80
ORDER BY year
LIMIT 1;

-- Query 6: Erstes Jahr >80% pro Land
SELECT DISTINCT ON (code) entity, code, year, internet_share
FROM (SELECT entity, code, year, internet_share FROM internet_usage
    UNION ALL
    SELECT entity, code, year, internet_share FROM internet_usage_history) AS entities_overall
WHERE internet_share > 80
ORDER BY code, year;
