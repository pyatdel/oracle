vo 코드조각
SELECT 
    'private '||
   DECODE( DATA_TYPE , 'NUMBER', 'int ', 'String ' )||
    LOWER(COLUMN_NAME)||';'
FROM COLS
WHERE TABLE_NAME = 'MEMBER'
ORDER BY COLUMN_ID;


DROP TABLE EMP;
DROP TABLE DEPT;
CREATE TABLE EMP

(EMPNO CHAR(4) NOT NULL ENABLE,
ENAME VARCHAR2(20) NOT NULL ENABLE,
JOB VARCHAR2(30) NOT NULL ENABLE,
MGR VARCHAR2(4),
HIREDATE DATE NOT NULL ENABLE,
SAL NUMBER(10,0) NOT NULL ENABLE,
COMM NUMBER,
DEPTNO CHAR(2) NOT NULL ENABLE,
CONSTRAINT XPK_EMP PRIMARY KEY (EMPNO) );

CREATE TABLE DEPT
(
DEPTNO CHAR(2) NOT NULL ENABLE,
DNAME VARCHAR2(20) NOT NULL ENABLE,
LOC VARCHAR2(30) NOT NULL ENABLE,
CONSTRAINT XPK_DEPT PRIMARY KEY (DEPTNO) );

-- 사원관리
SELECT * FROM EMP;
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7369', '장길동', '프로그래머', '7902', '2013/12/17', 600, 200 ,
'50');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7499', '고영우', '시장조사', '7698', '2021/02/20', 550, 300 ,
'20');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7521', '구기현', '영업사원', '7698', '2020/02/22', 250, 400 ,
'30');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7566', '김동혁', '관리자', '7839', '2012/04/02', 375,NULL, '40');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7654', '김민욱', '영업사원', '7698', '2018/09/28', 350, 700 ,
'30');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7698', '김민정', '관리자', '7839', '2014/05/01', 450,NULL, '40');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7782', '김지완', '관리자', '7839', '2022/02/20', 470, 600, '40');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7788', '박승우', '분석가', '7839', '2021/03/22', 300,NULL ,
'50');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7839', '박윤수', '대표이사', NULL, '2010/01/05', 900, 100,
'40');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7844', '박정수', '영업사원', '7698', '2016/09/28',340,NULL,
'30');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7876', '배문기', '회계업무', '7788', '2014/05/01', 420,NULL,
'10');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7900', '변정민', '시장분석', '7698', '2012/04/02', 750,NULL,
'20');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7902', '신국현', '분석가', '7566', '2019/09/28', 300,NULL, '50');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7934', '신현근', '프로그래머', '7782', '2018/01/23', 290,400,
'50');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7999', '오대환', '회계업무', '7782',SYSDATE, 210,NULL, '10');
SELECT * FROM EMP ORDER BY EMPNO ASC;

-- 부서관리
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES('10', '회계부', '서울');
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES('20', '조사부', '세종');
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES('30', '영업부', '서울');
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES('40', '관리부', '대전');
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES('50', '개발부', '대전');

1. 덧셈 연산자를 이용하여 모든 사원에 대해서 300만원의 인상을 계산한 후, 사원의 이름, 급여, 인상된 급여를 출력하시오.
select empno as 사원명, sal as 급여, sal+300 "인상된 급여"
    from emp;
    
2. 사원번호 7999 사람의 업무(JOB)를 '프로그래머'로 수정하시오
update emp
    set job = '프로그래머'
    where empno = '7999';

3. emp 테이블 job 속성의 데이터타입을 varchar2(20)으로 수정하시오
alter table emp
modify job varchar2(20);

4. emp 테이블에 사원번호로 dept테이블과 외래키를 생성하시오.
alter table emp
    add (constraint xfk_emp foreign key(deptno)
    references dept(deptno));
    
5. 사원의 이름,  급여, 연간 총 수입을 총 수입이 많은 것부터 작은 순으로 출력하시오.
연간 총수입은 월급에 12를 곱한 후 $100의 상여금을 더해서 계산하시오
select e.ename as 사원명, sal as 월급, sal * 12+100 "연간 총수입"
    from emp e;

