--1)
SELECT f.title, ad.address, c.city, co.country FROM film f
INNER JOIN inventory inv ON f.film_id = inv.film_id
INNER JOIN store st ON inv.store_id = st.store_id
INNER JOIN address ad ON st.address_id = ad.address_id
INNER JOIN city c ON ad.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id
WHERE f.title = "BINGO TALENTED"

--2)
SELECT f.title, f.rating, f.length, la.name, c.name FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN language la ON f.language_id = la.language_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE f.length BETWEEN 60 AND 120
ORDER BY f.length ASC --para verificar si incluye o no el rango usamos ORDER BY

--3)
SELECT st.first_name, st.last_name, ad.address, c.city, co.country FROM staff st
INNER JOIN address ad ON st.address_id = ad.address_id
INNER JOIN city c ON ad.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id

--4)


--6)
SELECT count(*), rating from film
group by rating