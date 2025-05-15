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

--7) Nombre del tema, duración, nombre del disco y nombre del artista de los 20 temas más cortos

--8) Apellido, puesto, apellido del jefe y cantidad de clientes que atiende de todos los empleados,
-- ordenado desde los que atienden más clientes a los que atienden menos
YO LO HAGO

--9) Insertar cuatro (4) canciones que les gusten

--10) Mostrar las cuatro canciones ingresadas

--11) Modifiquen dos (2) canciones por otras que se les ocurran

--12) Mostrar las dos (2) canciones modificadas

--13) Borrar dos (2) datos ingresados, realizando un solo delete