6. 급여가 500을 넘는 사원의 이름과 급여를 표현, 급여가 많은 것부터 작은 순으로 출력하시오
select e.ename as 사원명, e.sal as 급여
    from emp e 
    where e.sal >= 500
    order by 2 desc;

7. 사원번호가 7788인 사원의 이름과 부서번호를 출력하시오
select e.deptno as 부서번호, e.ename as 사원명 
    from emp e
    where e.empno = '7788';
    
8. 급여가 400에서 500 사이에 포함되지 않는 사원의 이름과 급여를 출력하시오
select e.ename as 사원명, e.sal as 급여
    from emp e
    where e.sal not between 400 and 500;

9. 2013년 2월 20일 부터 2018년 5월 1일 사이에 입사한 사원의 이름, 담당 업무, 입사일을 출력하시오.
select e.ename as 사원명, e.job "담당 업무", e.hiredate as 입사일
    from emp e
    where e.hiredate between '13/02/20' and '18/05/01'; 
    
10. 부서번호가 20 및 30에 속한 사원의 이름과 부서번호를 출력. 이름을 기준(내림차순)으로 영문자순으로 출력하시오.
select e.ename as 사원명, e.deptno as 부서번호
    from emp e
    where e.deptno in(20, 30)
    order by 1 desc;

11. 사원의 급여가 400에서 500 사이에 포함되고 부서번호가 20 또는 30인 사원의 이름, 급여와 부서번호를 출력, 이름순(오름차순)으로 출력하시오
select e.ename as 사원명, e.sal as 급여, e.deptno as 부서번호
    from emp e
    where e.sal between 300 and 400 and e.deptno in(20, 30);

12. 2000년도에 입사한 사원의 이름과 입사일을 출력하시오(like 연산자와 와일드카드 사용)
select e.ename as 사원명, e.hiredate as 입사일
    from emp e
--    where substr(e.hiredate, 1, 2) = '20';
    where e.hiredate like '20_%';

13. 관리자가 없는 사원의 이름과 담당 업무를 출력하시오.
select e.ename as 사원명, e.job "담당 업무" 
    from emp e
    where e.mgr is null;

14. 커미션을 받을 수 있는 자격이 되는 사원의 이름, 급여, 커미션을 출력하되 급여 및 커미션을 기준으로 내림차순 정렬하여 표시하시오.
select e.ename as 사원명, e.sal as 급여, e.comm as 커미션
    from emp e
    where e.comm is not null
    order by e.sal, e.comm desc;

15. 이름의 세번째 문자가 '우'인 사원의 이름을 표시하시오.
select e.ename as 사원명
    from emp e
    where e.ename like '__우';
    
16. 이름에 A와 E를 모두 포함하고 있는 사원의 이름을 표시하시오
select e.ename as 사원
    from emp e
    where instr(e.ename, '김') and instr(e.ename, '민');
    
17. 담당업무가 관리자, 또는 프로그래머이면서 급여가 350, 400 또는 300이 아닌 사원의 이름, 담당 업무, 급여를 출력하시오
select e.ename as 사원명, e.job "담당 업무", e.sal as 급여
    from emp 
    where (e.job like '관리자' or e.job like '프로그래머') and (e.sal=350 or e.sal=400) or e.sal is not 300;
    
select * from emp
select * from dept;


CREATE OR REPLACE PROCEDURE usp_prod_totalstock_update
(
    v_prod_id IN prod.prod_id%TYPE,
    v_qty IN prod.prod_totalstock%TYPE)
IS
BEGIN
    UPDATE prod
    SET prod_totalstock = prod_totalstock + v_qty
    WHERE prod_id = v_prod_id;
    DBMS_OUTPUT.PUT_LINE('정상적으로 업데이트 되었습니다.');
    COMMIT;
    
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('예외 발생:' || SQLERRM);
    ROLLBACK;
    END;
/
SELECT prod_id, prod_totalstock
    FROM prod
    WHERE prod_id = 'P102000006';
/
EXECUTE usp_prod_totalstock_update('P102000006', -300);
/

