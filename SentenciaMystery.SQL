SELECT * FROM crime_scene_report
WHERE type = "murder" AND city like "sql city" AND date = 20180115
SELECT * FROM person
SELECT * FROM person WHERE name like 'Annabel%' AND address_street_name = "Franklin Ave" --info de anabel
SELECT * FROM person WHERE address_street_name = "Northwestern Dr" ORDER BY address_number DESC LIMIT 1 --info de Morty Schapiro

SELECT * FROM drivers_license dl JOIN person p ON dl.id = p.license_id

SELECT * FROM interview tw JOIN person p 
ON tw.person_id = p.id
WHERE address_street_name = "Franklin Ave" AND name = "Annabel Miller"--entrevista--

SELECT * FROM interview tw JOIN person p 
ON tw.person_id = p.id
WHERE address_street_name = "Northwestern Dr" AND name = "Morty Schapiro"--entrevista--

SELECT * FROM drivers_license ld JOIN person p 
ON ld.id = p.license_id
WHERE plate_number like '%H42W%'--busqueda de patente--
              