vo �ڵ�����
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

-- �������
SELECT * FROM EMP;
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7369', '��浿', '���α׷���', '7902', '2013/12/17', 600, 200 ,
'50');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7499', '����', '��������', '7698', '2021/02/20', 550, 300 ,
'20');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7521', '������', '�������', '7698', '2020/02/22', 250, 400 ,
'30');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7566', '�赿��', '������', '7839', '2012/04/02', 375,NULL, '40');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7654', '��ο�', '�������', '7698', '2018/09/28', 350, 700 ,
'30');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7698', '�����', '������', '7839', '2014/05/01', 450,NULL, '40');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7782', '������', '������', '7839', '2022/02/20', 470, 600, '40');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7788', '�ڽ¿�', '�м���', '7839', '2021/03/22', 300,NULL ,
'50');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7839', '������', '��ǥ�̻�', NULL, '2010/01/05', 900, 100,
'40');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7844', '������', '�������', '7698', '2016/09/28',340,NULL,
'30');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7876', '�蹮��', 'ȸ�����', '7788', '2014/05/01', 420,NULL,
'10');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7900', '������', '����м�', '7698', '2012/04/02', 750,NULL,
'20');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7902', '�ű���', '�м���', '7566', '2019/09/28', 300,NULL, '50');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7934', '������', '���α׷���', '7782', '2018/01/23', 290,400,
'50');
INSERT INTO EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL,
COMM, DEPTNO)
VALUES('7999', '����ȯ', 'ȸ�����', '7782',SYSDATE, 210,NULL, '10');
SELECT * FROM EMP ORDER BY EMPNO ASC;

-- �μ�����
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES('10', 'ȸ���', '����');
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES('20', '�����', '����');
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES('30', '������', '����');
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES('40', '������', '����');
INSERT INTO DEPT(DEPTNO, DNAME, LOC)
VALUES('50', '���ߺ�', '����');

1. ���� �����ڸ� �̿��Ͽ� ��� ����� ���ؼ� 300������ �λ��� ����� ��, ����� �̸�, �޿�, �λ�� �޿��� ����Ͻÿ�.
select empno as �����, sal as �޿�, sal+300 "�λ�� �޿�"
    from emp;
    
2. �����ȣ 7999 ����� ����(JOB)�� '���α׷���'�� �����Ͻÿ�
update emp
    set job = '���α׷���'
    where empno = '7999';

3. emp ���̺� job �Ӽ��� ������Ÿ���� varchar2(20)���� �����Ͻÿ�
alter table emp
modify job varchar2(20);

4. emp ���̺� �����ȣ�� dept���̺�� �ܷ�Ű�� �����Ͻÿ�.
alter table emp
    add (constraint xfk_emp foreign key(deptno)
    references dept(deptno));
    
5. ����� �̸�,  �޿�, ���� �� ������ �� ������ ���� �ͺ��� ���� ������ ����Ͻÿ�.
���� �Ѽ����� ���޿� 12�� ���� �� $100�� �󿩱��� ���ؼ� ����Ͻÿ�
select e.ename as �����, sal as ����, sal * 12+100 "���� �Ѽ���"
    from emp e;

6. �޿��� 500�� �Ѵ� ����� �̸��� �޿��� ǥ��, �޿��� ���� �ͺ��� ���� ������ ����Ͻÿ�
select e.ename as �����, e.sal as �޿�
    from emp e 
    where e.sal >= 500
    order by 2 desc;

7. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����Ͻÿ�
select e.deptno as �μ���ȣ, e.ename as ����� 
    from emp e
    where e.empno = '7788';
    
8. �޿��� 400���� 500 ���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ����Ͻÿ�
select e.ename as �����, e.sal as �޿�
    from emp e
    where e.sal not between 400 and 500;

9. 2013�� 2�� 20�� ���� 2018�� 5�� 1�� ���̿� �Ի��� ����� �̸�, ��� ����, �Ի����� ����Ͻÿ�.
select e.ename as �����, e.job "��� ����", e.hiredate as �Ի���
    from emp e
    where e.hiredate between '13/02/20' and '18/05/01'; 
    
10. �μ���ȣ�� 20 �� 30�� ���� ����� �̸��� �μ���ȣ�� ���. �̸��� ����(��������)���� �����ڼ����� ����Ͻÿ�.
select e.ename as �����, e.deptno as �μ���ȣ
    from emp e
    where e.deptno in(20, 30)
    order by 1 desc;