DECLARE
    v_num NUMBER :=37;
BEGIN
    DBMS_OUTPUT.ENABLE;
    
IF MOD(v_num, 2) = 0 THEN
    DBMS_OUTPUT.PUT_LINE(v_num || ' 는 짝수');
ELSE
    DBMS_OUTPUT.PUT_LINE(v_num || ' 는 홀수');
    END IF;
END;
/ -- PL/SQL문장의 끝을 표시하고 Ctrl+Enter 키가 작용하도록 함

DECLARE
    v_num NUMBER :=96;
BEGIN
    DBMS_OUTPUT.ENABLE;
    IF v_num > 90 THEN
        DBMS_OUTPUT.PUT_LINE('수');
    ELSIF v_num > 80 THEN
        DBMS_OUTPUT.PUT_LINE('우');
    ELSIF v_num > 70 THEN
         DBMS_OUTPUT.PUT_LINE('미');
    ELSE
        DBMS_OUTPUT.PUT_LINE('분발합시다.');
    END IF;
END;
/

DECLARE
    v_avg_sale PROD.PROD_SALE%TYPE;     -- NUMBER(10,0)
    v_sale NUMBER := 500000;
BEGIN
    DBMS_OUTPUT.ENABLE;
    
    SELECT AVG(prod_sale) INTO v_avg_sale FROM prod;
    
    IF v_sale < v_avg_sale THEN
        DBMS_OUTPUT.PUT_LINE('평균 단가가 500,000초과입니다.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('평균 단가가 500,000이하입니다.');
    END IF;
END;
/

 -- 오류 (수정 필요)
--DECLARE
--    V_MEM_ID VARCHAR2(10) := 'e001';
--    V_MEM_MILEAGE MEMBER.MEM_MILEAGE%TYPE;
--    V_MEM_NAME MEMBER.MEM_NAME%TYPE;
--    V_MILE NUMBER :=5000;
--BEGIN
--    DBMS_OUTPUT.ENABLE;
--    
--        SELECT MEM_MILEAGE, MEM_NAME
--        INTO    V_MEM_MILEAGE, V_MEM_NAME
--        FROM MEMBER
--        WHERE = MEM_ID = V_MEM_ID;
--        
--        IF V_MILE < V_MEM_MILEAGE THEN
--            DBMS_OUTPUT.PUT_LINE('VIP 회원(' || V_MEM_NAME || ', ' || V_MEM_MILEAGE || ')');
--        ELSE
--            DBMS_OUTPUT.PUT_LINE('일반회원(' || V_MEM_NAME || ', ' || V_MEM_MILEAGE || ')');
--        END IF;
--END;
/

DECLARE
    V_NUM   NUMBER := 100;
BEGIN
    V_NUM := TRUNC(V_NUM / 10);
    
    CASE V_NUM
        WHEN 9, 10 THEN
            DBMS_OUTPUT.PUT_LINE('수' || '(' || V_NUM || ')');
        WHEN 8 THEN
            DBMS_OUTPUT.PUT_LINE('우' || '(' || V_NUM || ')');
        WHEN 7 THEN
            DBMS_OUTPUT.PUT_LINE('미' || '(' || V_NUM || ')');
        WHEN 6 THEN
            DBMS_OUTPUT.PUT_LINE('양' || '(' || V_NUM || ')');
        ELSE
            DBMS_OUTPUT.PUT_LINE('분발합시다.');
        END CASE;
    END;
/

DECLARE
    V_SUM   NUMBER :=0;
    V_VAR   NUMBER :=1;
BEGIN
    WHILE V_VAR <= 10 LOOP
        V_SUM := V_SUM + V_VAR;
        V_VAR := V_VAR + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1부터 10까지의 합 =' || V_SUM);
END;
/

DECLARE
    V_ID NUMBER :=1;
    V_ID2 NUMBER := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    WHILE V_ID < 20 LOOP
        DBMS_OUTPUT.PUT(RPAD(' ', v_id2, ' '));
        DBMS_OUTPUT.PUT_LINE(RPAD('*', V_ID, '*'));
        V_ID := V_ID + 2;
        V_ID2 := V_ID2 -1;
        END LOOP;
    END;
/
set serveroutput on;

DECLARE
  V_I NUMBER :=2;
  V_J NUMBER :=1;
BEGIN
    WHILE V_I < 10 LOOP
        DBMS_OUTPUT.PUT_LINE('                    ');
        DBMS_OUTPUT.PUT_LINE('==========');
        DBMS_OUTPUT.PUT_LINE(V_I || ' 단 ');
        DBMS_OUTPUT.PUT_LINE('==========');
        
        V_J :=1;
        
        WHILE V_J < 10 LOOP
            DBMS_OUTPUT.PUT_LINE(V_I || 'X' || V_J || '=' || V_I * V_J);
            
            V_J := V_J + 1;
        END LOOP;
        
        V_I :=V_I + 1;
    END LOOP;
END;
/

DECLARE
    V_ADD NUMBER(5)  := 1000;
    V_CODE CHAR(4) :='';
    V_ID NUMBER(5);
BEGIN
    SELECT MAX(LPROD_ID) INTO V_ID FROM LPROD;
    WHILE V_ADD <= 1005 LOOP
     V_ADD := V_ADD + 1;
     V_ID := V_ID + 1;
     V_CODE := 'TT' || SUBSTR(TO_CHAR(V_ADD), -2);
    INSERT INTO LPROD(LPROD_ID, LPROD_GU, LPROD_NM)
VALUES(V_ID, V_CODE, 'LOOP TEST');
     IF SQL%FOUND THEN
         DBMS_OUTPUT.PUT_LINE('신규코드' || V_CODE || '가 추가되었음');
     END IF;
    END LOOP;
END;
/

SELECT * FROM LPROD;

-- 오류 (수정 필요)
DECLARE
v_sum INT :=0;
v_var Int :=1;
BEGIN
<<mylable>>
    v_sum := v_sum + v_var;
    v_var := v_var + 1;
    IF v_var <= 10 THEN;
     GOTO mylabel;
    END IF
    DBMS_OUTPUT.PUT_LINE(v_sum);
    DBMS_OUTPUT.PUT_LINE(v_var);
END;
/

DECLARE
    v_sum NUMBER :=0;
    v_var NUMBER :=1;
BEGIN
    LOOP
        v_sum := v_sum + v_var;
        v_var := v_var + 1;
        DBMS_OUTPUT.PUT_LINE('1부터 10까지의 합 = ' || v_sum);
        if v_var > 10 THEN
            EXIT;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1부터 10까지의 합 = ' || v_sum);
END;

BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE( 'i = '|| i );
    END LOOP;
END;

DECLARE
    TYPE starcraft IS VARRAY(20) OF VARCHAR2(12); -- Type 선언
    v_star starcraft;
BEGIN
    v_star :=starcraft('Terran', 'Profork');
    v_star.EXTEND;
    v_star(3) := 'Zerg';
    DBMS_OUTPUT.PUT_LINE('스타크래프트 김씨 종족 : ' || v_star.COUNT);
    FOR i IN v_star.FIRST..v_star.LAST LOOP
        DBMS_OUTPUT.PUT_LINE( i || '번째 종족 : ' || v_star(i));
    END LOOP;
END;

DECLARE
    TYPE lprod_nm_table IS TABLE OF VARCHAR2(40)
        INDEX BY PLS_INTEGER;
    t_lprod_nm lprod_nm_table;
BEGIN
    FOR I_list IN (SELECT lprod_id, lprod_nm FROM lprod) LOOP
    t_lprod_nm(I_list.lprod_id) := I_list.lprod_nm;
    DBMS_OUTPUT.PUT_LINE(I_list.lprod_id || '=' || I_list.lprod_nm );
END LOOP;

DBMS_OUTPUT.PUT_LINE('상품분류 갯수 =' || t_lprod_nm.COUNT);
FOR i IN t_lprod_nm.FIRST..t_lprod_nm.LAST LOOP
    IF t_lprod_nm.EXISTS(i) THEN
        DBMS_OUTPUT.PUT_LINE(i || ' ' || t_lprod_nm(i));
    END IF;
END LOOP;
END;

DECLARE
    v_name varchar2(20);
BEGIN
    SELECT lprod_nm INTO v_name FROM lprod WHERE lprod_gu = 'P201';
    DBMS_OUTPUT.PUT_LINE('분류명 =' || v_name);
    
 EXCEPTION 
--    WHEN NO_DATA_FOUND THEN
--        DBMS_OUTPUT.PUT_LINE('해당 정보가 없습니다.');
--    WHEN TOO_MANY_ROWS THEN
--        DBMS_OUTPUT.PUT_LINE('한개 이상의 값이 나왔습니다.');
--    WHEN OTHERS THEN
--        DBMS_OUTPUT.PUT_LINE('기타 에러 :' || SQLERRM);
END;

DECLARE
    exp_reference EXCEPTION;
    PRAGMA EXCEPTION_INIT(exp_reference, -2292);
BEGIN
    DELETE FROM lprod WHERE lprod_gu = 'P403';
    DBMS_OUTPUT.PUT_LINE('분류 삭제');
EXCEPTION
    WHEN exp_reference THEN
        DBMS_OUTPUT.PUT_LINE('삭제 불가: '|| SQLERRM);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE || ' ' || SQLERRM);
