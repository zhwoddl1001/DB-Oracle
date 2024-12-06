/*
n = number
p = 정수 개수
s = 소수점 이하 최대 몇자리까지 올 수 있는지 자릿수 지정

대표저ㅓㄱ으로 VARCHAR2 ,NUMBER TIMESTAMP 주로 사용함

1. 문자열 타입(Character Data Types)
    CHAR(n)         : 고정 길이 문자열 한글자씩 최대 몇글자 작성할 것인지 설정 / 작성을 안했을 경우 1byte로 컬럼 하나에 [숫자나 영어] 한글자만 가능
   
    VARCHAR(n)      : Oracle 에서는 사용 불가 표준 SLL에서는 사용 가능

    VARCHAR2(n)     : VARCHAR 보다 더 큰 공간을 사용할 수 있음
                     필수로 갈아룰 자종햐여험 (평균 255byte로 많이 작성함)
                     Oracle 이외 어디든 사용 가능   
                     가변 길이 문자열을 저장할 때 사용하는 데이터 타입
                     가변 길이 * 변할 가능성이 있는 타입
   
    CLOB(n)         : 메일이나 대량의 글자를 담을 때 사용하는 타입
2. 숫자 데이터 타입(Numeric Data Types)
NUMBER(p,s) : 숫자나 실수를 담는 타입
              p나 s를 작성하지 않으면 타입은 기본적으로 Number(38,0)
              Number(38,0) => 최대 38자리의 정수와 소수점 밑 실수 하나라도 작성 xxx

3. 날짜 및 시간 데이터 타입(Date And Time Data Types)
DATE                : 날짜 시간 시 분 초 기본크기 7byte 기본크기 7byte
TIMESTAMP           : 날짜 시간 시 분 초 (나노초던위까지 가능) 기본크기 7bute

4. 이진 데이터 타입(Binary Data Type)
BLOB            :크기 제한이 없음
                 이미지,동영상 이외 여러 데이터 파일 저장할 수 있음
                 최대 4GB까지 저장 가능
                 유지비용이 많이 들기 때문에 현재는 사용 X

5.논리형 데이터 타입(Oracle 에서만 사용 가능)
BOOLEAN         : TRUE,FALSE, NULL 사용 가능 1byte
*/