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
SELECT COUNT(inv.film_id) AS pelis_cadaLocal, ad.address, c.city, co.country FROM film f
INNER JOIN inventory inv ON f.film_id = inv.film_id
INNER JOIN store st ON inv.store_id = st.store_id
INNER JOIN address ad ON st.address_id = ad.address_id
INNER JOIN city c ON ad.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id
GROUP BY st.store_id --falta terminar

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

--18)
