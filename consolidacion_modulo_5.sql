-- 1 - Aquellas usadas para insertar, modificar y eliminar un Customer, Staff y Actor.

-- Para Insertar:

INSERT INTO customer (store_id, first_name, last_name, email, address_id, activebool)
VALUES (1, 'Javier', 'Retamal', 'javier@retamal.com', 1, TRUE);

INSERT INTO actor (first_name, last_name)
VALUES ('Javier', 'Retamal');

INSERT INTO staff (first_name, last_name, address_id, email, store_id, active, username, password)
VALUES ('Javier', 'Retamal', 1, 'hola@mundo.com', 1, true, 'retamal_f', 'mypassword123');



-- Para Modificar:

UPDATE customer 
SET first_name = 'Alejandro', last_name = 'Fontannaz'
WHERE customer_id = 601;

UPDATE actor
SET first_name = 'Alejandro', last_name = 'Fontannaz'
WHERE actor_id = 201;

UPDATE staff
SET email = 'nuevo_email@mundo.cl'
WHERE staff_id = 3;



-- Para Borrar:

DELETE FROM customer
WHERE customer_id = 601;

DELETE FROM actor
WHERE actor_id = 201;

DELETE FROM staff
WHERE staff_id = 3;



-- 2 - Listar todas las “rental” con los datos del “customer” dado un año y mes.

SELECT rental.rental_id, rental.rental_date, customer.first_name, customer.last_name
FROM rental
INNER JOIN customer ON rental.customer_id = customer.customer_id
WHERE EXTRACT(YEAR FROM rental.rental_date) = 2005 
    AND EXTRACT(MONTH FROM rental.rental_date) = 7;

-- 3 - Listar Número, Fecha (payment_date) y Total (amount) de todas las "payment"

SELECT payment_id, payment_date, amount
FROM payment;

-- 4 - Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0

SELECT *
FROM film
WHERE rental_rate > 4.0
	AND release_year = 2006;


-- 5 - Realiza un Diccionario de datos que contenga el nombre de las tablas y columnas, si éstas pueden ser nulas, y su tipo de dato correspondiente.

SELECT table_name AS "Tabla",
       column_name AS "Columna",
       is_nullable AS "Puede ser nulo",
       data_type AS "Tipo de dato"
FROM information_schema.columns
WHERE table_schema = 'public'
      AND table_catalog = 'dvdrental'
ORDER BY table_name, column_name;