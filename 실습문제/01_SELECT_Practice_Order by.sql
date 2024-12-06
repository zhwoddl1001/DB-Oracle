SELECT  * FROM EMPLOYEE ;

SELECT emp_name, SALARY * 12 AS 연봉 
FROM EMPLOYEE
ORDER BY 연봉 ASC;

SELECT emp_name
FROM EMPLOYEE
ORDER BY emp_name DESC;


-- EMPLOYEE 테이블에서 사원들의 급여를 오름차순으로 정렬
SELECT emp_id,emp_name,salary
FROM EMPLOYEE
ORDER BY salary;

--EMPLOYEE 테이블에서 사원들의 입사일 내림차순 정렬
SELECT emp_id,emp_name,hire_date
FROM EMPLOYEE
ORDER BY hire_date DESC;

-- DEPARTMENT 테이블의 부서명을 오름차순 출력
SELECT DEPT_ID,DEPT_TITLE
FROM DEPARTMENT 
ORDER BY DEPT_TITLE ASC;

--EMPLOYEE 테이블에서 부서코드가 없는 사원들의 이름을 내림차순 출력
SELECT EMP_ID,EMP_NAME,DEPT_CODE
FROM EMPLOYEE 
WHERE DEPT_CODE IS NULL
ORDER BY EMP_NAME DESC;

-- EMPLOYEE 테이블에서 급여가 300000원 이상인 상원의 급여 등급 (salary_level) 내림차순 정렬
SELECT emp_id,emp_name,sal_level
FROM EMPLOYEE e
WHERE salary>=3000000
ORDER BY sal_level DESC;

--EMPLOYEE 테이블에서 오름차순 + NULLS FIREST (NULL 값을 제일 위에 배치)
SELECT emp_name,phone
FROM EMPLOYEE 
ORDER BY phone NULLS FIRST;

--EMPOLOYEE 테이블에서 오름차순 + NULLS LAST (NULL 값을 제일 아래에 배치)
SELECT emp_name,phone
FROM EMPLOYEE 
ORDER BY phone /*ASC NULLS LAST*/;

--EMPOLOYEE 테이블에서 내림차순 + nulls 가장 위로 배치
SELECT emp_name,phone
FROM EMPLOYEE 
ORDER BY phone DESC NULLS FIRST;
SELECT AVG(SALARY)
FROM EMPLOYEE; 

-- EMPLOYEE 테이블 전체 행의 개수
SELECT COUNT(*) FROM EMPLOYEE;

---- 테이블 : EMPLOYEE
--1 평균 급여 조회(소수점 내림 처리)
SELECT FLOOR(AVG(SALARY)) 
FROM EMPLOYEE;
--2 부서 코드가 'D5'인 사원의 수 
SELECT COUNT(*) AS 사원수
FROM EMPLOYEE 
WHERE DEPT_CODE = 'D5';
-- 전화번호가 있는 사원의 수
-- COUNT(*) = 모든 사람 수 세기,count(PHONE) = phone 컬럼에서 전화번호가 null 값이 아닌 사람만 존재
SELECT COUNT(*),count(PHONE)
FROM EMPLOYEE 

--3 전화번호가 있는 사원의 수 
--> NULL이 아닌 행의 수만 카운트
SELECT COUNT(*)
FROM EMPLOYEE 
WHERE PHONE IS NOT NULL;

--4 존재하는 부서코드의 수를 조회
SELECT COUNT(DISTINCT DEPT_CODE)
FROM EMPLOYEE; 
--5 부서명이 '영업'으로 끝나는 부서 조회
SELECT *
FROM DEPARTMENT
WHERE DEPT_TITLE LIKE '%영업';

SELECT * FROM DEPARTMENT ORDER BY DEPT_TITLE;
--6 이름이 대문자로 표시된 직원 조회 
-- ㅏㅎㄴ글이기 때문에 대소문자 구분없이 출력
SELECT *
FROM EMPLOYEE 
WHERE EMP_NAME = UPPER(EMP_NAME);
--7 이름이 '송'으로 시작하는 직원 조회
SELECT *
FROM EMPLOYEE 
WHERE EMP_NAME
LIKE '송%';
--8 급여가 200만 원 이하인 직원의 이름과 급여 조회
SELECT EMP_NAME,SALARY
FROM EMPLOYEE 
WHERE SALARY <= 2000000;
--9 'Y'로 퇴사 여부가 표시된 직원의 평균 급여 조회
-- 대소문자 구분없이 검색하는 법 ENT_YN = UPPER('y') 이렇게 하면 대문자만 출력
SELECT AVG(SALARY) AS 평균급여
FROM EMPLOYEE 
WHERE ENT_YN IN('Y');
--10. '영업'으로 끝나는 부서에 속한 직원 수 조회
SELECT COUNT(*)AS 영업_글자가_포함된_부서
FROM DEPARTMENT  
WHERE  DEPT_TITLE
LIKE '%영업';
--11 각 부서별 직원 수 조회
SELECT DEPT_CODE, AVG(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

--12 급여등급이 'S5' 이상인 직원 이름과 급여 조회
SELECT EMP_NAME,SALARY
FROM EMPLOYEE 
WHERE SAL_LEVEL>='S5';
--13전화번호가 '010'으로 시작하지 않는 직원 조회
SELECT COUNT(*)
FROM EMPLOYEE 
WHERE PHONE
NOT LIKE '010%';
--14각 부서별 평균 급여 조회
SELECT AVG(SALARY)
FROM EMPLOYEE 
WHERE ;

--15'N'으로 표시된 퇴사 여부 직원 수 조회
SELECT COUNT(*)
FROM EMPLOYEE 
WHERE ENT_YN = 'N';
--16급여가 300만 원 이상인 직원 이름과 급여 조회
SELECT EMP_NAME,SALARY
FROM EMPLOYEE 
WHERE SALARY >=3000000;
---- 테이블: JOB

--17직급명이 소문자로 표시된 데이터 조회
SELECT LOWER(JOB_NAME)
FROM JOB;