11. ����� �޿��� 400���� 500 ���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ���, �̸���(��������)���� ����Ͻÿ�
select e.ename as �����, e.sal as �޿�, e.deptno as �μ���ȣ
    from emp e
    where e.sal between 300 and 400 and e.deptno in(20, 30);

12. 2000�⵵�� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�(like �����ڿ� ���ϵ�ī�� ���)
select e.ename as �����, e.hiredate as �Ի���
    from emp e
--    where substr(e.hiredate, 1, 2) = '20';
    where e.hiredate like '20_%';

13. �����ڰ� ���� ����� �̸��� ��� ������ ����Ͻÿ�.
select e.ename as �����, e.job "��� ����" 
    from emp e
    where e.mgr is null;

14. Ŀ�̼��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿� �� Ŀ�̼��� �������� �������� �����Ͽ� ǥ���Ͻÿ�.
select e.ename as �����, e.sal as �޿�, e.comm as Ŀ�̼�
    from emp e
    where e.comm is not null
    order by e.sal, e.comm desc;

15. �̸��� ����° ���ڰ� '��'�� ����� �̸��� ǥ���Ͻÿ�.
select e.ename as �����
    from emp e
    where e.ename like '__��';
    
16. �̸��� A�� E�� ��� �����ϰ� �ִ� ����� �̸��� ǥ���Ͻÿ�
select e.ename as ���
    from emp e
    where instr(e.ename, '��') and instr(e.ename, '��');
    
17. �������� ������, �Ǵ� ���α׷����̸鼭 �޿��� 350, 400 �Ǵ� 300�� �ƴ� ����� �̸�, ��� ����, �޿��� ����Ͻÿ�
select e.ename as �����, e.job "��� ����", e.sal as �޿�
    from emp 
    where (e.job like '������' or e.job like '���α׷���') and (e.sal=350 or e.sal=400) or e.sal is not 300;
    
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
    DBMS_OUTPUT.PUT_LINE('���������� ������Ʈ �Ǿ����ϴ�.');
    COMMIT;
    
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('���� �߻�:' || SQLERRM);
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
    DBMS_OUTPUT.PUT_LINE(v_num || ' �� ¦��');
ELSE
    DBMS_OUTPUT.PUT_LINE(v_num || ' �� Ȧ��');
    END IF;
END;
/ -- PL/SQL������ ���� ǥ���ϰ� Ctrl+Enter Ű�� �ۿ��ϵ��� ��

DECLARE
    v_num NUMBER :=96;
BEGIN
    DBMS_OUTPUT.ENABLE;
    IF v_num > 90 THEN
        DBMS_OUTPUT.PUT_LINE('��');
    ELSIF v_num > 80 THEN
        DBMS_OUTPUT.PUT_LINE('��');
    ELSIF v_num > 70 THEN
         DBMS_OUTPUT.PUT_LINE('��');
    ELSE
        DBMS_OUTPUT.PUT_LINE('�й��սô�.');
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
        DBMS_OUTPUT.PUT_LINE('��� �ܰ��� 500,000�ʰ��Դϴ�.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('��� �ܰ��� 500,000�����Դϴ�.');
    END IF;
END;
/

 -- ���� (���� �ʿ�)
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
--            DBMS_OUTPUT.PUT_LINE('VIP ȸ��(' || V_MEM_NAME || ', ' || V_MEM_MILEAGE || ')');
--        ELSE
--            DBMS_OUTPUT.PUT_LINE('�Ϲ�ȸ��(' || V_MEM_NAME || ', ' || V_MEM_MILEAGE || ')');
--        END IF;
--END;
/

DECLARE
    V_NUM   NUMBER := 100;
BEGIN
    V_NUM := TRUNC(V_NUM / 10);
    
    CASE V_NUM
        WHEN 9, 10 THEN
            DBMS_OUTPUT.PUT_LINE('��' || '(' || V_NUM || ')');
        WHEN 8 THEN
            DBMS_OUTPUT.PUT_LINE('��' || '(' || V_NUM || ')');
        WHEN 7 THEN
            DBMS_OUTPUT.PUT_LINE('��' || '(' || V_NUM || ')');
        WHEN 6 THEN
            DBMS_OUTPUT.PUT_LINE('��' || '(' || V_NUM || ')');
        ELSE
            DBMS_OUTPUT.PUT_LINE('�й��սô�.');
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
    DBMS_OUTPUT.PUT_LINE('1���� 10������ �� =' || V_SUM);
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
        DBMS_OUTPUT.PUT_LINE(V_I || ' �� ');
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
         DBMS_OUTPUT.PUT_LINE('�ű��ڵ�' || V_CODE || '�� �߰��Ǿ���');
     END IF;
    END LOOP;
END;
/

SELECT * FROM LPROD;

-- ���� (���� �ʿ�)
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
        DBMS_OUTPUT.PUT_LINE('1���� 10������ �� = ' || v_sum);
        if v_var > 10 THEN
            EXIT;
        END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1���� 10������ �� = ' || v_sum);
END;

BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE( 'i = '|| i );
    END LOOP;
END;

DECLARE
    TYPE starcraft IS VARRAY(20) OF VARCHAR2(12); -- Type ����
    v_star starcraft;
BEGIN
    v_star :=starcraft('Terran', 'Profork');
    v_star.EXTEND;
    v_star(3) := 'Zerg';
    DBMS_OUTPUT.PUT_LINE('��Ÿũ����Ʈ �达 ���� : ' || v_star.COUNT);
    FOR i IN v_star.FIRST..v_star.LAST LOOP
        DBMS_OUTPUT.PUT_LINE( i || '��° ���� : ' || v_star(i));
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

DBMS_OUTPUT.PUT_LINE('��ǰ�з� ���� =' || t_lprod_nm.COUNT);
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
    DBMS_OUTPUT.PUT_LINE('�з��� =' || v_name);
    
 EXCEPTION 
--    WHEN NO_DATA_FOUND THEN
--        DBMS_OUTPUT.PUT_LINE('�ش� ������ �����ϴ�.');
--    WHEN TOO_MANY_ROWS THEN
--        DBMS_OUTPUT.PUT_LINE('�Ѱ� �̻��� ���� ���Խ��ϴ�.');
--    WHEN OTHERS THEN
--        DBMS_OUTPUT.PUT_LINE('��Ÿ ���� :' || SQLERRM);
END;

DECLARE
    exp_reference EXCEPTION;
    PRAGMA EXCEPTION_INIT(exp_reference, -2292);
BEGIN
    DELETE FROM lprod WHERE lprod_gu = 'P403';
    DBMS_OUTPUT.PUT_LINE('�з� ����');
EXCEPTION
    WHEN exp_reference THEN
        DBMS_OUTPUT.PUT_LINE('���� �Ұ�: '|| SQLERRM);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLCODE || ' ' || SQLERRM);
