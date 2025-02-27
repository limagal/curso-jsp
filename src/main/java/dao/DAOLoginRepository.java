package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DAOLoginRepository {

	private Connection connection;

	public DAOLoginRepository() {
		connection = SingleConnectionBanco.getConnection();

	}

	public boolean validarAutenticacao(ModelLogin modellogin) throws SQLException {

		String sql = "select login, senha from model_login where login = ? and senha = ? ";

		PreparedStatement statement = connection.prepareStatement(sql);

		statement.setString(1, modellogin.getLogin());
		statement.setString(2, modellogin.getSenha());

		ResultSet resultSet = statement.executeQuery();

		if (resultSet.next()) {
			return true; // autenticado.
		}

		return false; // não autenticado.

	}

}
