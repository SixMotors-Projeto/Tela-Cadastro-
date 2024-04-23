package br.com.tela.cadastro.DAO;

import org.springframework.data.repository.CrudRepository;

import br.com.tela.cadastro.model.Usuario;

public interface IUsuario extends CrudRepository<Usuario,Integer>{

}
