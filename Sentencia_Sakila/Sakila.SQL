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
SELECT f.title, MIN(re.rental_date), MAX(re.return_date) FROM film f
INNER JOIN inventory inv ON f.film_id = inv.film_id
INNER join rental re ON inv.inventory_id = re.inventory_id

--5)

--6)
SELECT count(*), rating from film
group by rating

--17)
SELECT cus.last_name, c.city, co.country, ad.address, pay.amount, re.rental_date from customer cus
INNER JOIN address ad ON cus.address_id = ad.address_id
INNER JOIN city c ON ad.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id
INNER JOIN rental re ON cus.customer_id = re.customer_id
INNER JOIN payment pay ON re.customer_id = pay.customer_id
GROUP BY cus.last_name
ORDER BY  pay.amount ASC

--18)
