CREATE TABLE Disciplinas 
( 
 coddisciplina INT PRIMARY KEY,  
 nome VARCHAR(100),  
 idDisciplinas INT  
)


CREATE TABLE Inscricoes 
( 
 codincricao INT PRIMARY KEY,  
 nota FLOAT,  
 idDisciplinas INT,  
 idAlunos INT 
)


CREATE TABLE Alunos 
( 
 codaluno INT PRIMARY KEY,  
 nome VARCHAR(100)  
)

CREATE TABLE Matriculas 
( 
 codmatricula INT PRIMARY KEY,  
 idAlunos INT,  
 idCursos INT 
)

CREATE TABLE Cursos 
( 
 codcurso INT PRIMARY KEY,  
 nome VARCHAR(100)  
)



ALTER TABLE Disciplinas 
  ADD FOREIGN KEY(idDisciplinas) 
      REFERENCES Disciplinas (coddisciplina)


ALTER TABLE Inscricoes 
  ADD FOREIGN KEY(idDisciplinas) 
      REFERENCES Disciplinas (coddisciplina)


ALTER TABLE Inscricoes 
  ADD FOREIGN KEY(idAlunos) 
      REFERENCES Alunos (codaluno)


ALTER TABLE Matriculas 
  ADD FOREIGN KEY(idAlunos) 
      REFERENCES Alunos (codaluno)


ALTER TABLE Matriculas 
  ADD FOREIGN KEY(idCursos) 
      REFERENCES Cursos (codcurso)






