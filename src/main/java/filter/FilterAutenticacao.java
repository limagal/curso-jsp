package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import connection.SingleConnectionBanco;

@WebFilter(urlPatterns = { "/principal/*" }) // Intercepta todas as requisições que vieram do projeto.
public class FilterAutenticacao extends HttpFilter implements Filter {

	private static final long serialVersionUID = 1L;
	
	private static Connection connection;

	public FilterAutenticacao() {

	}

	public void destroy() { // Encerrar os processos quando o servidor é parado. Ex: encerra conexão com o
							// banco.
		try {
			connection.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		try {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();

			String usuarioLogado = (String) session.getAttribute("usuario");

			String urlParaAutenticar = req.getServletPath(); // URL que está sendo acessada

			if (usuarioLogado == null && !urlParaAutenticar.equalsIgnoreCase("/principal/ServletLogin")) {

				RequestDispatcher redireciona = request.getRequestDispatcher("/index.jsp?url=" + urlParaAutenticar);
				request.setAttribute("msg", "Por favor, realize o login 2");
				redireciona.forward(request, response);
				return; // Para a execução e redireciona para o login.

			} else {
				chain.doFilter(request, response);
			}
			
			connection.commit();

		} catch (Exception e) {
			e.printStackTrace();
			
			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage() );
			redirecionar.forward(request, response);
			
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}

	}

	// Inicia os precessos e recursos quando o servidor subir o projeto. Ex: iniciar
	// o conexão com o banco.
	public void init(FilterConfig fConfig) throws ServletException {
		connection = SingleConnectionBanco.getConnection();
	}

}
