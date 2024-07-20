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