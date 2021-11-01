use bank;

# Query 1
select * from client;

select client_id 
from client 
where district_id = 1 
limit 5;

# Query 2
select max(client_id)
from client
where district_id = 72
order by client_id;

# Query 3
select * from loan;

select amount 
from loan
order by amount
limit 3;

# Query 4
select distinct status
from loan
order by status;

# Query 5
select loan_id
from loan
order by payments desc
limit 1;

# Query 6
select account_id as "#id", amount
from loan
order by account_id
limit 5;

# Query 7
select account_id
from loan
where duration = 60
order by amount
limit 5;

# Query 8
select * from bank.order;

select distinct k_symbol
from bank.order
order by k_symbol;

# Query 9
select order_id
from bank.order
where account_id = 34;

# Query 10
select distinct account_id 
from bank.order
where 29540 <= order_id and order_id <= 29560;

# Query 11
select amount
from bank.order
where account_to = 30067122;

# Query 12
select * from trans;

select trans_id, date, type, amount
from trans
where account_id = 793
order by date desc
limit 10;

# Query 13
select * from client;

select district_id, count(client_id)
from client
where district_id < 10
group by district_id
order by district_id;

# Query 14
select * from card;

select type, count(card_id) as "number"
from card
group by type
order by count(card_id) desc;

# Query 15
select * from loan;

select account_id, sum(amount)
from loan
group by account_id
order by sum(amount) desc
limit 10;

# Query 16
select date, count(loan_id)
from loan
where date < 930907
group by date
order by date desc;

# Query 17
select date, duration, count(loan_id)
from loan
where date like "9712%"
group by duration, date
order by date, duration asc;

# Query 18
select * from trans;

select account_id, type, sum(amount) as "total_amount"
from trans
where account_id = 396
group by type
order by type;

# Query 19
select account_id, 
case type when "PRIJEM" then "INCOMING" else "OUTGOING" end as transaction_type, 
floor(sum(amount)) as "total_amount"
from trans
where account_id = 396
group by type
order by type;

# Query 20
select account_id, type, total_amount,
sum( if( type = "PRIJEM", total_amount, 0) ) as "INCOMING",
sum( if( type = "VYDAJ", total_amount, 0) ) as "OUTGOING"
from trans
where account_id = 396
group by type
order by type;


