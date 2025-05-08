--Nombre y Apellido de todos los empleados, en orden alfabético
SELECT FirstName, LastName FROM employees ORDER BY FirstName, LastName ASC

SELECT Title, Milliseconds FROM albums al INNER JOIN tracks tr ON al.AlbumId = tr.TrackId 
WHERE tr.AlbumId = 5 ORDER BY Milliseconds DESC

SELECT g.name, COUNT(g.GenreId) FROM genres g INNER JOIN tracks t ON g.GenreId = t.GenreId