END;

SELECT * FROM lprod;

ACCEPT p_lgu PROMPT '등록하려는 분류코드 입력 :'
DECLARE
    exp_lprod_gu EXCEPTION;
    v_lgu VARCHAR2(10) := UPPER('&p_lgu');
BEGIN
    IF v_lgu IN ('P101', 'P102', 'P201', 'P202') THEN
        RAISE exp_lprod_gu;
    END IF;
    DBMS_OUTPUT.PUT_LINE(v_lgu || '는 등록 가능');
EXCEPTION
    WHEN exp_lprod_gu THEN
        DBMS_OUTPUT.PUT_LINE(v_lgu || '는 이미 등록된 코드입니다.');
END;

DECLARE
    v_prod VARCHAR2(30);
    v_qty NUMBER(10,0);
    
    CURSOR UpRemain_cur IS
        SELECT buy_prod, SUM(buy_qty) FROM buyprod
        WHERE EXTRACT(YEAR FROM buy_date) = 2023
        GROUP BY buy_prod ORDER BY buy_prod ASC;
    BEGIN
        OPEN UpRemain_cur;
        FETCH UpRemain_cur INTO v_prod, v_qty;
        WHILE (UpRemain_cur%FOUND) LOOP
            DBMS_OUTPUT.PUT_LINE(UpRemain_cur%ROWCOUNT || '번째 상품=' || v_prod || '입고수량= ' ||  v_qty || '입니다.');
            FETCH UpRemain_cur INTO v_prod, v_qty;
        END LOOP;
        CLOSE UpRemain_cur;
    END;