END;

SELECT * FROM lprod;

ACCEPT p_lgu PROMPT '����Ϸ��� �з��ڵ� �Է� :'
DECLARE
    exp_lprod_gu EXCEPTION;
    v_lgu VARCHAR2(10) := UPPER('&p_lgu');
BEGIN
    IF v_lgu IN ('P101', 'P102', 'P201', 'P202') THEN
        RAISE exp_lprod_gu;
    END IF;
    DBMS_OUTPUT.PUT_LINE(v_lgu || '�� ��� ����');
EXCEPTION
    WHEN exp_lprod_gu THEN
        DBMS_OUTPUT.PUT_LINE(v_lgu || '�� �̹� ��ϵ� �ڵ��Դϴ�.');
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
            DBMS_OUTPUT.PUT_LINE(UpRemain_cur%ROWCOUNT || '��° ��ǰ=' || v_prod || '�԰����= ' ||  v_qty || '�Դϴ�.');
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
        OPEN member_cur('�ֺ�');
        LOOP
            FETCH member_cur INTO v_name, v_mileage;
            EXIT WHEN member_cur%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(member_cur%ROWCOUNT || '��°' || v_name || ', ' || v_mileage);
        END LOOP;
        CLOSE member_cur;
    END;
/

set verify off
set echo off

-- ������ �Է¹޾Ƽ� FOR LOOP�� �̿��ϴ� CURSOR
ACCEPT p_job PROMPT '������ �Է��ϼ���:'

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
            DBMS_OUTPUT.PUT_LINE(member_cur%ROWCOUNT || '��°' || mem_rec.mem_name || ', ' || mem_rec.mem_mileage);
        END LOOP;
    END;
/

--------------------------------- ���ν��� �����ϱ�

CREATE OR REPLACE PROCEDURE usp_prod_totalstock_update
(
    v_prod_id IN prod.prod_id%TYPE,
    v_qty IN prod.prod_totalstock%TYPE)
IS
BEGIN
    UPDATE prod
    SET prod_totalstock = prod_totalstock + v_qty
    WHERE prod_id = v_prod_id;
    DBMS_OUTPUT.PUT_LINE('���������� ������Ʈ �Ǿ����ϴ�.');
    COMMIT;
    
    EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('���� �߻�:' || SQLERRM);
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
    
    -- �ٽ�(�����ϱ�)
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
    DBMS_OUTPUT.PUT_LINE('*�԰� => ' || send_inqty);
    DBMS_OUTPUT.PUT_LINE('*��� => ' || send_outqty);
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
        DBMS_OUTPUT.PUT_LINE('���� �߻�:' || SQLERRM);
        RETURN null;
    END;
    
