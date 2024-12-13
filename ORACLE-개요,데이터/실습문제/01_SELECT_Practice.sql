

SELECT * FROM department; -- department 라는 테이블에 있는 모든 내용 조회하기

-- LOCATION 테이블 모두 조회하기
SELECT * FROM LOCATION;
-- JOB 테이블 모두 조회하기
SELECT * FROM JOB;
-- NATIONAL 테이블 모두 조회하기
SELECT * FROM NATIONAL;
-- SAL_GRADE 테이블 모두 조회하기
SELECT * FROM sal_grade;



-- EMPLOYEE 테이블에서 사번(EMP_ID) 이름(EMP_NAME)급여(SALARY)조회
SELECT emp_id, emp_name, salary from employee;

--EMPLOYEE 테이블에서이름(EMP_NAME)만 조회
SELECT emp_name FROM employee;

--Employee 테이블에서 emp_name hire_date 조회
SELECT emp_name,hire_date FROM employee;

--DEPARTMENT 테이블에서 부서코드 부서명 조회(DEPT_ID, DEPT_TITLE)
SELECT dept_id,dept_title FROM department;

--department 테이블에서 모든 데이터 조회
SELECT * FROM department;

/*컬럼 값 산술 연산*/
-- 컬럼 값 : 행과 열이 교차되는 테이블의 한 칸에 작성된 값
-- select 문 작성 시 컬럼명에 산술 연산을 직접 작성하면 조회결과에 연산결과가 반영되어 조회된다.

-- EMPLOYEE 테이블에서 모든 사원의 이름,급여, 급여 * 12 해서 연봉 조회

SELECT EMP_ID,EMP_NAME,SALARY * 12 FROM employee;

SELECT EMP_ID,EMP_NAME,SALARY, salary * 12 FROM employee;

--SALARY * 12에 별칭을 붙여서 연봉이라 표기하기
-- 별명을 붙여 컬럼명이 조회되길 원한다면 AS 별명을 작성해주면 된다.

SELECT EMP_ID,EMP_NAME,SALARY, salary * 12 AS 연봉 FROM employee;

--employee 테이블에서 EMP_ID 직원아이디,EMP_NAME 직원이름,SALARY 월급 으로 표기해서 출력

SELECT EMP_ID AS 직원아이디 ,EMP_NAME AS 직원이름,SALARY As 월급, salary * 12 AS 연봉 FROM employee;

SELECT SYSDATE FROM DUAL; -- 24/12/04

SELECT SYSTIMESTAMP FROM DUAL; -- 24/12/04 14:31:16.481000000 +09:00



--가짜 테이블 이용해서 [] as어제. [] as현재,[] as내일, []as모레조회
SELECT SYSDATE -1 AS 어제, SYSDATE AS 현재, SYSDATE +1  AS 내일,SYSDATE+2 AS 내일모레 FROM DUAL;



SELECT '2024-12-04', TO_DATE('2024-12-04','YYYY-MM-DD') FROM DUAL;

-- EMPLOYEE 에서 모든 사원의 이름,입사일,근무 일수 (SYSDATE - 입사일) 조회
SELECT EMP_NAME,HIRE_DATE,SYSDATE - HIRE_DATE FROM EMPLOYEE;


-- 퇴사 여부가 Y 인 사원의 이름과 퇴사일 조회
SELECT emp_name,ent_date -- 무엇을 조회할 것인가
FROM employee            -- 어디서 조회할 것인가
WHERE ent_yn ='Y';       -- 어떤 조건을 걸 것인가

-- 보너스가 있는 사원의 이름과 보너스 금액 조회
SELECT emp_name,BONUS
FROM employee
WHERE BONUS IS NOT NULL;

-- 급여가 300만원 이상인 사원의 이름과 급여를 조회
-- 급여 >= 3000000
SELECT emp_name,salary
FROM employee
WHERE salary >= 3000000;
-- DEPARTMENT 테이블에서 LOCATIN_ID 가 'L1' 지역에 위치한 부서의 모든 정보 조히
SELECT *
FROM DEPARTMENT
WHERE LOCATION_ID = 'L1';
-- EMPLOYEE 테이블에서 이메일 주소가 없는 사원의 이름 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE EMAIL IS NULL;
--> 이메일 주소가 모두 존재하기 때문에 아무것도 아난오는 것이 맞음
-- EMPLOYEE 테이블에서 관리자가 없는 사원의 정보 조회
SELECT *
FROM EMPLOYEE
WHERE manager_id IS NULL;

--EMPLOYEE 테이블에서 모든 사원의 이름,입사일,근무일수(현재 시간 - 입사일) 조회
SELECT EMP_NAME,HIRE_DATE,SYSDATE-HIRE_DATE
FROM EMPLOYEE;

--포멧팅을 활용해서 보기좋게 정리
-- FLOOR(소수점 아래 모두 버리기) 이용해서 정리
-- CELL (올림 처리)  
-- ROUND (반올림 처리)

SELECT EMP_NAME,HIRE_DATE,FLOOR(SYSDATE-HIRE_DATE)AS 근무일수
FROM EMPLOYEE;
-- FLOOR(SYSDATE-HIRE_DATE)입사일부터 현재까지의 차이를 계산하고 소수점 아래는 모두 버려 정수로 나타냄
-- 소수점 아래를 버림하는 이유는 반올림을 할 경우 입사일이 하루 추가되므로 현재 입사해서 근무한 일자에 어긋남


