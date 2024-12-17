SELECT * FROM khtcafe.tables;
use khtshopping;
select * from product;

select * from `order`;

select * from review;

select * from order_item;

set sql_safe_updates = 0;

alter table `order` modify column status enum('PENDING','SHIPPED','DELIVERED','CANCELLED','대기','배송 중','배송 완료','취소');



update `order` set status = '취소' where status = 'CANCELLED';

commit;

alter table `order` modify column status enum('대기','배송 중','배송 완료','취소') default '대기' ;

set sql_safe_updates = 1;

USE khtuser;
select * from user;

-- 이메일주소 도메인이 example.com -> kht.co.kr 변경
-- concat substring substrin_index 이용해서 변경
-- like로 일치하는지 확인 후 변경

select concat('Hello','','World','!'); -- concat 이어붙여 출력되는지 확인

select substring_index('user@example.com','@',1); -- user

select substring_index('user@example.com','@',-1); -- example.com

select concat(substring_index('user@example.com','@',1),'@kht.com');
/*
Error CODE : 1241 잘못된 문법으로 문야열 처리를 시도했기 때문에 발생한 에러코드
Error CODE : 1175 SAFE UPDATE MODE 비활성화
-> 1번 EDIT -> Preferences -> SQL Editor -> 맨밑에 Safe Updatres(reject Update and Delete ~~) 비활성화 
   또는
   2번 set sql_safe_updates = 0;
*/
set sql_safe_updates = 0;
update user set email = concat(substring_index(email,'@',1),'@kht.com');

-- user 테이블 에서 전화번호 앞에 +82) 를 붙여주기
-- 최종 PHONE +82)010-xxxx-xxxx
/*
ERROR CODE : 1406 : 컬럼이 VARCHAR(20)또는 그보다 작은 길이로 정의된 경우 새로운 값이 길이 제한을 넘어서기 때문에 발생하는 에러
컬럼에 존재하는 길이 늘리기
*/
alter table user modify column phone varchar(20);

start transaction; -- 트랜잭션 개념 ACID 개념이해가 더 중요함

UPDATE USER set PHONE = concat('+082)',PHONE);



update user set PHONE = '010-5678-9012' where username = '최수지';
-- ('홍길동', 'hong@example.com', 'hashed_password_1', '010-1234-5678', 'ACTIVE'),
-- ('김영희', 'kim@example.com', 'hashed_password_2', '010-2345-6789', 'ACTIVE'),
-- ('이철수', 'lee@example.com', 'hashed_password_3', '010-3456-7890', 'INACTIVE'),
-- ('박민수', 'park@example.com', 'hashed_password_4', '010-4567-8901', 'ACTIVE'),
-- ('최수지', 'choi@example.com', 'hashed_password_5', '010-5678-9012', 'ACTIVE');

select * from user;


USE KHTUSER;

commit;

-- +082) 지우기
update user set phone = substring_index(PHONE,')',-1);
-- concat 이용하고 ) 기준으로해서 지우기

-- SAVEPOINT "SP1";
savepoint SP1;
-- KOR)010-XXXX-XXXX 이런식으로 맨 앞에 KOR) 붙이기

UPDATE USER SET PHONE = CONCAT('KOR)',PHONE);

UPDATE USER 
SET PHONE = CONCAT('KOR)', SUBSTRING_INDEX(PHONE, ')', -1));

select * from user;

-- ROLLBACK 이용해서 "SP1"되돌리기
