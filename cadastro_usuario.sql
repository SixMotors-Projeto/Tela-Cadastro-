-- Criar o banco de dados
create database cadastro;

-- Selecionar o banco de dados
use cadastro;

-- Criar a tabela de usuários
create table usuarios(
	ID integer AUTO_INCREMENT PRIMARY KEY,
    tipoCliente VARCHAR(50) NOT NULL,
    nome VARCHAR(200) NOT NULL,
    cpf VARCHAR(50) NOT NULL unique,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL unique,
    senha text not null
    );
    
-- Inserir um usuário de exemplo
insert into usuarios values (null, 'pessoa fisica', 'exemplo silva', '11111111111', '121211212', 'exemplo@example.com', 'Admin123') ;

-- Exibir os usuários inseridos na tabela
select * from usuarios;

-- Chamar a procedure sp_inserir_usuario para inserir outro usuário
CALL sp_inserir_usuario('pessoa fisica', 'João Silva', '12345678902', '11987654322', 'joao@exemplo.com', 'senha123');

CALL sp_login_usuario('joao@exemplo.com', 'senha123');

drop table usuarios;