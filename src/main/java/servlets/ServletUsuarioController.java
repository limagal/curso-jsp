package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.fasterxml.jackson.databind.ObjectMapper;

import dao.DAOUsuarioRepository;
import model.ModelLogin;
import servlets.ServletLogin.WebServlet;


@MultipartConfig
@WebServlet(urlPatterns = {"/ServletUsuarioController"})
public class ServletUsuarioController extends ServletGenericUtil {
	
	public @interface WebServlet {

		String[] urlPatterns();

	}

	private static final long serialVersionUID = 1L;

	DAOUsuarioRepository daoUsuarioRepository = new DAOUsuarioRepository();

	public ServletUsuarioController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String acao = request.getParameter("acao");

			if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletar")) {

				String idUser = request.getParameter("id");

				daoUsuarioRepository.deletarUser(idUser);
				
				List<ModelLogin> modelLogins = daoUsuarioRepository.consultaUsuarioList(super.getUserLogado(request));
				request.setAttribute("modelLogins", modelLogins);

				request.setAttribute("msg", "Cadastro excluido com sucesso!");
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("deletarajax")) {

				String idUser = request.getParameter("id");

				daoUsuarioRepository.deletarUser(idUser);

				response.getWriter().write("Cadastro excluido com sucesso!");

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarUserAjax")) {

				String nomeBusca = request.getParameter("nomeBusca");

				List<ModelLogin> listDadosJsonUser = daoUsuarioRepository.consultaUsuarioList(nomeBusca, super.getUserLogado(request));

				ObjectMapper objectMapper = new ObjectMapper();

				String json = objectMapper.writeValueAsString(listDadosJsonUser);

				response.getWriter().write(json);

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("buscarEditar")) {

				String id = request.getParameter("id");

				ModelLogin modelLogin = daoUsuarioRepository.consultarUsuarioID(id, super.getUserLogado(request));

				List<ModelLogin> modelLogins = daoUsuarioRepository.consultaUsuarioList(super.getUserLogado(request));
				
				request.setAttribute("modelLogins", modelLogins);
				request.setAttribute("msg", "Usuário em edição.");
				request.setAttribute("modelLogin", modelLogin);
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);

			} else if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("listarUser")) {
				
				List<ModelLogin> modelLogins = daoUsuarioRepository.consultaUsuarioList(super.getUserLogado(request));
				
				request.setAttribute("msg", "Usuários carregados.");
				request.setAttribute("modelLogins", modelLogins);
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);

			} else {
				request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);
				List<ModelLogin> modelLogins = daoUsuarioRepository.consultaUsuarioList(super.getUserLogado(request));
				request.setAttribute("modelLogins", modelLogins);
			}

		} catch (SQLException e) {
			e.printStackTrace();

			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}

	}

		
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String id = request.getParameter("id");
			String nome = request.getParameter("nome");
			String login = request.getParameter("login");
			String email = request.getParameter("email");
			String senha = request.getParameter("senha");
            String perfil = request.getParameter("perfil");
            String sexo = request.getParameter("sexo");
			ModelLogin modelLogin = new ModelLogin();

			modelLogin.setId(id != null && !id.isEmpty() ? Long.parseLong(id) : null);
			modelLogin.setNome(nome);
			modelLogin.setLogin(login);
			modelLogin.setEmail(email);
			modelLogin.setSenha(senha);
			modelLogin.setPerfil(perfil);
			modelLogin.setSexo(sexo);
												
			
			if (ServletFileUpload.isMultipartContent(request)) {
				
			//	Part part = request.getPart("filefoto"); /* pega a foto da tela */
			//	byte[] foto = IOUtils.toByteArray(part.getInputStream()); /* Converte imagem para byte */
			//	new Base64();
			//	String imagemBase64 = Base64.encodeBase64String(foto);
				System.out.println("passando aqui...");
			//	System.out.println(imagemBase64);
			}
			

			String msg = "Operação realizada com sucesso!";

			if (daoUsuarioRepository.validarLogin(modelLogin.getLogin()) && modelLogin.getId() == null) {
				msg = "Este login já está em uso. Entre com outro.";
			} else {

				if (modelLogin.eNovo()) {
					msg = "Salvo com sucesso!";
				} else {
					msg = "Atualizado com sucesso!";
				}
				modelLogin = daoUsuarioRepository.gravarUsuario(modelLogin, super.getUserLogado(request));
			}
			List<ModelLogin> modelLogins = daoUsuarioRepository.consultaUsuarioList(super.getUserLogado(request));
			request.setAttribute("modelLogins", modelLogins);
			request.setAttribute("msg", msg);
			request.setAttribute("modelLogin", modelLogin);
			request.getRequestDispatcher("principal/usuario.jsp").forward(request, response);

		} catch (SQLException e) {
			e.printStackTrace();

			RequestDispatcher redirecionar = request.getRequestDispatcher("erro.jsp");
			request.setAttribute("msg", e.getMessage());
			redirecionar.forward(request, response);
		}

	}
}
