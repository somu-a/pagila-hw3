/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */

with b_film AS (
    SELECT film_id
    FROM actor
    JOIN film_actor USING(actor_id) 
    WHERE actor_id = 112),
b_actor AS (
    SELECT actor_id
    FROM film_actor
    WHERE film_id IN (
        SELECT * FROM b_film)
    AND actor_id != 112)
SELECT DISTINCT (actor.first_name || ' ' || actor.last_name) as "Actor Name"
FROM b_actor
JOIN actor USING(actor_id)
ORDER BY "Actor Name";
