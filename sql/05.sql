/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */

SELECT DISTINCT film.title
FROM film
JOIN film_actor as American_1 on (film.film_id = American_1.film_id)
JOIN film_actor as American_2 on (American_1.film_id = American_2.film_id)
WHERE American_1.actor_id in (
    SELECT film_actor.actor_id
    FROM film
    JOIN film_actor on (film.film_id = film_actor.film_id)
    WHERE film.title = 'AMERICAN CIRCUS')
AND American_2.actor_id in (
    SELECT film_actor.actor_id
    FROM film
    JOIN film_actor on (film.film_id = film_actor.film_id)
    WHERE film.title = 'AMERICAN CIRCUS')
AND American_1.actor_id != American_2.actor_id
ORDER BY film.title
