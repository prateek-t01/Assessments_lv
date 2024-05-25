-- 1
SELECT 
	p.product_category,
	round(avg(sr.sales_amount),2) as average_sales
from products p
join sales_records sr
on p.product_id = sr.product_id 
where month(sales_date) = 3
GROUP BY p.product_category;

-- 2
select 
	p.product_category,
	sr.product_id,
    dense_Rank() over 
	(PARTITION BY p.product_category order by sales_amount ) 
from sales_records sr
join products p
on p.product_id = sr.product_id
order by sales_amount desc limit 3;

-- 3
select
	customer_id,
	(cume_dist() over (ORDER BY sales_amount) * 100) as contribution
from sales_records
order by customer_id;

-- 4
select
distinct customer_id,
case 
	when month(sales_date) >= 4 then "Consistent Buyer"
    else "Occasional Buyer"
    end as Customer_Classification
from 
sales_records;

-- 5
select 
concat(departure_airport, " - ", arrival_Airport) as flight_route,
round(avg(base_price),0) as "average ticket price"
from flights
group by flight_route;

-- 6
select tickets.flight_id, 
flights.departure_date,
count(tickets.ticket_price)
from tickets
join flights
using (flight_id)
group by flight_id;

-- 7
select
p.passenger_name,
p.frequent_flyer_status,
sum(t.ticket_price) as total_amount_spent
from passengers p
left join tickets t
using (passenger_id)
group by p.passenger_name, p.frequent_flyer_status;

-- 8
select month(ticket_date),
count(ticket_id)
from tickets
group by month(ticket_date)
order by count(ticket_id) desc limit 1;

-- 9
select
p.player_id,
p.player_name,
g.game_genre,
(ps.play_date-p.registration_date)*24 as playtime
from players p
left join playerscores ps
using(player_id)
join games g
using (game_id)
-- group by g.game_genre
order by playtime desc;

-- 10
select 
player_id,
count(game_id) as games_count
from playerscores
group by player_id
order by games_count desc;


-- 11
select 
game_id,
games.game_name,
avg(score) as average_score,
max(Score) as max_score,
count(player_id) as player_count
from playerscores
left join games
using (game_id)
group by game_id
order by max(score) desc, avg(Score) desc, count(player_id) desc;

-- 12
select 
p.registration_date,
ps.player_id,
p.player_name,
ps.play_date
from playerscores ps
left join players p
using(player_id)
where ps.play_date - p.registration_date > 30;

-- 13
select
d.doctor_name,
sum(t.cost) as total_cost
from doctors d
left join treatments t
using(doctor_id)
group by doctor_name
order by total_cost desc;

-- 14
select
t.treatment_name,
t.cost,
concat(round((cume_dist() over (order by cost)*100),0),"%") as contribution
from treatments t
left join patients
using(patient_id);

-- 15
select
patient_id,
patient_name,
admission_date,
discharge_date
from patients 
where (discharge_date < admission_date)  and 
 (discharge_date - admission_date) < 30
 order by admission_date;

-- 16
select
gender,
diagnosis,
avg(discharge_date - admission_date) as avg_stay
from patients
group by gender, diagnosis;

-- 17
select 
c.department,
e.semester,
avg(e.grade) over (partition by department, semester ) as avg_grade
from enrollments e
join courses c
using(course_id);

-- 18
select
c.department as major,
(e.course_id) as course_count,
s.enrollment_year
from courses c
left join enrollments e
using(course_id)
join students s
using(student_id);

-- 19
select 
e.course_id,
sum(c.credit),
e.semester 
from enrollments e
left join courses c
using(course_id);


-- 20
select
c.course_name,
s.enrollment_year,
count(e.enrollment_id) as no_of_students_enrolled
from courses c
left join enrollments e
using (course_id)
left join students s
using (student_id);
