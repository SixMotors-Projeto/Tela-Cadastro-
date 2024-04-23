create database cadastro;

use cadastro;

create table usuarios(
	ID integer AUTO_INCREMENT PRIMARY KEY,
    tipo_cliente VARCHAR(50) NOT NULL,
    nome VARCHAR(200) NOT NULL,
    cpf VARCHAR(50) NOT NULL unique,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL unique,
    senha text not null
    );
    
insert into usuarios values (null, 'pessoa fisica', 'exemplo silva', '11111111111', '121211212', 'exemplo@example.com', 'Admin123') ;

select * from usuarios;

CALL sp_inserir_usuario('pessoa fisica', 'João Silva', '12345678902', '11987654322', 'joao@exemplo.com', 'senha123');
