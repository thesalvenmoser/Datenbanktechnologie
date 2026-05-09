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

-- Query 2:
select * from internet_usage_history where entity = 'Thailand' AND code = 'THA';
