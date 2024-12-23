/*
TCL(Transaction Control Language) : 트랜잭션 제어 언어

Transaction : 업무 ,처리

-- 데이터 변경 사항을 묶어 하나의 트랜잭션에 담아 처리함
   (데이터 변경 사항을 묶어 하나의 업무로 담아 처리함)

-- 트랜잭션(업무,처리)의 대상이 되는 데이터 변경 사항 : DML (INSERT, UPDATE, DELETE)


EX)
   INSERT 작업 완료! -------------------------------------> DB 저장 (X)
   INSERT 작업 완료! ---->트랜잭션에 추가 ----> COMMIT ----> DB 저장 (O)
   INSERT 10개 완료! ----> 1개 업무처리공간에 10개의 INSERT가 담겨있음 ----> ROLLBACK --> 모든 작업 없던 일로 처리

 1) COMMIT :    최종저장 완료! 
                메모리 버퍼(트랜잭션)에 임시 저장된 데이터 변경 사항을 DB에 반영

 2) ROLLBACK  : 최종저장 취소
                메모리 버퍼(트랜잭션)에 임시 저장된 데이터 변경사항을 삭제하고
                마지막 커밋 상태로 돌아감( == 작업내용 삭제)

 3) SAVEPOINT : 임시저장
                메모리 버퍼(트랜잭션)에 저장 지점을 설정해서 ROLLBACK 수행 시 전체 작업을 삭제하는 것이 아니라
                저장지점까지만 일부 ROLLBACK

            [SAVEPOINT 사용법]
            SAVEPOINT 임시저장이름1; 

            SAVEPOINT 임시저장이름2;

            ROLLBACK TO 임시저장이름1; --> 임시저장이름1 번 까지 수정 삭제 삽입한 데이터 삭제하고 복구

            임시저장이름을 작성할 때 큰 따옴표로 감싸줌
            SAVEPOINT "SP3";
            ROLLBACK TO "SP3";



*/

/*
트랜잭션
Atomicity(원자성) : 트랜잭션에 포함된 작업이 모두 성공하거나 실패해야함
                    중간에 일부만 실행 X
                    예 ) 은행 송금 시 계좌 A에서 돈이 빠져나갔는데 
                        계좌 B에 입금이 안되면 안되기 때문에 둘 중 하나만 실행할 수 없다

Consistency(일관성) : 트랜잭션이 실행되기 전과 후의 데이터 상태가 일관되어야 함
                     예) 은행 C 계좌 총액이 10만 원 이었다면,A,B 나 다른 거래들이 일어났을 때도 10만 원 이어야함
                             C 가 계좌 송금 출금 과 같은 행위를 하지 않는 한

Isolation(격리성)   : 여러 트랜잭션이 동시에 실행될 때, 서로의 작업에 영향을 주면 안됨
                     예) 두 사람이 동시에 같은 계좌에서 돈을 빼려면 충돌이 일어날 수 있으니
                        하나씩 순서대로 처리

Durability(지속성)  : 트랜잭션이 완료된 후의 결과는 영구적으로 저장
                     예) 시스템이 갑자기 다운되어도 성공적으로 완료된 거래 결과는 유지되어야함
                             은행에서 5만 원 송금 후 서비스 점검으로 1시간 후 계좌 확인을 했을 때
                             송금내역이 존재해야함

*/


-- USE KHTUSER 를 사용하지않고 KHTUSER 내에 있는 USER 테이블 조회

SELECT * FROM KHTUSER.USER;


-- user phone 앞에 작성된 kor) 제거
SET SQL_SAFE_UPDATES = 0; -- 안전모드 종료

START TRANSACTION;                                   -- savepoint를 사용하기 위해서는 START TRANSACTION 시작 수동 제어
SAVEPOINT SP1;                                       --  임시로 되돌릴 위치이름 SP1 설정
USE KHTUSER;                                         --  KHTUSER DB로 접속
update user SET PHONE = SUBSTRING_INDEX(PHONE,')',1);  -- 수정할 UPDATE 작성
SELECT * FROM USER;									         -- 제대로 수정했는지 확인

ROLLBACK TO SP1;		                                 -- 원하는대로 결과 수정 X sp1 임시저장한 위치로 되돌리기
update user SET PHONE = SUBSTRING_INDEX(PHONE,')',-1); -- 수정 
SELECT * FROM USER;	                                    -- 올바르게 수정됐는지 확인
commit;                                                 -- 수정결과 저장