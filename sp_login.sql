DELIMITER //

CREATE PROCEDURE sp_login_usuario(
    IN p_email VARCHAR(100),
    IN p_senha TEXT
)
BEGIN
    DECLARE user_count INT;

    -- Verifica se existe um usuário com o email e senha fornecidos
    SELECT COUNT(*) INTO user_count 
    FROM usuarios 
    WHERE usuarios.email = p_email AND usuarios.senha = p_senha;

    -- Se encontrou um usuário correspondente, retorna sucesso
    IF user_count > 0 THEN
        SELECT 'Login bem-sucedido' AS mensagem;
    ELSE
        SIGNAL SQLSTATE '45002' SET MESSAGE_TEXT = 'E-mail ou senha inválidos';
    END IF;
END //

DELIMITER ;



drop procedure sp_login_usuario;