DECLARE
    v_name VARCHAR2(30);
    v_mileage NUMBER(10);
    
    CURSOR member_cur (v_job VARCHAR2) IS
        SELECT mem_name, mem_mileage FROM member
        WHERE mem_job = v_job
        ORDER BY mem_name ASC;
    BEGIN  
        OPEN member_cur('주부');
        LOOP
            FETCH member_cur INTO v_name, v_mileage;
            EXIT WHEN member_cur%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(member_cur%ROWCOUNT || '번째' || v_name || ', ' || v_mileage);
        END LOOP;
        CLOSE member_cur;
    END;
/

set verify off
set echo off

-- 직업을 입력받아서 FOR LOOP를 이용하는 CURSOR
ACCEPT p_job PROMPT '직업을 입력하세요:'

DECLARE
    v_name VARCHAR2(30);
    v_mileage NUMBER(10);
    CURSOR member_cur IS
        SELECT mem_name, mem_mileage
            FROM member
        WHERE mem_job = '&p_job'
        ORDER BY mem_name ASC;
    BEGIN
    
        FOR mem_rec IN member_cur LOOP
            DBMS_OUTPUT.PUT_LINE(member_cur%ROWCOUNT || '번째' || mem_rec.mem_name || ', ' || mem_rec.mem_mileage);
        END LOOP;
    END;
