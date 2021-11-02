use sakila;

# 1
select store_id, city, country
from store
inner join address using(address_id)
inner join city using(city_id)
inner join country using(country_id);

# 2
select store_id, sum(amount) as "amount_in_dollars"
from store
inner join inventory using(store_id)
inner join rental using(inventory_id)
inner join payment using(rental_id)
group by store_id;

# 3
select name as "category", avg(length) as "average_length"
from category
inner join film_category using(category_id)
inner join film using(film_id)
group by name;

# 4
select name as "category", avg(length) as "average_length"
from category
inner join film_category using(category_id)
inner join film using(film_id)
group by name
order by average_length desc
limit 5;

# 5
select title, count(rental_date) as "number_of_rentals"
from film
inner join inventory using(film_id)
inner join rental using(inventory_id)
group by title
order by number_of_rentals desc;

# 6
select name, sum(amount) as "total_revenue"
from category
inner join film_category using(category_id)
inner join film using(film_id)
inner join inventory using(film_id)
inner join rental using(inventory_id)
inner join payment using(rental_id)
group by name
order by total_revenue desc
limit 5;

# 7
select title, store_id
from film
inner join inventory using(film_id)
inner join store using(store_id)
where title = "ACADEMY DINOSAUR";






