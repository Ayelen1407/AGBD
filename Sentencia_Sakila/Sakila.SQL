--1)Título de la película, dirección, ciudad y país del local del nombre de una película a elección.
SELECT f.title, ad.address, c.city, co.country FROM film f
INNER JOIN inventory inv ON f.film_id = inv.film_id
INNER JOIN store st ON inv.store_id = st.store_id
INNER JOIN address ad ON st.address_id = ad.address_id
INNER JOIN city c ON ad.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id
WHERE f.title = "BINGO TALENTED"

--2)Mostrar título, categoría, idioma, rating y duración de las películas que estén entre 1 hs y 2 hs.
SELECT f.title, f.rating, f.length, la.name, c.name FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN language la ON f.language_id = la.language_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE f.length BETWEEN 60 AND 120
ORDER BY f.length ASC --para verificar si incluye o no el rango usamos ORDER BY

--3)Mostrar nombre, apellido y dirección (con ciudad y país) de los encargados del local.
SELECT st.first_name, st.last_name, ad.address, c.city, co.country FROM staff st
INNER JOIN address ad ON st.address_id = ad.address_id
INNER JOIN city c ON ad.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id

--4)Mostrar el título, la fecha mínima y máxima de devolución de una película
SELECT f.title, MIN(re.rental_date), MAX(re.return_date) FROM film f
INNER JOIN inventory inv ON f.film_id = inv.film_id
INNER join rental re ON inv.inventory_id = re.inventory_id

--5)

--6)¿Cuántas películas hay en cada tipo de "rating" (g, pg, pg13, r, nc17)
SELECT count(*), rating from film
group by rating

--7)¿Cuántas películas hay en cada "categoría"?
SELECT COUNT(*),ca.name FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category ca ON fc.category_id = ca.category_id GROUP BY ca.category_id

--8)Cuales son los 10 actores/actrices que más aparecen en las películas
SELECT COUNT(*) AS actorxpeli, ac.first_name, ac.last_name FROM film f
INNER JOIN film_actor fm ON f.film_id = fm.film_id
INNER JOIN actor ac ON fm.actor_id = ac.actor_id
GROUP BY f.film_id ORDER BY actorxpeli DESC LIMIT 10

--9)¿Cuántos ejemplares (inventory) en total hay en cada local?  Como no hay nombre del local,
--  poner en su lugar la dirección incluyendo ciudad y país además de la cantidad
SELECT COUNT(inv.film_id), ad.address, c.city, co.country FROM inventory inv
INNER JOIN store st ON inv.store_id = st.store_id
INNER JOIN address ad ON st.address_id = ad.address_id
INNER JOIN city c ON ad.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id
GROUP BY st.store_id

--10)¿Cuántas películas distintas hay en cada local? Como no hay nombre del local,
--   poner en su lugar la dirección incluyendo ciudad y país además de la cantidad
SELECT COUNT(DISTINCT inv.film_id) AS pelis_cadaLocal, ad.address, c.city, co.country FROM film f
INNER JOIN inventory inv ON f.film_id = inv.film_id
INNER JOIN store st ON inv.store_id = st.store_id
INNER JOIN address ad ON st.address_id = ad.address_id
INNER JOIN city c ON ad.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id
GROUP BY st.store_id 

--11)Calcular el costo de alquiler promedio de las película de cada categoría.
SELECT AVG(f.rental_duration * f.rental_rate) AS CostoAlquiler_promedio FROM film f --> AVG te da el promedio de los valores de una columna
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
GROUP BY c.category_id

--12)De la película “ALABAMA DEVIL” mostrar de cada alquiler: el costo total, los días, costo por día,
--   el día que se alquiló y que día se devolvió ordenado por algún criterio a elección
SELECT f.title, f.rental_duration * f.rental_rate AS alquilerTotal,
f.rental_duration AS Dias, rental_rate AS costoxDia, r.rental_date, r.return_date FROM film f
INNER JOIN inventory inv ON f.film_id = inv.film_id
INNER JOIN rental r ON inv.inventory_id = r.inventory_id
WHERE f.title = "ALABAMA DEVIL" ORDER BY r.return_date DESC

--13)Nombre, duración y categoria de todas las peliculas ordenados del más largo al más corto.
SELECT f.title, f.length,c.name as Categoria FROM film f 
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
ORDER BY f.length DESC

--14)Nombre de las peliculas que arranquen‘’w’’ con al menos 5 actores
SELECT f.title, count(fa.actor_id) AS cantidadActores FROM film f 
INNER JOIN film_actor fa ON f.film_id = fa.film_id
WHERE f.title LIKE 'w%'
GROUP BY fa.film_id
HAVING cantidadActores >= 5

--15)Calcular la suma total de los pagos (amount) con nombre y apellido de cada cliente.
SELECT SUM(p.amount) AS sumaTotal_pagos, cu.first_name, cu.last_name FROM payment p
INNER JOIN customer cu ON p.customer_id = cu.customer_id
GROUP BY cu.customer_id

--16)Nombre de la pelicula, duración y nombre del actor de las peliculas más cortas.
SELECT f.title, f.length, a.first_name FROM film f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
INNER JOIN actor a ON fa.actor_id = a.actor_id
ORDER BY f.length ASC

--17) apellido del cliente con su ciudad, pais, direccion, sus alquileres
--    y pagos, ordenado los pagos de menor a mayor.
SELECT cus.last_name, c.city, co.country, ad.address, pay.amount, re.rental_date from customer cus
INNER JOIN address ad ON cus.address_id = ad.address_id
INNER JOIN city c ON ad.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id
INNER JOIN rental re ON cus.customer_id = re.customer_id
INNER JOIN payment pay ON re.customer_id = pay.customer_id
GROUP BY cus.last_name
ORDER BY  pay.amount ASC

--18)Insertarse uno mismo como actor con todos sus campos
INSERT INTO actor (actor_id, first_name, last_name, last_update) VALUES
("201", "Ayelen", "Quispe", "2007-11-14 25:11:29")

--19)Insertar 2 amigos o nombres que consideren.
INSERT INTO actor (actor_id, first_name, last_name, last_update) VALUES
("202", "Ariana", "Villa", "2007-12-14 13:11:30"),
("203", "Rocio", "Albarracin", "2008-07-03 01:23:29")

--20)Modificar los 3 datos ingresados por datos nuevos o de gente famosa.
UPDATE actor SET first_name = "Evelyn", last_name = "Villareal" WHERE actor_id = 201;
UPDATE actor SET first_name = "Valentina", last_name = "Obeso" WHERE actor_id = 202;
UPDATE actor SET first_name = "Abril", last_name = "Herbas" WHERE actor_id = 203
 
--21)Borrar todos los datos ingresados finalmente
DELETE FROM actor WHERE actor_id > 200