-- EMPLOYEE 테이블에서 부서 코드가 D9 부서가 아닌 사원들만 컬럼을 모두 조회
SELECT *
FROM employee
WHERE DEPT_CODE != 'D9';

--EMPLOYEE 테이블에서 연봉이 5000만원 이하인 사원의 사번,이름 연봉 조회
SELECT EMP_ID,EMP_NAME,SALARY * 12 AS 연봉
FROM employee
WHERE SALARY*12 <= 50000000;

-- -EMPLOYEE 테이블에서 부서코드가 D6이 아닌 사원의 이름 부서 코드 전화번호 조회
SELECT EMP_NAME,DEPT_CODE,PHONE
FROM employee
WHERE DEPT_CODE != 'D6';

-- EMPLOYEE 테이블에서 부서코드가 D1,D3이 아닌 사원의 이름 부서코드 조회
SELECT EMP_NAME,DEPT_CODE
FROM employee
WHERE DEPT_CODE != 'D3'
AND    dept_code != 'D1';

/*
WHERE 절에서 특정값에 기준을 설정할 때 특정 값의 범위나 조건을 설정해 줄 수 있음

AND = 여러 조건을 동시에 만족하는 경우로 AND로 작성한 조건이 모두 TRUE
OR = 하나의 조건만 TRUE 이어도 해당 행이 선택

IN()= 조건에 여러값을 지정할 때 사용 값의 목록 중 하나와 일치하는 행을 선택 
      OR의 간결한 표현 방법  
NOT IN() = IN과 반대로, 조건에서 지정한 목록에 포함되지 않는 값만 선택
           값의 목록과 일치하지 않는 행만 선택
*/

-- EMPLOYEE 테이블에서 부서코드가 D1 D3 가 아닌 사원 조회
SELECT EMP_NAME,DEPT_CODE
FROM employee
WHERE DEPT_CODE NOT IN('D1','D3');

--D5 부서에 속한 사원의 사원번호 사원이름 부서코드 조회
SELECT EMP_ID,EMP_NAME,DEPT_CODE
FROM employee
WHERE DEPT_CODE IN('D5');

-- 입사일이 (hire_date)2000년 이후인 직원들의 정보 조회 employee
SELECT *
FROM employee
WHERE HIRE_DATE >= TO_DATE('2000-01-01','YYYY-MM-DD');

--퇴직여부가 Y 이고, 퇴사일이 2015년 이후인 직원들의 정보를 조회
SELECT *
FROM employee
WHERE ENT_YN ='Y'
AND ENT_DATE >= TO_DATE('2015-01-01','YYYY-MM-DD');

--EMPLOYEE 테이블에서 성씨가 '전'씨인 사원의 이름 조회
SELECT EMP_NAME
FROM employee
WHERE EMP_NAME
LIKE '전%';


-- EMPLOYEE 테이블에서 이름이 수로 끝나는 사원의 이름 조회
SELECT EMP_NAME
FROM employee
WHERE EMP_NAME
LIKE '%수';
--1
SELECT * FROM EMPLOYEE;

--2
SELECT DEPT_TITLE,LOCATION_ID FROM department;

--3
SELECT EMP_NAME,SALARY
FROM employee
WHERE salary >= 3000000;

--4
SELECT *
FROM department
WHERE LOCATION_ID = 'L1';

--5
SELECT *
FROM EMPLOYEE
WHERE BONUS IS NULL;

--6
SELECT EMP_NAME
FROM employee
WHERE salary >= 2500000
and bonus in('0.2');

--7
SELECT *
FROM employee
WHERE JOB_CODE IN('J6')
OR    JOB_CODE IN('J7');

--8
SELECT *
FROM department
WHERE dept_title 
LIKE '%영업%';

--9
SELECT *
FROM employee
WHERE hire_date >= TO_DATE('2000-01-01','YYYY-MM-DD');

--10
SELECT *
FROM employee
WHERE ent_yn IN('Y')
AND ent_date >= TO_DATE('2015-01-01','YYYY-MM-DD');

--11
SELECT *
FROM employee
WHERE emp_name
LIKE '김%';

--12
SELECT *
FROM employee
WHERE job_code IN('J1','J2','J3');

--13
SELECT *
FROM employee
WHERE dept_code NOT IN('D1','D5','D9');

--14
SELECT *
FROM employee
WHERE EMP_NAME
LIKE '%김%';

--15
SELECT *
FROM employee
WHERE EMAIL
LIKE '%gmail%';

--16
SELECT *
FROM employee
WHERE phone
LIKE '010%';

--17
SELECT *
FROM employee
WHERE phone
LIKE '%1234';

--18
SELECT *
FROM department
WHERE dept_title
LIKE '%영업';

--19
SELECT *
FROM department
WHERE dept_title
LIKE '%관리%';

--20
SELECT *
FROM employee
WHERE emp_name
LIKE '이%';

--21
SELECT *
FROM employee
WHERE job_code
LIKE 'J1%';

--22
SELECT *
FROM employee
WHERE EMAIL
LIKE '%com';

--23
SELECT *
FROM employee
WHERE hire_date = TO_DATE('2021-01-01','YYYY-MM-DD');

--24
SELECT *
FROM employee
WHERE emp_name
LIKE '%호';

--25
SELECT *
FROM employee
WHERE EMAIL
LIKE '%company%';

--26
SELECT *
FROM employee
WHERE emp_name
LIKE '수%'
OR emp_name LIKE '%수';


