use Formula1
-- 1 - Escreva a sentença SQL que exiba o seguinte conjunto de dados. Obrigatoriamente deverá ser utilizada JUNÇÃO 
-- para resolver esta questão:


SELECT	gp.PAIS AS PAIS_GP,    gp.DATA AS DATA_GP,    c.POSICAO,    p.NOME AS PILOTO,    e.NOME AS EQUIPE
FROM 
    COLOCACAO c JOIN  PILOTO p ON c.PILOTO_ID = p.PILOTO_ID 
	JOIN EQUIPE e ON p.EQUIPE_ID = e.EQUIPE_ID JOIN     GRANDE_PREMIO gp ON c.GP_ID = gp.GP_ID
ORDER BY 
    gp.PAIS, c.POSICAO;


-- 2 -  Escreva a sentença SQL capaz de exibir a melhor colocação de cada piloto, independente do grande prêmio

SELECT  p.PILOTO_ID,p.NOME,MIN(c.POSICAO) AS MELHOR_COLOCACAO
FROM PILOTO p JOIN COLOCACAO c ON p.PILOTO_ID = c.PILOTO_ID

GROUP BY 
    p.PILOTO_ID, p.NOME
ORDER BY 
    NOME ASC;


-- 3 - Escreva a sentença SQL capaz de exibir a pontuação total obtida por cada piloto, em toda temporada. 
-- Obrigatoriamente deverá ser utilizada JUNÇÃO para resolver esta questão: [5 pts]


SELECT    p.NOME,SUM(pt.PONTUACAO) AS TOTAL_PONTOS
FROM 
    PILOTO p JOIN COLOCACAO c ON p.PILOTO_ID = c.PILOTO_ID
	JOIN PONTUACAO pt ON c.POSICAO = pt.POSICAO

GROUP BY 
    p.PILOTO_ID, p.NOME
ORDER BY 
    NOME ASC;


	
--4 Reescreva a resposta da questão 3, porém utilizando SUBCONSULTA na cláusula “select” (obrigatoriamente). 
-- Apenas reforçando, o resultado precisa ser o mesmo! 


	SELECT  p.NOME,
    (
        SELECT SUM(pt.PONTUACAO)
        FROM COLOCACAO c
        JOIN PONTUACAO pt ON c.POSICAO = pt.POSICAO
        WHERE c.PILOTO_ID = p.PILOTO_ID
		
    ) AS TOTAL_PONTOS
FROM 
    PILOTO p;
	

-- 5 5) Escreva a sentença SQL capaz de exibir os pontos totais obtidos, por equipe, utilizando obrigatoriamente 
-- SUBCONSULTA na cláusula “select”: [5 pts]


SELECT  e.NOME AS EQUIPE,
    (SELECT SUM(pont.PONTUACAO)
        FROM PILOTO pi  JOIN COLOCACAO c ON pi.PILOTO_ID = c.PILOTO_ID  JOIN PONTUACAO pont ON c.POSICAO = pont.POSICAO
        WHERE pi.EQUIPE_ID = e.EQUIPE_ID
    ) AS TOTAL_PONTOS
FROM 
    EQUIPE e;
	
