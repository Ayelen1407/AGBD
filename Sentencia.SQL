SELECT * FROM HABITANT 
SELECT * FROM HABITANT WHERE state = "friendly"
SELECT * FROM HABITANT WHERE state = "friendly" AND job = "weaponsmith"
SELECT * FROM HABITANT WHERE state = "friendly" AND job LIKE '%smith'
SELECT personid FROM INHABITANT WHERE name = "Stranger"
SELECT gold FROM INHABITANT WHERE name = "Stranger"
SELECT * FROM ITEM WHERE owner IS NULL
UPDATE item SET owner = 20 WHERE owner IS NULL
SELECT * FROM ITEM WHERE owner = 20
SELECT * FROM INHABITANT WHERE state = "friendly" AND job = "dealer" OR job = "merchant"
UPDATE item SET owner = 15 WHERE item = "ring" OR item = "teapot"
UPDATE inhabitant SET gold = gold + 120 WHERE personid = 20
UPDATE inhabitant SET name = "Sam" WHERE personid = 20
SELECT * FROM inhabitant WHERE job = "baker" ORDER BY gold DESC
INSERT INTO ITEM (item,owner) VALUES ('sword',20) --(?)
SELECT * FROM INHABITANT WHERE job = "pilot"
SELECT village.name FROM village, inhabitant WHERE village.villageid = inhabitant.villageid AND inhabitant.name = 'Dirty Dieter' --(?)