/

--------------------------------- 프로시저 공부하기

CREATE OR REPLACE PROCEDURE usp_prod_totalstock_update
(
    v_prod_id IN prod.prod_id%TYPE,
    v_qty IN prod.prod_totalstock%TYPE)
IS
BEGIN
    UPDATE prod
    SET prod_totalstock = prod_totalstock + v_qty
    WHERE prod_id = v_prod_id;
    DBMS_OUTPUT.PUT_LINE('정상적으로 업데이트 되었습니다.');
    COMMIT;
    
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('예외 발생:' || SQLERRM);
    ROLLBACK;
    END;
/

SELECT prod_id, prod_totalstock
    FROM prod
    WHERE prod_id = 'P102000006';
/
EXECUTE usp_prod_totalstock_update('P102000006', 500);
/

select * from prod;

CREATE OR REPLACE PROCEDURE usp_MemberID
(
    p_mem_id In member.mem_id%TYPE,
    p_mem_name OUT member.mem_name%TYPE,
    p_mem_like OUT member.mem_like%TYPE)
IS
BEGIN
    SELECT mem_name, mem_like
        INTO p_mem_name, p_mem_like
    FROM member
WHERE mem_id = p_mem_id;
END;
/

VAR mem_name VARCHAR2(20);
VAR mem_like VARCHAR2(20);
EXECUTE usp_MemberID ('f001', :mem_name, :mem_like);
PRINT mem_name;
PRINT mem_like;
/

CREATE OR REPLACE PROCEDURE usp_MemberCartTop
(
    p_year  IN VARCHAR2,
    p_amt   OUT NUMBER,
    p_mem_name  OUT member.mem_name%TYPE
    )
IS
    v_year VARCHAR(5);
    
    -- 핵심(이해하기)
BEGIN
    v_year:= (p_year || '%');
    SELECT mem_name, mem_amt INTO p_mem_name, p_amt
    FROM (
    SELECT mem_name, SUM(prod_price * cart_qty) mem_amt
        FROM member, cart, prod
        WHERE cart_no LIKE v_year
            AND cart_member = mem_id
            AND cart_prod = prod_id
        GROUP BY mem_name
        ORDER BY SUM(prod_price * cart_qty) DESC
        )
        WHERE ROWNUM <= 1;
    END;
/

VAR send_member VARCHAR2;
VAR send_amt NUMBER;
EXEC usp_MemberCartTop('2023', :send_amt, :send_member);
PRINT send_member;
PRINT send_amt;

CREATE OR REPLACE PROCEDURE usp_prod_info
(
    v_prod_id   IN prod.prod_id%TYPE,
    p_yyyymm    IN VARCHAR2,
    p_inqty     OUT NUMBER,
    p_outqty        OUT NUMBER
    )
IS
    v_yyyymm VARCHAR2(7);
BEGIN
    v_yyyymm := (p_yyyymm || '%');
SELECT NVL(SUM(buy_qty), 0) into p_inqty
    FROM buyprod
    WHERE to_char(buy_date, 'YYYYMMDD') LIKE v_yyyymm AND buy_prod = v_prod_id
    GROUP BY buy_prod;
SELECT nvl(sum(cart_qty),0) into p_outqty
    FROM cart
    WHERE cart_no LIKE v_yyyymm AND cart_prod = v_prod_id
    GROUP BY cart_prod;
END;
/

DECLARE
send_inqty NUMBER;
send_outqty NUMBER;
BEGIN
    usp_prod_info('P101000001', '202304', send_inqty, send_outqty);
    DBMS_OUTPUT.PUT_LINE('*입고량 => ' || send_inqty);
    DBMS_OUTPUT.PUT_LINE('*출고량 => ' || send_outqty);
END;
/ 

SELECT cart_no, cart_prod, cart_member,
    (SELECT mem_name FROM member WHERE mem_id = cart_member)
    FROM cart
    WHERE cart_no = '2023040100001';
    
CREATE OR REPLACE FUNCTION fn_memName
    (p_mem_id IN VARCHAR2)
    
    RETURN VARCHAR2
