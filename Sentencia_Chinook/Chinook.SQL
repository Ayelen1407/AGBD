--1) Nombre y Apellido de todos los empleados, en orden alfabético
SELECT FirstName, LastName FROM employees ORDER BY FirstName, LastName ASC

--2) Nombre y duración de todas las canciones del álbum "Big Ones" ordenados del más largo al más corto
SELECT Title, Milliseconds FROM albums al INNER JOIN tracks tr ON al.AlbumId = tr.TrackId 
WHERE tr.AlbumId = 5 ORDER BY Milliseconds DESC

--3) Nombre de todos los géneros con la cantidad de canciones de cada uno
SELECT g.name, COUNT(g.GenreId) FROM genres g INNER JOIN tracks t ON g.GenreId = t.GenreId GROUP BY g.GenreId

--4) Nombre de los discos con al menos 5 canciones
SELECT al.title, count(t.TrackId) AS canciones_x_disco FROM tracks t 
INNER JOIN albums al ON t.AlbumId = al.AlbumId 
GROUP BY al.AlbumId
HAVING canciones_x_disco >= 5
ORDER BY canciones_x_disco ASC

--5) Nombre y precio total de los 10 discos más baratos
SELECT al.title, t.UnitPrice FROM tracks t 
INNER JOIN albums al ON t.AlbumId = al.AlbumId
GROUP BY al.title
ORDER BY t.UnitPrice ASC
LIMIT 10

--6) Nombre del tema, nombre del género y nombre del disco del los temas que valen $0.99
SELECT t.name, al.title, t.UnitPrice, g.name FROM tracks t 
INNER JOIN albums al ON t.AlbumId = al.AlbumId
INNER JOIN genres g ON t.GenreId = g.GenreId
WHERE t.UnitPrice = 0.99

--7) Nombre del tema, duración, nombre del disco y nombre del artista de los 20 temas más cortos
SELECT t.name, al.title, t.Milliseconds, ar.name FROM tracks t 
INNER JOIN albums al ON t.AlbumId = al.AlbumId
INNER JOIN artists ar ON al.ArtistId = ar.ArtistId
ORDER BY t.Milliseconds ASC
LIMIT 20

--8) Apellido, puesto, apellido del jefe y cantidad de clientes que atiende de todos los empleados,
-- ordenado desde los que atienden más clientes a los que atienden menos
SELECT e.LastName as Apellido_Jefe, e.Title as Puesto, jef.LastName AS Apellido_Emple, COUNT(cu.CustomerId) as clientes_x_empleado FROM employees e
INNER JOIN employees jef ON e.EmployeeId = jef.ReportsTo
INNER JOIN customers cu ON jef.EmployeeId = cu.SupportRepId
GROUP BY jef.EmployeeId

--9) Insertar cuatro (4) canciones que les gusten
INSERT INTO tracks (name, MediaTypeId, Milliseconds, UnitPrice) VALUES
("Happy", "1", "253149", "1.50"),
("Boom", "1", "362968", "1.00"),
("Dream", "1", "463947", "0.99"),
("Sky", "1", "347566", "0.80")

--10) Mostrar las cuatro canciones ingresadas
SELECT * FROM tracks
WHERE TrackId >= 3504

--11) Modifiquen dos (2) canciones por otras que se les ocurran
UPDATE tracks SET name = "Rock" WHERE name = "Dream";
UPDATE tracks SET name = "Life" WHERE name = "Sky"

--12) Mostrar las dos (2) canciones modificadas
SELECT * FROM tracks
WHERE TrackId >= 3506

--13) Borrar dos (2) datos ingresados, realizando un solo delete