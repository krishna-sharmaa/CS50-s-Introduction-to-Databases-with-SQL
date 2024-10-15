CREATE VIEW june_vacancies AS
SELECT
  listings.id,
  listings.property_type,
  listings.host_name,
  COUNT(availabilities.id)
FROM
  listings JOIN availabilities ON
    listings.id = availabilities.listing_id
GROUP BY
  availabilities.listing_id
HAVING
  (availabilities.date BETWEEN "2023-06-01" AND "2023-06-30")
  AND
  (availabilities.available = 'TRUE')
;
