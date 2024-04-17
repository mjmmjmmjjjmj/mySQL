-- # 2005년 5월 1일부터 2005년 5월 10일 사이에 발생한 모든 rental를 검색합니다.
SELECT *
FROM RENTAL
WHERE rental_date
BETWEEN str_to_date('2005-05-01 00:00:00', '%Y-%m-%d %H:%i:%s') 
AND str_to_date('2005-05-01 23:59:59', '%Y-%m-%d %H:%i:%s');

 -- 현재 날짜와 시간으로 새로운 rental 을 추가합니다. 
INSERT INTO rental
(rental_date,inventory_id, customer_id,staff_id)
VALUES (now(), 1, 1, 1);

 -- # 특정 rental id의 반납일을 7일 연장합니다.
UPDATE sakila.rental
SET return_date = adddate(RETURN_DATE, INTERVAL 7 DAY)
WHERE rental_id = 16049;

SELECT *
FROM sakila.rental
where rental_id = 16049;

 -- 각 rental에 대한 rental 기간을 일 단위로 표시합니다.
select rental_date, return_date, datediff(return_date, rental_date)
from rental;

 -- # 2005년 주말에 이루어진 모든 rental 에 대해 rental 날짜를 다음 날로 업데이트합니다.
update rental
set return_date = adddate(rental_date, interval 1 day)
where dayofweek(rental_date) in (1, 7);

-- # 2005년의 월별 rental 건수를 계산합니다.
select year(rental_date), month(rental_date), count(*)
from rental
group by year(rental_date), month(rental_date);

# 2005년 6월 이후의 모든 rental를 찾아보세요.
select *
from rental
where rental_date >=str_to_date('2005-07-01 00:00:00','%Y-%m-%d %H:%i:%s');
-- 
-- 
insert into sakila.payment
(customer_id, staff_id, rental_id, amount, payment_date)
values(1, 1, 76, 1.00, now());

select * 
from rental r left outer join payment p on 
r.rental_id = p.rental_id
where payment_id = null;

select * from sakila.payment;
-- 여기까지 0415
-- 여기서부터 0415 이어서-0417에 한 거
drop trigger book;
delimiter |
create trigger book after update on inventory for each row begin
if (old.reserved != new.reserved)
then
insert into book
(inventory_id, customer_id, book_date, status)
values(old.inventory_id, 1, curdate(), new.reserved);
end if;
end
|
delimiter ;

drop event notification_every;

create event notification_every on schedule every 1 minute
do 
insert into notification
(rental_id, send_date, customer_id, channel_type, last_update)
select rental_id, now(), customer_id, 'KakaoTalk', now()
from rental
where return_date is null
and rental_date between '2006-02-14' and '2006-02-15';

select rental_id, now(), customer_id, 'KakaoTalk'
from rental
where return_date is null
and rental_date between '2006-02-14' and '2006-02-15';


-- 
show databases;
show tables;

use sakila;
show tables;

describe film;

select * from sakila.actor_info;
show databases;
show tables;

use sakila;
show tables;

describe film;

select * from sakila.actor_info;

use sakila;
start transaction;

commit ;;;;

update inventory
set reserved = 1
where inventory_id = 3;

select inventory_id as id 
from sakila.inventory;

select * 
from inventory i
where inventory_id in (1, 2, 3)
except 
select * from inventory i 
where inventory_id in (3, 4);

select * 
from inventory i left join rental r
	on i.inventory_id = r.inventory_id
where inventory_id = 1;

select * from inventory i 
where inventory_id in 
(select inventory_id 
from inventory 
where inventory_id<4);

select inventory_id 
from inventory 
where inventory_id<4;

select * from sakila.my_view;

select * from sakila.actor_info
where actor_id = 3;


use sakila;
start transaction;
update inventory
set reserved = 2
where inventory_id = 4;
commit;
rollback;

use sakila;
select * from inventory;

start transaction;
update inventory
set reserved = 0
where inventory_id = 3; 