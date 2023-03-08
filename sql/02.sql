/*
 * Compute the country with the most customers in it. 
 */
SELECT country.country
FROM customer
JOIN address USING(address_id)
JOIN city USING(city_id)
JOIN country USING(country_id)
WHERE country.country_id != 103
GROUP BY country.country
ORDER BY count(customer.customer_id) DESC
LIMIT 1;
