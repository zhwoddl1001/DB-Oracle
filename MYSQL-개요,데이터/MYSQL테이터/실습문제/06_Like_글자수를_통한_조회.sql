use khtuser;

select * from user;

select * from order_item;

-- null data 생성

use khtshopping;

select * from snack;
select * from snack_order;



-- COALESCE
-- 컬럼에 NULL 값이 존재할 경우 NULL 을 0으로 대체해서 합계 계산

select STOCK FROM SNACK;

-- NULL -> 0으로 변경해서 합 계산

select coalesce(stock, 0) FROM SNACK;

-- coalesce 이용해서 stock 합 을 조회 sum
select sum(stock)
from snack
where coalesce(stock,0);

-- > NULL 값을 5로 대체해서 SNACK_ORDER QUANTITY SUM(합)
select sum(coalesce(QUANTITY,5))
FROM SNACK_ORDER;

-- SNACK 테이블에서 카테고리별 재고 합계
-- SELECT CATEGORY STOCK ---> NULL -> 0
select CATEGORY, sum(coalesce(STOCK,0))
FROM SNACK
GROUP BY CATEGORY;

-- SNACK_ORDER 테이블에서 상태별 주문량 합계
-- select STATUS QUANTITY --> NULL -> 0

select STATUS, SUM(coalesce(QUANTITY,0))
FROM SNACK_ORDER
GROUP BY STATUS;

-- VIEW 테이블을 이용해서 VIEW _STATUS_NULL 가상 테이블 명치을 사용해서
-- VIEW 테이블로 위에 작성한 SNACK_DRDER 테이블에서 상태별 주문량 합계를 저장

CREATE VIEW VIEW_STATUS_NULL AS
select STATUS, COALESCE(STATUS,'없음'),SUM(coalesce(QUANTITY,0))
FROM SNACK_ORDER
GROUP BY STATUS;

drop view VIEW_STATUS_NULL;

CREATE or replace VIEW VIEW_STATUS_NULL AS
select STATUS, COALESCE(STATUS,'없음'),SUM(coalesce(QUANTITY,0))
FROM SNACK_ORDER
GROUP BY STATUS;  -- or replace 로 수정 또는 위에 처럼 드랍

-- ORACLE COALESCE 대신 NVL NULL 값을 특정 값을 대체

-- error code 1050 Table view status null aleady exists

select * FROM VIEW_STATUS_NULL;

select * FROM PRODUCT;

-- 한으로 시작하는 상품명 찾아 조회하기
SELECT NAME
FROM PRODUCT
WHERE NAME LIKE '한%';

-- 한으로 끝나는 상품명 찾아 조회하기

SELECT NAME
FROM PRODUCT
WHERE NAME LIKE '%한';

-- 한이 중간에 존재하는 상품명 찾아 조회하기

SELECT NAME
FROM PRODUCT
WHERE NAME LIKE '%한%';

-- LIKE 글자수도 지정해서 조회 '_'
-- 끝말잇기 할 때 제한 : 두 글자 단어만 가능

-- 한으로 시작하고 한 글자 뒤에 2글자만 있는 문자열
select NAME
FROM PRODUCT
WHERE NAME LIKE '한________';
-- 한국산 유기농 쌀 글자 하나씩을 봄 _ 8개

select NAME
FROM PRODUCT
WHERE NAME LIKE '한_________';
-- 한정판 고급 텀블러 

USE KHTUSER;

SELECT * FROM USER;

-- @앞에 글자가 9글자인 USERNAME 조회
select USERNAME
FROM USER
WHERE EMAIL LIKE '_________@%';

















