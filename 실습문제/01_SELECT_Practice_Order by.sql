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