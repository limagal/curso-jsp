package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnectionBanco;
//import jakarta.servlet.jsp.jstl.sql.Result;
import model.ModelTelefone;

public class DAOTelefoneRepository {

	private Connection connection;
	
	DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();

	public DAOTelefoneRepository() {

		connection = SingleConnectionBanco.getConnection();
	}

	public void gravaTelefone(ModelTelefone modelTelefone) throws Exception {

		String sql = "INSERT INTO telefone (numero, usuario_pai_id, usuario_cad_id)	VALUES (?, ?, ?)";

		PreparedStatement statement = connection.prepareStatement(sql);

		statement.setString(1, modelTelefone.getNumero());
		statement.setLong(2, modelTelefone.getUsuario_pai_fk().getId());
		statement.setLong(3, modelTelefone.getUsuario_cad_fk().getId());

		statement.execute();

		connection.commit();

	}

	public void deleteFone(Long id) throws Exception {

		String sql = "delete from telefone where id = ?";

		PreparedStatement statement = connection.prepareStatement(sql);

		statement.setLong(1, id);
		statement.executeUpdate();

		connection.commit();

	}
	
	public boolean existeFone(String fone, Long idUse) throws Exception {
		
		String sql = "select count(1) > 0 as existe from telefone where usuario_pai_id = ? and numero = ?";
		
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		
		preparedStatement.setLong(1, idUse);
		preparedStatement.setString(2,fone);
		
		ResultSet resultSet = preparedStatement.executeQuery();
		
		resultSet.next();
		
		return resultSet.getBoolean("existe");
		
		
	}
	
	public List<ModelTelefone> listFone(Long idUserPai) throws Exception{
		
		List<ModelTelefone> retorno = new ArrayList<ModelTelefone>();
		
		String sql = "select * from telefone where usuario_pai_id = ?";
		
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		
		preparedStatement.setLong(1, idUserPai);
		
		ResultSet rs = preparedStatement.executeQuery();
		
		while(rs.next()) {
		
			ModelTelefone modelTelefone = new ModelTelefone();
			
			modelTelefone.setId(rs.getLong("id"));
			modelTelefone.setNumero(rs.getString("numero"));
			modelTelefone.setUsuario_pai_fk(daoUsuarioRepository.consultaUsuarioID(rs.getLong("usuario_pai_id")));
			modelTelefone.setUsuario_cad_fk(daoUsuarioRepository.consultaUsuarioID(rs.getLong("usuario_cad_id")));
			
			retorno.add(modelTelefone);
		}
		
		return retorno;
		
		
	}
	
	

}
