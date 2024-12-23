-- EMPLOYEE 테이블에서 부서코드, 부서(그룹)별 급여 합계 조회
-- /*어떤 그룹을 묶어서 조회할 것인지 추가로 작성해줌*/
SELECT DEPT_CODE, SUM(SALARY), FLOOR(AVG(SALARY)) --그룹 별로 월급합계 /평균 월급 조회
FROM EMPLOYEE -- EMPLOYEE 테이블에서
GROUP BY DEPT_CODE; -- DEPT_CODE 컬럼이 값이 같은 행들끼리 묶어서 

--
SELECT DEPT_CODE,SUM(SALARY),FLOOR(AVG(SALARY)),COUNT(*) AS 사원수
FROM EMPLOYEE
GROUP BY DEPT_CODE;

SELECT DEPT_CODE,COUNT(BONUS)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

SELECT DEPT_CODE,COUNT(*)
FROM EMPLOYEE
WHERE BONUS IS NOT NULL
GROUP BY DEPT_CODE;

--– 1. EMPLOYEE 테이블에서 부서코드가 'D5', 'D6'인 부서의 평균 급여 조회
-- UPPER 함수는 문자열 하나를 변환하기 위해 사용, 다중 값 사용 불가
 SELECT DEPT_CODE,FLOOR(AVG(SALARY)) AS 평균급여
 FROM EMPLOYEE
 WHERE UPPER(DEPT_CODE) IN('D5','D6')
 GROUP BY DEPT_CODE;
--– 2. EMPLOYEE 테이블에서 직급 별 2000년도 이후 입사자들의 급여 합을 조회
------ WHERE EXTRACT(YEAR FROM HIRE_DATE) >= 2000
 SELECT JOB_CODE,SUM(SALARY)
 FROM EMPLOYEE
 WHERE EXTRACT(YEAR FROM HIRE_DATE) >= 2000 -- EXTRACT(YEAR FROM HIRE_DATE) 특정 날짜 열에서 년도만 가져오기
 GROUP BY JOB_CODE;

--– 3. EMPLOYEE 테이블에서 부서 별로 같은 직급인 사원의 급여 합계를 조회하고
---- 부서 코드 오름차순으로 정렬
---- SUM이나 AVG 같이 특정 함수로 계산한 결과를 나타낼 때 조회하고자 하는 컬럼명을 작성해줄경우
---- GROUP BY 절에 SUM,AVG 같이 계산함수가 적용되지 않은 컬럼명을 모두 작성해줘야 함 
 SELECT DEPT_CODE,JOB_CODE,SUM(SALARY)
 FROM EMPLOYEE
 GROUP BY DEPT_CODE,JOB_CODE
 ORDER BY DEPT_CODE;
--– 4. EMPLOYEE 테이블에서 부서 별로 급여 등급이 같은 직원의 수를 조회하고
---- 부서코드, 급여 등급 오름차순으로 정렬
SELECT DEPT_CODE,SAL_LEVEL,COUNT(SAL_LEVEL) AS 급여등급
FROM EMPLOYEE
GROUP BY DEPT_CODE,SAL_LEVEL
-- 첫 번째로 부서코드 ABCD 순으로 정렬, 부서 안에 존재하는급여레벨 ABCD 순으로 정렬
ORDER BY DEPT_CODE,SAL_LEVEL;

--EMPLOYEE 테이블과 DEPARTMENT 테이블에서 부서코드 조회하기
SELECT *FROM EMPLOYEE; -- EMP_ID,EMP_NAME,DEPT_CODE
SELECT * FROM DEPARTMENT; -- DEPT_ID,DEPT_TITLE,

SELECT EMPLOYEE.EMP_ID,EMPLOYEE.EMP_NAME,EMPLOYEE.DEPT_CODE,DEPARTMENT.DEPT_TITLE
FROM EMPLOYEE,DEPARTMENT --테이블 조회를 2개이상 가능
WHERE EMPLOYEE.DEPT_CODE = DEPARTMENT.DEPT_ID; -- oracle에서는 되지 않음

SELECT EMPLOYEE.emp_id,EMPLOYEE.emp_name,EMPLOYEE.JOB_CODE,job.JOB_name
FROM EMPLOYEE,JOB;

SELECT d.dept_id,d.dept_title,d.location_id,l.LOCAL_NAME
from department d,LOCATION l;

--DEPARTMENT 테이블과 LOCATION 테이블 NATIONAL 테이블을 이용해서 
--dept_id,dept_title,location_id,NATIONAL_CODE NATIONAL_NAME

SELECT d.DEPT_ID,d.DEPT_TITLE,d.LOCATION_ID,l.NATIONAL_CODE,n.NATIONAL_NAME
FROM DEPARTMENT d, LOCATION l, NATIONAL n
WHERE d.LOCATION_ID =l.LOCAL_CODE 
-- 서로 같다는 표기를 2개이상의 테이블에서 진행해야할 때는 where절을 필수로 사용!
-- DEPARTMENT 테이블에서 LOCATION_ID와 LOCATION 테이블 에서 LOCAL_CODE 와 일치하고
-- LOCATION 테이블에서 NATIONAL_CODE와 NATIONAL 테이블에서 NATIONAL_CODE 일치
AND l.NATIONAL_CODE =n.NATIONAL_CODE;

