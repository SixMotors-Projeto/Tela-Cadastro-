DELIMITER //

CREATE PROCEDURE sp_inserir_usuario(
    IN tipoCliente VARCHAR(50),
    IN nome VARCHAR(200),
    IN cpf VARCHAR(50),
    IN telefone VARCHAR(15),
    IN email VARCHAR(100),
    IN senha TEXT
)
BEGIN
    DECLARE cpf_count INT;
    DECLARE email_count INT;
    
   -- Verifica se o CPF já existe na tabela
SELECT COUNT(*) INTO cpf_count FROM usuarios WHERE usuarios.cpf = cpf;

-- Verifica se o e-mail já existe na tabela
SELECT COUNT(*) INTO email_count FROM usuarios WHERE usuarios.email = email;
    
    IF cpf_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CPF já cadastrado';
    ELSEIF email_count > 0 THEN
        SIGNAL SQLSTATE '45001' SET MESSAGE_TEXT = 'E-mail já cadastrado';
    ELSE
        INSERT INTO usuarios (tipoCliente, nome, cpf, telefone, email, senha)
        VALUES (tipoCliente, nome, cpf, telefone, email, senha);
    END IF;
END //

DELIMITER ;

drop procedure sp_inserir_usuario;