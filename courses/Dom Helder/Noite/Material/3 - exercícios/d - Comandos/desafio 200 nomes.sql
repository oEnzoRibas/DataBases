USE Formula1

SELECT * FROM EQUIPE

DECLARE @CONT INT
DECLARE @equipe_id INT

-- Inicializar as variáveis
SET @CONT = 1
SET @equipe_id = (SELECT MAX(EQUIPE_ID) + 1 FROM EQUIPE);

-- Declarar tabelas temporárias
DECLARE @Prefix TABLE (Prefix VARCHAR(20));
DECLARE @Name TABLE (Name VARCHAR(20));
DECLARE @Sufix TABLE (Sufix VARCHAR(20));

-- Inserir prefixos
INSERT INTO @Prefix VALUES 
('Os'), ('Equipe'), ('Time'), ('Clube'), ('Grupo'), ('Associação');

-- Inserir nomes base
INSERT INTO @Name VALUES 
('Falcões'), ('Tigres'), ('Leões'), ('Lobos'), ('Águias'),
('Dragões'), ('Panteras'), ('Trovões'), ('Samurais'), 
('Gladiadores'), ('Vikings'), ('Titãs'), ('Corujas'), ('Gigantes');

-- Inserir sufixos
INSERT INTO @Sufix VALUES 
('FC'), ('Unidos'), ('Esporte'), ('Clube'), ('Do Norte'), 
('Do Sul'), ('Elite'), ('Alpha'), ('Legends'), ('XP');

-- Inserir 200 nomes aleatórios
WHILE @CONT <= 200
BEGIN
    -- Gerar um nome aleatório utilizando as tabelas temporárias
    DECLARE @NomeEquipe VARCHAR(100)
    SET @NomeEquipe = 
        (SELECT TOP 1 Prefix FROM @Prefix ORDER BY NEWID()) + ' ' + 
        (SELECT TOP 1 Name FROM @Name ORDER BY NEWID()) + ' ' + 
        (SELECT TOP 1 Sufix FROM @Sufix ORDER BY NEWID());

    -- Verificar se o EQUIPE_ID já existe
    IF NOT EXISTS (SELECT 1 FROM EQUIPE WHERE EQUIPE_ID = @equipe_id)
    BEGIN
        -- Inserir o novo registro na tabela
        INSERT INTO EQUIPE (EQUIPE_ID, NOME)
        VALUES (@equipe_id, @NomeEquipe); 
    END

    -- Incrementar o EQUIPE_ID e o contador
    SET @equipe_id = @equipe_id + 1
    SET @CONT = @CONT + 1
END


-- Exibir os registros inseridos
SELECT * FROM EQUIPE;