-- 1.
SELECT DEPT_CODE,FLOOR(AVG(SALARY)) AS 평균급여
FROM EMPLOYEE
GROUP BY DEPT_CODE;

--2 EMPLOYEE 테이블에서 각 직급마다 급여가 가장 높은 사원의 이름과 급여 출력
SELECT EMP_NAME,JOB_CODE,MAX(SALARY) AS "가장 높은 급여"
FROM EMPLOYEE
GROUP BY EMP_NAME,JOB_CODE
ORDER BY JOB_CODE,MAX(SALARY)DESC;

--------------------------------------- 변형문제
SELECT EMP_NAME,JOB_CODE,SALARY 
FROM EMPLOYEE
WHERE (JOB_CODE,SALARY) IN(
SELECT JOB_CODE,MAX(SALARY) AS "가장 높은 급여"
FROM EMPLOYEE
GROUP BY JOB_CODE
)ORDER BY JOB_CODE;
---------------------------------------------------
--3
SELECT DEPT_CODE,FLOOR(AVG(SALARY)) AS 평균급여
FROM EMPLOYEE
GROUP BY DEPT_CODE;

--4 부서이름이 인사관리부 인 직원의 이름 출력
SELECT EMP_NAME
FROM EMPLOYEE E,DEPARTMENT D
WHERE D.DEPT_ID = E.DEPT_CODE
AND D.DEPT_TITLE = '인사관리부';

-- 1. 이메일 주소가 등록된 직원의 이름과 부서명을 출력하시오.
-- WHERE E.DEPT_CODE = D.DEPT_ID 생략 가능
SELECT E.EMP_NAME,D.DEPT_TITLE
FROM EMPLOYEE E,DEPARTMENT D
WHERE E.DEPT_CODE = D.DEPT_ID
AND EMAIL IS NOT NULL;

-- 2. 각 부서의 최고 급여를 출력하시오.
SELECT EMP_NAME,DEPT_CODE,MAX(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE,EMP_NAME
ORDER BY DEPT_CODE, MAX(SALARY)DESC;

-- 2-1. 각 부서의 최고 급여를 출력하시오. (부서별 최고 급여만 받는 사람 출력)
-- 서브 쿼리가 추가
SELECT EMP_NAME,DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE (DEPT_CODE,SALARY) IN(
SELECT DEPT_CODE,MAX(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
)
ORDER BY DEPT_CODE DESC;

-- 3. 각 급여 등급별 직원 수를 출력하시오.
SELECT SAL_LEVEL,COUNT(SAL_LEVEL) AS "직원 수"
FROM EMPLOYEE
GROUP BY SAL_LEVEL;

-- 4. 부서 이름과 평균 급여를 급여가 높은 순으로 정렬 출력하시오.
SELECT D.DEPT_TITLE,FLOOR(AVG(E.SALARY)) AS 평균급여
FROM EMPLOYEE E,DEPARTMENT D
GROUP BY D.DEPT_TITLE
ORDER BY AVG(SALARY) DESC;

-- 5. 지역별 부서 수를 출력하시오.
----- COUNT(DISTINCT 컬럼명) : 특정 컬럼에서 중복 값을 제외한 행의 개수 반환
SELECT LOCATION_ID,COUNT(DISTINCT DEPT_ID) AS 부서수
FROM  DEPARTMENT D
GROUP BY LOCATION_ID;
-- 6. 각 부서(DEPT_CODE)별 보너스 비율(BONUS)의 평균을 구하되, 평균 보너스 비율이 높은 순으로 정렬
-- 부서의 평균 급여와 평균 보너스 비율을 계산한 뒤 보너스 평균값 기준으로 내림차순으로 정렬하는 작업
SELECT DEPT_CODE,FLOOR(AVG(SALARY)) AS 평균급여,AVG(BONUS) AS 평균보너스비율
FROM EMPLOYEE , DEPARTMENT 
GROUP BY DEPT_CODE
ORDER BY AVG(BONUS) DESC;
-- 7.각 부서(DEPT_CODE)별 평균 급여(SALARY)와 평균 보너스 비율(BONUS)을 조회하되, 부서명(DEPT_TITLE)을 기준으로 오름차순 정렬
SELECT DEPT_TITLE,FLOOR(AVG(SALARY)) AS 평균급여, AVG(BONUS) AS 평균보너스비율
FROM EMPLOYEE E,DEPARTMENT D
--WHERE E.DEPT_CODE = D.DEPT_ID
GROUP BY DEPT_TITLE
ORDER BY DEPT_TITLE;
-- 8. 각 부서별 퇴사자 수를 조회하고, 퇴사자 수가 많은 순으로 정렬
SELECT DEPT_CODE,COUNT(*) AS 퇴사자
FROM EMPLOYEE
WHERE ENT_YN = UPPER('Y')
GROUP BY DEPT_CODE
ORDER BY 퇴사자 DESC;
---------------------------------------------------------------------------------




