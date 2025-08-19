CALL REGISTRA_ALUGUEL_FITA(260, 100000);


DELIMITER $$

CREATE PROCEDURE REGISTRA_ALUGUEL_FITA(IN p_CODFITA INT, IN p_CODCLIENTE INT)
BEGIN
    DECLARE v_DATA DATETIME;
    DECLARE v_STATUS CHAR(1);
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Rollback em caso de erro
        ROLLBACK;
    END;

    SET v_DATA = NOW();

    -- Obter status da fita
    SELECT STATUS INTO v_STATUS FROM FITA WHERE CODFITA = p_CODFITA;

    IF v_STATUS = 'D' THEN
        START TRANSACTION;

        INSERT INTO LOCACAO (CODFITA, CODCLIENTE, DATA) VALUES (p_CODFITA, p_CODCLIENTE, v_DATA);

        UPDATE FITA SET STATUS = 'L' WHERE CODFITA = p_CODFITA;

        COMMIT;
    ELSE
        -- Opcional: sinalizar que a fita não está disponível para aluguel
        -- Pode usar SIGNAL para lançar erro customizado, por exemplo:
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fita não disponível para aluguel';
    END IF;
END$$

DELIMITER ;
