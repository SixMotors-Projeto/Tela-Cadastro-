package br.com.tela.cadastro.DAO;

import org.springframework.data.jpa.repository.JpaRepository;
import br.com.tela.cadastro.model.Usuario;

public interface IUsuario extends JpaRepository<Usuario, Long> {
    // Método para buscar um usuário pelo email e senha
    Usuario findByEmailAndSenha(String email, String senha);
}
