package br.com.tela.cadastro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.com.tela.cadastro.model.Usuario;
import jakarta.persistence.EntityManager;
import jakarta.persistence.ParameterMode;
import jakarta.persistence.StoredProcedureQuery;

@RestController
@CrossOrigin("*")
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private EntityManager entityManager; // Injeta o EntityManager para executar a stored procedure

    @GetMapping
    public String processarLogin(@RequestBody Usuario usuario) {
        try {
            StoredProcedureQuery storedProcedure = entityManager.createStoredProcedureQuery("sp_login_usuario");
            storedProcedure.registerStoredProcedureParameter("p_email", String.class, ParameterMode.IN);
            storedProcedure.registerStoredProcedureParameter("p_senha", String.class, ParameterMode.IN);
            storedProcedure.setParameter("p_email", usuario.getEmail());
            storedProcedure.setParameter("p_senha", usuario.getSenha());

            storedProcedure.execute();
            // O resultado do procedimento é retornado como uma lista de objetos
            // Portanto, vamos buscar o primeiro resultado aqui
            String result = (String) storedProcedure.getResultList().get(0);

            return result; // Retorna a mensagem de sucesso ou erro da procedure
        } catch (Exception e) {
            // Trata possíveis erros
            e.printStackTrace();
            return "Falha ao realizar login: " + e.getMessage();
        }
    }
}
