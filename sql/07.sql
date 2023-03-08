/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

WITH b_f as (SELECT film.film_id
    FROM film
    JOIN film_actor using (film_id)
    JOIN actor using (actor_id)
    WHERE actor.actor_id = 112),

b_1 as (SELECT DISTINCT actor.actor_id, actor.first_name, actor.last_name
    FROM actor
    JOIN film_actor using (actor_id)
    JOIN film using (film_id)
    WHERE film.film_id IN (SELECT * from b_f)
    AND actor.actor_id !=112),

b_2 as (SELECT film.film_id
    FROM film
    JOIN film_actor using (film_id)
    JOIN actor using (actor_id)
    WHERE actor.actor_id in (SELECT actor_id FROM b_1))

SELECT DISTINCT (actor.first_name || ' ' || actor.last_name) AS "Actor Name"
FROM actor
JOIN film_actor using (actor_id)
JOIN film using (film_id)
WHERE film.film_id IN (SELECT * from b_2)
AND actor.actor_id != 112
AND actor.actor_id NOT IN (SELECT actor_id FROM b_1)
ORDER BY "Actor Name";

