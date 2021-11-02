use sakila;

# 1 
select first_name, last_name, count(film_id) 
from film_actor
inner join actor using(actor_id)
group by actor_id
order by count(film_id) desc
limit 1;

# 2
select first_name, last_name, count(rental_date) 
from rental
inner join customer using(customer_id)
group by customer_id
order by count(rental_date) desc
limit 1;

# 3
select name as "category", count(film_id) as "number_of_films"
from film_category
inner join category using(category_id)
group by name
order by number_of_films desc;

# 4
select first_name, last_name, address
from staff
inner join address using(address_id);

# 5
select first_name, last_name, sum(amount) as "total_amount"
from staff
inner join payment using(staff_id)
where payment_date like "2005-08%"
group by staff_id;

# 6
select title, count(actor_id) as "number_of_actors"
from film
inner join film_actor using(film_id)
group by title
order by number_of_actors desc;

# 7
select first_name, last_name, count(amount) as "total_paid"
from customer
inner join payment using(customer_id)
group by customer_id
order by last_name;

select title, count(rental_date) as "times_rented"
from film
inner join inventory using(film_id)
inner join rental using(inventory_id)
group by title
order by times_rented desc
limit 1;


