package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DAOUsuarioRepository {

	private Connection connection;

	public DAOUsuarioRepository() {
		connection = SingleConnectionBanco.getConnection();

	}

	public ModelLogin gravarUsuario(ModelLogin modelLogin, Long userLogado) throws SQLException {

		if (modelLogin.eNovo()) {

			String sql = "INSERT INTO model_login(login, senha, nome, email, perfil, sexo, usuario_id) VALUES (?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, modelLogin.getLogin());
			preparedStatement.setString(2, modelLogin.getSenha());
			preparedStatement.setString(3, modelLogin.getNome());
			preparedStatement.setString(4, modelLogin.getEmail());
			preparedStatement.setString(5, modelLogin.getPerfil());
			preparedStatement.setString(6, modelLogin.getSexo());
			preparedStatement.setLong(7, userLogado);

			preparedStatement.execute();
			connection.commit();

		} else {

			String sql = "UPDATE model_login SET login=?, senha=?, nome=?, email=?, perfil=?, sexo=? WHERE id = '" + modelLogin.getId()
					+ "'";

			PreparedStatement preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, modelLogin.getLogin());
			preparedStatement.setString(2, modelLogin.getSenha());
			preparedStatement.setString(3, modelLogin.getNome());
			preparedStatement.setString(4, modelLogin.getEmail());
			preparedStatement.setString(5, modelLogin.getPerfil());
			preparedStatement.setString(6, modelLogin.getSexo());

			preparedStatement.executeUpdate();
			connection.commit();

		}

		return this.consultarUsuario(modelLogin.getLogin(), userLogado);
	}

	public List<ModelLogin> consultaUsuarioList(Long userLogado) throws SQLException {

		List<ModelLogin> listModelLogin = new ArrayList<ModelLogin>();

		String sql = "select * from model_login where useradmin = false and usuario_id = " + userLogado;

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		ResultSet resultado = preparedStatement.executeQuery();

		while (resultado.next()) {

			ModelLogin modelLogin = new ModelLogin();

			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setPerfil(resultado.getString("perfil"));
			modelLogin.setSexo(resultado.getString("sexo"));
			// modelLogin.setSenha(resultado.getString("senha"));

			listModelLogin.add(modelLogin);
		}

		return listModelLogin;
	}

	public List<ModelLogin> consultaUsuarioList(String nome, Long userLogado) throws SQLException {

		List<ModelLogin> listModelLogin = new ArrayList<ModelLogin>();

		String sql = "select * from model_login where upper(nome) like upper(?) and useradmin = false and usuario_id = ?";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, "%" + nome + "%");
		preparedStatement.setLong(2, userLogado);

		ResultSet resultado = preparedStatement.executeQuery();

		while (resultado.next()) {

			ModelLogin modelLogin = new ModelLogin();

			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setPerfil(resultado.getString("perfil"));
			modelLogin.setSexo(resultado.getString("sexo"));
			// modelLogin.setSenha(resultado.getString("senha"));

			listModelLogin.add(modelLogin);
		}

		return listModelLogin;
	}

	public ModelLogin consultarUsuario(String login, Long userLogado) throws SQLException {

		ModelLogin modelLogin = new ModelLogin();

		String sql = "select * from model_login where upper(login) = upper('" + login
				+ "') and useradmin = false and usuario_id = " + userLogado;

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		ResultSet resultado = preparedStatement.executeQuery();

		while (resultado.next()) {

			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setPerfil(resultado.getString("perfil"));
			modelLogin.setSexo(resultado.getString("sexo"));

		}

		return modelLogin;
	}
	
	public ModelLogin consultarUsuarioLogado(String login) throws SQLException {

		ModelLogin modelLogin = new ModelLogin();

		String sql = "select * from model_login where upper(login) = upper('" + login + "')";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		ResultSet resultado = preparedStatement.executeQuery();

		while (resultado.next()) {

			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setPerfil(resultado.getString("perfil"));
			modelLogin.setSexo(resultado.getString("sexo"));
			modelLogin.setUseradmin(resultado.getBoolean("useradmin"));

		}

		return modelLogin;
	}

	public ModelLogin consultarUsuario(String login) throws SQLException {

		ModelLogin modelLogin = new ModelLogin();

		String sql = "select * from model_login where upper(login) = upper('" + login + "') and useradmin = false";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		ResultSet resultado = preparedStatement.executeQuery();

		while (resultado.next()) {

			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setSexo(resultado.getString("sexo"));
			modelLogin.setPerfil(resultado.getString("perfil"));
			

		}

		return modelLogin;
	}

	public ModelLogin consultarUsuarioID(String id, Long userLogado) throws SQLException {

		ModelLogin modelLogin = new ModelLogin();

		String sql = "select * from model_login where id = ? and useradmin = false and usuario_id = ?";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setLong(1, Long.parseLong(id));
		preparedStatement.setLong(2, userLogado);

		ResultSet resultado = preparedStatement.executeQuery();

		while (resultado.next()) {

			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setSexo(resultado.getString("sexo"));
			modelLogin.setPerfil(resultado.getString("perfil"));

		}

		return modelLogin;
	}

	public boolean validarLogin(String login) throws SQLException {

		String sql = "select count(1) > 0 as existe from model_login where upper(login) = upper('" + login + "')";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();

		resultSet.next();
		return resultSet.getBoolean("existe");

	}

	public void deletarUser(String idUser) throws SQLException {

		String sql = "DELETE FROM public.model_login WHERE id = ? and useradmin = false;";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setLong(1, Long.parseLong(idUser));
		preparedStatement.executeUpdate();

		connection.commit();

	}

}