IS
    r_name VARCHAR2(30);
BEGIN
    SELECT mem_name INTO r_name FROM member
    WHERE mem_id = p_mem_id;
    RETURN r_name;
    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('예외 발생:' || SQLERRM);
        RETURN null;
    END;
    
VAR m_name VARRCHAR2
EXECUTE :m_name := fn_memName('a001');
PRINT m_name

DECLARE
    m_name VARCHAR2(30);
BEGIN
    m_name := fn_memName('a001');
    DBMS_OUTPUT.PUT_LINE('회원명 => ' || m_name);
END;

SELECT cart_no, cart_prod, cart_member, fn_memName(cart_member)
    FROM cart
    WHERE cart_no = '2023040100001';
    
1. 파일 이름으로 트리거 작성
CREATE OR REPLACE TRIGGER TG_LPROD_IN
AFTER INSERT
ON LPROD
BEGIN
DBMS_OUTPUT.PUT_LINE('박승민 상품분류가 추가되었습니다.');
END;
2. 만들어진 트리거 확인
SELECT TRIGGER_NAME FROM USER_TRIGGERS;

3. 상품분류 테이블에 LOW를 추가
INSERT INTO LPROD (LPROD_ID, LPROD_GU, LPROD_NM)
VALUES (
    (SELECT NVL(MAX(LPROD_ID), 0) + 1 FROM LPROD),
    (SELECT 'P' || TO_CHAR(NVL(SUBSTR(MAX(LPROD_GU), 2), '0') + 1) FROM LPROD),
    '트리거추가값1'
);
    
    SELECT * FROM LPROD;
    
CREATE TABLE EMP01(
    EMPNO NUMBER(4) PRIMARY KEY,
    EMPNAME VARCHAR2(20),
    EMPJOB VARCHAR2(30));
    
CREATE TABLE SAL01(
    SALNO NUMBER(4) PRIMARY KEY,
    SAL NUMBER(7,2),
    EMPNO NUMBER(4) REFERENCES EMP01));

CREATE SEQUENCE SAL01_SALNO_SEQ;

SELECT * FROM EMP01;


INSERT INTO EMP01 VALUES(1, '전수빈', '프로그래머');
INSERT INTO EMP01 VALUES(2, '전수빈', '프로그래머');
INSERT INTO EMP01 VALUES(3, '전수빈', '프로그래머');


CREATE OR REPLACE TRIGGER TRG_02
AFTER DELETE ON EMP01
FOR EACH ROW
BEGIN
DELETE FROM SAL01 WHERE EMPNO=:old.EMPNO;
END;

DELECT FROM EMP01 WHERE EMPNO=2;

SELECT * FROM EMP01;

240806
INSERT 문
INSERT INTO CHAT
VALUES('a001', 'b001', '메세지', 'F');

SELECT 문
SELECT  * FROM CHAT
WHERE USER2 = 'b001'
AND reception= 'F';
 
 UPDATE 문
 UPDATE CHAT
 SET RECEPTION = 'T'
 WHERE USER2 = 'b001';

240819
MERGE INTO YES24_BOOK A
    USING YES24_BOOK B
    ON (A.ISBN13 = B.ISBN13)
WHEN NOT MATCHED THEN
    INSERT 
    VALUES (?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?);

SELECT * FROM YES24_BOOK;

SELECT 
    'private '||
   DECODE( DATA_TYPE , 'NUMBER', 'int ', 'String ' )||
    LOWER(COLUMN_NAME)||';'
FROM COLS
WHERE TABLE_NAME = 'PROD'
ORDER BY COLUMN_ID;

240822
SELECT *
FROM MEMBER
WHERE ID = 'a001'
AND PW = 'java';

SELECT 
    'private '||
   DECODE( DATA_TYPE , 'NUMBER', 'int ', 'String ' )||
    LOWER(COLUMN_NAME)||';'
FROM COLS
WHERE TABLE_NAME = 'MEMBER'
ORDER BY COLUMN_ID;

SELECT *
FROM WEATHER
WHERE CITY_NO = 1 AND TIME = '12:00';

