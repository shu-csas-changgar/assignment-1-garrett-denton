/*
Garrett Denton
Assignment 1
*/

-- 1.
select * from actor
where first_name = 'PENELOPE';

-- 2.
select
a.first_name,
a.last_name
from actor a
join film_actor b on a.actor_id = b.actor_id
	join film c on b.film_id = c.film_id
    where c.title = 'ZOOLANDER FICTION';

-- 3.
select
m.title as 'Movies with JENNIFER DAVIS'
from film m
join film_actor b on m.film_id = b.film_id
	join actor c on b.actor_id = c.actor_id
    where c.first_name = 'JENNIFER'
    and c.last_name = 'DAVIS';

-- 4.
select
a.title as 'Movies LISA ANDERSON still has not returned'
from film a
join inventory b on a.film_id = b.film_id
	join rental c on b.inventory_id = c.inventory_id
		join customer d on c.customer_id = d.customer_id
        where d.first_name = 'LISA'
        and d.last_name = 'ANDERSON'
        and c.return_date is null;

-- 5.
select
a.title as 'Animated Movies'
from film a
join film_category b on a.film_id = b.film_id
	join category c on b.category_id = c.category_id
    where c.name = 'Animation';
   
-- 6. a.
select
count(a.title) as 'Number of films not in English'
from film a
join language b on a.language_id = b.language_id
	where b.name != 'English';
    
-- 6 b.
select 
timestampdiff(day, a.rental_date, a.return_date) * c.rental_rate as Payment
from rental a
join inventory b on a.inventory_id = b.inventory_id
	join film c on b.film_id = c.film_id
		join customer d on a.customer_id = d.customer_id
		where c.title = 'CLOSER BANG'
		and d.first_name = 'PAULA'
        and d.last_name = 'BRYANT';
    
-- 7.    
select
a.first_name,
a.last_name
from staff a
join rental b on a.staff_id = b.staff_id
	join inventory c on b.inventory_id = c.inventory_id
		join film d on c.film_id = d.film_id
			join customer e on b.customer_id = e.customer_id
			where d.title = 'CHAINSAW UPTOWN'
			and e.first_name = 'MARIE'
			and e.last_name = 'TURNER';