VAR m_name VARRCHAR2
EXECUTE :m_name := fn_memName('a001');
PRINT m_name

DECLARE
    m_name VARCHAR2(30);
BEGIN
    m_name := fn_memName('a001');
    DBMS_OUTPUT.PUT_LINE('ȸ���� => ' || m_name);
END;

SELECT cart_no, cart_prod, cart_member, fn_memName(cart_member)
    FROM cart
    WHERE cart_no = '2023040100001';
    
1. ���� �̸����� Ʈ���� �ۼ�
CREATE OR REPLACE TRIGGER TG_LPROD_IN
AFTER INSERT
ON LPROD
BEGIN
DBMS_OUTPUT.PUT_LINE('�ڽ¹� ��ǰ�з��� �߰��Ǿ����ϴ�.');
END;
2. ������� Ʈ���� Ȯ��
SELECT TRIGGER_NAME FROM USER_TRIGGERS;

3. ��ǰ�з� ���̺� LOW�� �߰�
INSERT INTO LPROD (LPROD_ID, LPROD_GU, LPROD_NM)
VALUES (
    (SELECT NVL(MAX(LPROD_ID), 0) + 1 FROM LPROD),
    (SELECT 'P' || TO_CHAR(NVL(SUBSTR(MAX(LPROD_GU), 2), '0') + 1) FROM LPROD),
    'Ʈ�����߰���1'
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


INSERT INTO EMP01 VALUES(1, '������', '���α׷���');
INSERT INTO EMP01 VALUES(2, '������', '���α׷���');
INSERT INTO EMP01 VALUES(3, '������', '���α׷���');


CREATE OR REPLACE TRIGGER TRG_02
AFTER DELETE ON EMP01
FOR EACH ROW
BEGIN
DELETE FROM SAL01 WHERE EMPNO=:old.EMPNO;
END;

DELECT FROM EMP01 WHERE EMPNO=2;

SELECT * FROM EMP01;

240806
INSERT ��
INSERT INTO CHAT
VALUES('a001', 'b001', '�޼���', 'F');

SELECT ��
SELECT  * FROM CHAT
WHERE USER2 = 'b001'
AND reception= 'F';
 
 UPDATE ��
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
��� �߰�
INSERT INTO HAM_SET
SELECT (SELECT MAX(SET_NO) FROM HAM_SET) + ROWNUM,
            MENU_NAME, 5
FROM HAM_MENU;


��� ��ȸ
SELECT S.SET_NO, S.SET_NAME, M.MENU_NAME, M.MENU_PRICE
FROM HAM_SET S, HAM_SET_MENU SM, HAM_MENU M
WHERE S.SET_NO = SM.SET_NO
AND SM.MENU_NO = M.MENU_NO
AND S.GROUP_NO = 4
ORDER BY S.SET_NO;


��� ��ġ��
SELECT S.SET_NO, S.SET_NAME, LISTAGG( M.MENU_NAME, ', ') SINGLE_LIST , SUM(M.MENU_PRICE) PRICE
FROM HAM_SET S, HAM_SET_MENU SM, HAM_MENU M
WHERE S.SET_NO = SM.SET_NO
AND SM.MENU_NO = M.MENU_NO
AND S.GROUP_NO = 4
GROUP BY S.SET_NO, S.SET_NAME
ORDER BY S.SET_NO;


��� ��ȸ ����
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
�ڵ�����
SELECT 
    'private '||
   DECODE( DATA_TYPE , 'NUMBER', 'int ', 'String ' )||
    LOWER(COLUMN_NAME)||';'
FROM COLS
WHERE TABLE_NAME = 'BOARD'
ORDER BY COLUMN_ID;

���� �ۼ�
SELECT BOARD_NO, TITLE, CONTENT, 
           B.REG_DATE, B.MEM_NO, CNT, NAME WRITER
FROM BOARD B, MEMBER M
WHERE B.MEM_NO = M.MEM_NO;

�����ۼ�2
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
�ڵ�����
SELECT 
    'private '||
   DECODE( DATA_TYPE , 'NUMBER', 'int ', 'String ' )||
    LOWER(COLUMN_NAME)||';'
FROM COLS
WHERE TABLE_NAME = 'BOARD'
ORDER BY COLUMN_ID;

�ڵ� ����
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