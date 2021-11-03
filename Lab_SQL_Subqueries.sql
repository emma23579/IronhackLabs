use sakila;

# 1. How many copies of the film Hunchback Impossible exist in the inventory system?
select title, count(film_id) as "number_of_copies"
from film
inner join inventory using(film_id)
where title = "HUNCHBACK IMPOSSIBLE"
group by title;

# 2. List all films whose length is longer than the average of all the films.
select title, length 
from film 
where film.length > 
(select avg(length) from film);

# 3. Use subqueries to display all actors who appear in the film Alone Trip.
select first_name, last_name 
from actor
inner join film_actor using(actor_id)
inner join film using(film_id)
where title = "ALONE TRIP";

select first_name, last_name
from actor
where actor_id in 
(select actor_id from film_actor where film_id in 
(select film_id from film where title = "ALONE TRIP"));

# 4. Identify all movies categorized as family films.
select * from category;

select title
from film
where film_id in
(select film_id from film_category where category_id in
(select category_id from category where name = "Family"));

# 5. Get name and email from customers from Canada using subqueries. Do the same with joins. 
select first_name, last_name, email
from customer
where address_id in
(select address_id from address where city_id in
(select city_id from city where country_id in
(select country_id from country where country = "Canada")));

select first_name, last_name, email
from customer
inner join address using(address_id)
inner join city using(city_id)
inner join country using(country_id)
where country = "Canada";

# 6. Which are films starred by the most prolific actor?
select actor_id, count(film_id) 
from film_actor 
group by actor_id 
order by count(film_id) desc 
limit 1;

select title as "Films_starred_by_most_prolific_actor"
from film
where film_id in
(select film_id from film_actor where actor_id = 
(select actor_id
from film_actor 
group by actor_id 
order by count(film_id) desc 
limit 1));

# 7. Films rented by most profitable customer. 
select customer_id, sum(amount)
from payment
group by customer_id 
order by sum(amount) desc;

select title as "films_rented_by_most_profitable_customer"
from film
where film_id in
(select film_id from inventory where inventory_id in
(select inventory_id from rental where customer_id =
(select customer_id
from payment
group by customer_id 
order by sum(amount) desc
limit 1)));

# 8. Customers who spent more than the average payments.
select first_name, last_name
from customer
where customer_id in 
(select customer_id from payment where amount > 
(select avg(amount) from payment));



