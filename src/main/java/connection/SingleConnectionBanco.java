package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnectionBanco {

	//private static String DRIVER = "org.postgressql.Driver";
	private static String banco = "jdbc:postgresql://localhost:5432/curso-jsp2autoReconnect=true";
	private static String user = "postgres";
	private static String password = "yyz0910";
	private static Connection connection = null;

	public static Connection getConnection() {
		return connection;
	}

	static {
		conectar();
	}

	public SingleConnectionBanco() {
		conectar();
	}

	private static void conectar() {
		try {

			if (connection == null) {
				Class.forName("org.postgresql.Driver"); // carrega o drive de conexão do banco
				connection = DriverManager.getConnection(banco, user, password);
				connection.setAutoCommit(false); // para não efetuar operações no banco sem solicitar.
				System.out.println("Conectou");
			}

		} catch (Exception e) {
			e.printStackTrace(); // Mostrar qualquer erro no momento de conexão.
		}
	}

}
