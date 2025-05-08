--1
SELECT Title, COUNT(t.Name) from albums al INNER JOIN tracks t ON al.AlbumId = t.AlbumId WHERE t.AlbumId = 73
--2
SELECT art.Name, t.Name, COUNT(t.TrackId)as cancion FROM artists art INNER JOIN albums al ON al.ArtistId = art.ArtistId
INNER JOIN tracks t ON al.AlbumId = t.AlbumId GROUP BY art.Name HAVING cancion >= 30 ORDER BY cancion ASC
--Having es para filtrar campos contados
--3
INSERT INTO tracks(Name, MediaTypeId, Milliseconds,UnitPrice) VALUES 
("Havana","1", "1023637", "0,80"),
("Lasyra", "1", "12200", "1.00"),
("Sky", "1", "387282", "0.90"),
("White", "1", "33682", "0.90"),
("Serena", "1", "123241", "0.50"),
("Full Angels", "1", "335625", "0.80")
--4
UPDATE tracks SET Name = "lluvia" WHERE Name = "Sky"
UPDATE tracks SET Milliseconds == "111111" WHERE Milliseconds = "12200"
--5
