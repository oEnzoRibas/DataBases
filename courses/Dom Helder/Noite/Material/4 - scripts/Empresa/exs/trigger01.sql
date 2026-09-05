--apos criar a trigger
--faça insercao
--alteracao e exclusao de um empregado
--tabela emp - empresa.sql

--drop trigger tr_emp

--use EMPRESA

--CREATE TRIGGER tr_EMP ON emp
--FOR INSERT, UPDATE, DELETE AS
--	PRINT 'Inserted:'
--	SELECT 'INSERTED', empno, nome, salario, deptno FROM inserted
--	PRINT 'Deleted:'
--	SELECT 'DELETED', empno, nome, salario, deptno FROM deleted
--GO


--SELECT * FROM EMP

INSERT INTO EMP (EMPNO, NOME, CARGO, GERENTE, DATACONTRATACAO, SALARIO, COMISSAO, DEPTNO)
VALUES (7200, 'UMBERTO STUMPF', 'DIRETOR', 7839, GETDATE(), 500, NULL, 10);

INSERT INTO EMP (EMPNO, NOME, CARGO, GERENTE, DATACONTRATACAO, SALARIO, COMISSAO, DEPTNO)
VALUES (1201, 'FISCHER STEFAN', 'Acessor', 7839, GETDATE(), 50, NULL, 10);




DELETE FROM EMP
WHERE EMPNO = 8001