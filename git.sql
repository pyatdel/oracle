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