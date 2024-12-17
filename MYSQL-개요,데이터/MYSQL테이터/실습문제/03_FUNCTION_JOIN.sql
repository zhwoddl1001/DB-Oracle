-- 함수 이용한 select 작성

-- 'mySQL' '' 'is' 'Awesome!'
-- > 붙여서 출력
select concat('MySQL',' ','is','Awesome!'); 

-- hello.world.program에서 hello.world 까지만 출력
select substring_index('hello.world.program','.program',1);

-- 전화번호에 5678이 들어가는 USER 수 확인
select count(*)
from user
where phone like '%5678%';

-- PRODUCT
use khtshopping;
-- concat 이용해서 제품명 : 울트라 게이밍 키보드, 가격 89000원 으로 출력
select concat('제품명 : ',name, ',가격',price,'원')
from product
where product_id = 3;

/*update product set name = concat('제품명 : ');

update product set price = concat('가격 : ',price);*/

update product set name ='울트라 게이밍 키보드' where product_id = 3;
/*
('한국산 유기농 쌀', '100% 유기농 인증 받은 고품질 쌀', 20000, 50, '식품'),
('한정판 고급 텀블러', '스타일리시한 디자인과 실용성 겸비', 15000, 100, '주방용품'),
('울트라 게이밍 키보드', 'RGB 백라이트와 뛰어난 키감', 89000, 30, '전자제품'),
('천연 허브차 세트', '피로 회복에 좋은 허브차 5종', 25000, 200, '음료'),
('편안한 쿠션 의자', '장시간 사용해도 편안한 인체공학적 디자인', 120000, 15, '가구');
*/

select * from product;

-- REVIEW 테이블에서 제품아이디 3번의 댓글 길이 
select length(comment) 
from review
where product_id = 3; -- >총 길이 66 왜냐하면 한글은 한 글자 당 크기가 = 3 영어 숫자 이외 모든 한 글자 크기 = 3
					  -- > 한글 20자 띄어쓰기 5개 마침표 1개 = 66자

select char_length(comment) 
from review
where product_id = 3; -- > byte 크기가 아니라 한 글자씩 총 문자열의 길이 출력

select * from review;
-- REview 제품아이디 4번에 작성된 댓글에서 좋고 -> 훌륭하고 바꿔서 출력
select replace(comment,'좋고','훌륭하고')
from review
where product_id = 4;

-- replace 사용 방식 JS,JAVA,SQL 등 거의 모든 언어 동일

SELECT * FROM `ORDER`;
select * FROM ORDER_ITEM;
select * from product;
select * from review;

-- order 테이블 order_item 테이블 join
select O.ORDER_ID,O.USER_ID, O.STATUS,O.TOTAL_AMOUNT, OI.PRODUCT_ID,OI.QUANTITY,OI.PRICE
from `order` O
join order_item OI
on O.ORDER_ID = OI.ORDER_ID;
-- 조건이 맞는 행만 가져옴

select O.ORDER_ID,O.USER_ID, O.STATUS,O.TOTAL_AMOUNT, OI.PRODUCT_ID,OI.QUANTITY,OI.PRICE,P.NAME
from `order` O
join order_item OI
on O.ORDER_ID = OI.ORDER_ID
JOIN PRODUCT P 
ON P.PRODUCT_ID = OI.PRODUCT_ID;

-- PRODUCT 테이블과 REVIEW 테이블 INNER JOIN
SELECT P.PRODUCT_ID, P.NAME, R.USER_ID,R.RATING,R.COMMENT
FROM PRODUCT P
INNER JOIN REVIEW R
ON P.PRODUCT_ID = R.PRODUCT_ID;

-- LEFT JOIN 사용 ORDER REVIEW 테이블 연결해서 모든 주문이 포함되도록 하되,
-- REVIEW가 없는 주문은 NULL로 표기되게 처리

select O.ORDER_ID,O.USER_ID,O.STATUS,R.PRODUCT_ID,R.RATING,R.COMMENT
FROM `ORDER` O
LEFT JOIN REVIEW R
ON O.USER_ID = R.USER_ID; -- 모든 제품에 리뷰가 존재하기 때문에 NULL 값이 생성일 없음

-- REVIEW 테이블과 ORDER 테이블을 RIGHT JOUN 으로 연결해서 모든 리뷰가 포함되도록 하고alter
-- 주문 정보가 없는 경우는 NULL 표기되게 하기

SELECT R.PRODUCT_ID,R.USER_ID,R.RATING,R.COMMENT,O.ORDER_ID,O.STATUS
FROM REVIEW R
RIGHT JOIN `ORDER` O
ON R.USER_ID = O.USER_ID; 

USE KHTCAFE;

CREATE TABLE SNACK (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(100),
    CATEGORY VARCHAR(50),
    PRICE DECIMAL(10, 2),
    STOCK INT
);

INSERT INTO SNACK (ID, NAME, CATEGORY, PRICE, STOCK) VALUES
(1, '초코칩 쿠키', '과자', 1500.00, 50),
(2, '양파링', '스낵', 2000.00, 30),
(3, '포테이토칩', '스낵', 2500.00, NULL),
(4, '치즈볼', '과자', 1800.00, 40),
(5, NULL, '스낵', 3000.00, 20);

CREATE TABLE SNACK_ORDER (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    SNACK_ID INT,
    QUANTITY INT,
    ORDER_DATE DATETIME,
    STATUS VARCHAR(20)
);

INSERT INTO SNACK_ORDER (ID, SNACK_ID, QUANTITY, ORDER_DATE, STATUS) VALUES
(1, 1, 3, '2024-12-16 10:35:00', '배송 중'),
(2, 2, 2, '2024-12-16 11:00:00', '대기'),
(3, NULL, 1, '2024-12-16 12:00:00', '취소'),
(4, 3, NULL, '2024-12-16 13:00:00', '배송 완료'),
(5, 5, 5, '2024-12-16 14:00:00', NULL);

select * FROM SNACK;

select * FROM SNACK_ORDER;

-- INNER JOIN 
select s.id,s.name,s.category,s.price,s.stock,
o.quantity,o.order_date,o.status
FROM snack s
inner join snack_order o
on s.id = o.snack_id; -- id와 snack_id값이 일치하는 데이터만 가져오기

-- left join
select s.id,s.name,s.category,s.price,s.stock,
		o.quantity,o.order_date,o.status
FROM snack s
left join snack_order o
on s.id = o.snack_id; -- 4번 아이디 조회 x
-- snack_order 에 일치하는 주문이 없으면 null 표기

-- right join 스낵 오더 테이블의 모든 데이터를 가져오고 왼쪽 테이블의 일치하는 데이터를 가져옴
select s.id,s.name,s.category,s.price,s.stock,
		o.quantity,o.order_date,o.status
FROM snack s
right join snack_order o
on s.id = o.snack_id; -- 4번 아이디 조회 x
-- snack_order 에 일치하는 주문이 없으면 null 표기