INSERT INTO WEATHER
VALUES(?, ?, ?, ?, ?, ?);

240828
목록 추가
INSERT INTO HAM_SET
SELECT (SELECT MAX(SET_NO) FROM HAM_SET) + ROWNUM,
            MENU_NAME, 5
FROM HAM_MENU;


목록 조회
SELECT S.SET_NO, S.SET_NAME, M.MENU_NAME, M.MENU_PRICE
FROM HAM_SET S, HAM_SET_MENU SM, HAM_MENU M
WHERE S.SET_NO = SM.SET_NO
AND SM.MENU_NO = M.MENU_NO
AND S.GROUP_NO = 4
ORDER BY S.SET_NO;


목록 합치기
SELECT S.SET_NO, S.SET_NAME, LISTAGG( M.MENU_NAME, ', ') SINGLE_LIST , SUM(M.MENU_PRICE) PRICE
FROM HAM_SET S, HAM_SET_MENU SM, HAM_MENU M
WHERE S.SET_NO = SM.SET_NO
AND SM.MENU_NO = M.MENU_NO
AND S.GROUP_NO = 4
GROUP BY S.SET_NO, S.SET_NAME
ORDER BY S.SET_NO;


목록 조회 오류
SELECT MENU_NO, MENU_NAME, MENU_PRICE, GROUP_NAME
FROM HAM_MENU M, HAM_MENU_GROUP MG
WHERE M.GROUP_NO = MG.GROUP_NO;


VO
SELECT 
    'private '||
   DECODE( DATA_TYPE , 'NUMBER', 'int ', 'String ' )||
    LOWER(COLUMN_NAME)||';'
FROM COLS
WHERE TABLE_NAME = 'HAM_MENU'
ORDER BY COLUMN_ID;

SELECT MENU_NO, MENU_NAME, MENU_PRICE
FROM    HAM_MENU M; 

240829
코드조각
SELECT 
    'private '||
   DECODE( DATA_TYPE , 'NUMBER', 'int ', 'String ' )||
    LOWER(COLUMN_NAME)||';'
FROM COLS
WHERE TABLE_NAME = 'BOARD'
ORDER BY COLUMN_ID;

쿼리 작성
SELECT BOARD_NO, TITLE, CONTENT, 
           B.REG_DATE, B.MEM_NO, CNT, NAME WRITER
FROM BOARD B, MEMBER M
WHERE B.MEM_NO = M.MEM_NO;

쿼리작성2
SELECT * 
FROM (SELECT *
            FROM (SELECT ROWNUM RN,
                BOARD_NO, TITLE, CONTENT, 
                 B.REG_DATE, B.MEM_NO, CNT, NAME WRITER
                FROM BOARD B, MEMBER M
                WHERE B.MEM_NO = M.MEM_NO
                AND CODE_NO = 1
                ORDER BY BOARD_NO DESC
                ) A) A
WHERE RN BETWEEN 21 AND 30;

240905 - BOARD
코드조각
SELECT 
    'private '||
   DECODE( DATA_TYPE , 'NUMBER', 'int ', 'String ' )||
    LOWER(COLUMN_NAME)||';'
FROM COLS
WHERE TABLE_NAME = 'BOARD'
ORDER BY COLUMN_ID;

코드 실행
SELECT CODE_NO, CODE_NAME
    FROM BOARD_CODE;

SELECT B.*, c.code_name, m.name WRITER
FROM BOARD B, BOARD_CODE C, MEMBER M
WHERE b.code_no  = c.code_no
AND b.mem_no = m.mem_no
AND B.CODE_NO = 1
ORDER BY BOARD_NO DESC;

240906 - BOARDBOOTSTRAP
SELECT BOARD_NO, SUBSTR(TITLE, 0, 20) TITLE,
        SUBSTR(CONTENT, 0, 20) CONTENT,
        M.MEM_NO, CNT
        , C.CODE_NAME, M.NAME WRITER
FROM BOARD B, BOARD_CODE C,
    MEMBER M
WHERE B.CODE_NO = C.CODE_NO
AND B.MEM_NO = M.MEM_NO
AND B.CODE_NO = 1;