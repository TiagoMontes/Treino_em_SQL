SELECT * FROM film_actor
JOIN actor on film_actor.actor_id = actor.actor_id;

-- contagem de filmes que um ator participou
SELECT Count(*) as Filmes_participados, first_name FROM film_actor 
JOIN actor on film_actor.actor_id = actor.actor_id
GROUP BY actor.actor_id
ORDER BY Count(*) DESC
;

-- contagem de quantos atores tem em um certo filme
SELECT Count(*) As Qtd_Atores, film.title as Filme FROM film_actor
JOIN film on film_actor.film_id = film.film_id
GROUP BY film.film_id
ORDER BY Count(*) DESC
;


-- Qual o filme mais alugado?
SELECT Count(*) as Qtd_Alugado, film.title as Filme FROM inventory 
JOIN rental on inventory.inventory_id = rental.inventory_id 
JOIN film on inventory.film_id = film.film_id
GROUP BY film.title
;

-- Qual o filme mais lucrativo
SELECT sum(payment.amount) AS LUCRO, film.title FROM payment
JOIN rental ON rental.rental_id = payment.rental_id
JOIN inventory ON inventory.inventory_id = rental.inventory_id
JOIN film ON film.film_id = inventory.film_id
GROUP BY film.film_id
ORDER BY LUCRO DESC
;
