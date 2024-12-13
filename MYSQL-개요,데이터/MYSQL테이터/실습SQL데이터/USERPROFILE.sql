-- USERPROFILE 테이블 생성
/*
-- USER_ID 기본키 자동증가
-- USERNAME 문자열 빈 값 못들어가게 설정 (최대  50BYTE)
-- EMAIL 문자열 빈값 못 들어가게 설정 (최대 100BYTE)
-- BIRTHDATE DATE
-- ACCOUNT_BALUNCE DECIMAL(10,2) 정수 10글자, 소수점 2자리까지만 설정
-- GENDER ENUM('MAIL', 'FEMALE')
-- HOBBIES SET('READING','SPORTS','RUNNIG')

CREATE TABLE USERPROFILE (
USER_ID INT PRIMARY KEY auto_increment,     -- 기본키,자동으로 가입할때 순차적으로 번호 증가 기입
USERNAME VARCHAR(50) NOT NULL,				-- 이름 (빈 칸 허용 불가)
EMAIL VARCHAR(100) NOT NULL,				-- 이메일 (빈 칸 허용 불가)
BIRTHDATE DATE,								-- 생년월일(날짜)
ACCOUNT_BALUNCE DECIMAL(10,2),				-- 계좌 잔액(정수 10글자, 소수점 2자리)
GENDER ENUM('MAIL','FEMALE'),				-- 성별 (남,녀 중 택 1)
HOBBIES SET('READING','SPORTS','RUNNIG'));	-- 취미 (설정된 값 중 다중 선택 가능)
*/
INSERT INTO USERPROFILE (USERNAME, EMAIL, BIRTHDATE, ACCOUNT_BALANCE, GENDER, HOBBIES)
VALUES
    ('홍길동', 'hong1@example.com', '1990-01-01', 10000.50, 'MALE', 'READING'),
    ('김영희', 'kim1@example.com', '1995-02-15', 5000.00, 'FEMALE', 'SPORTS'),
    ('이철수', 'lee1@example.com', '1987-03-10', 2000.75, 'MALE', 'RUNNING'),
    ('박민수', 'park1@example.com', '1993-05-20', 7000.25, 'MALE', 'READING,SPORTS'),
    ('최수영', 'choi1@example.com', '1998-07-30', 8000.00, 'FEMALE', 'RUNNING'),
    ('정하나', 'jung1@example.com', '1990-09-10', 3000.40, 'FEMALE', 'READING'),
    ('한상민', 'han1@example.com', '1985-04-25', 6000.30, 'MALE', 'SPORTS,RUNNING'),
    ('안세정', 'oh1@example.com', '1992-12-12', 9000.00, 'MALE', 'READING'),
    ('윤미래', 'yoon1@example.com', '1988-08-08', 4000.00, 'FEMALE', 'SPORTS'),
    ('장동건', 'jang1@example.com', '1991-11-11', 7500.50, 'MALE', 'RUNNING'),
    ('고은아', 'ko1@example.com', '1996-06-06', 3000.00, 'FEMALE', 'READING,SPORTS'),
    ('황보영', 'hwang1@example.com', '1994-03-03', 8500.75, 'FEMALE', 'RUNNING'),
    ('임채연', 'lim1@example.com', '1997-05-15', 2000.25, 'FEMALE', 'READING'),
    ('백승호', 'baek1@example.com', '1989-10-10', 6000.00, 'MALE', 'SPORTS'),
    ('송지효', 'song1@example.com', '1993-02-02', 9500.50, 'FEMALE', 'READING,RUNNING'),
    ('조세호', 'cho1@example.com', '1995-07-07', 1500.75, 'MALE', 'SPORTS'),
    ('이광수', 'lee2@example.com', '1991-09-09', 8000.00, 'MALE', 'RUNNING'),
    ('김나영', 'kim2@example.com', '1986-12-01', 7000.25, 'FEMALE', 'READING'),
    ('박지성', 'park2@example.com', '1988-01-01', 5000.75, 'MALE', 'SPORTS,RUNNING'),
    ('유재석', 'yoo1@example.com', '1987-05-05', 10000.00, 'MALE', 'READING,SPORTS');