<%@page import="model.ModelLogin"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"></jsp:include>
<body>
	<jsp:include page="theme-loader.jsp"></jsp:include>
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">
			<!-- navbar -->
			<jsp:include page="navbar.jsp"></jsp:include>
			<!--<jsp:include page="theme-loader.jsp"></jsp:include>
			<!-- navbar -->
			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">
					<!-- navbarmymenu -->
					<jsp:include page="navbarmainmenu.jsp"></jsp:include>
					<!-- navbarmymenu -->
					<div class="pcoded-content">
						<!-- Page-header start -->
						<jsp:include page="page-header.jsp"></jsp:include>
						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">

										<!-- task, page, download counter  start -->
										<h4>Cadastro de usu&aacute;rio</h4>
										<div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">
													<div class="card-block">
														<form class="form-material" enctype="multiform/form-data"
															action="<%=request.getContextPath()%>/ServletUsuarioController"
															method="post" id="form-user">

															<input type="hidden" name="acao" id="acao" value="">

															<div class="form-group form-default">
																<input type="text" name="id" id="id"
																	class="form-control" readonly="readonly"
																	value="${modelLogin.id}">
																<!--  	<span class="form-bar"></span> <label class="float-label">ID</label> -->
															</div>

															<div class="form-group form-default input-group mb-4">
																<div class="input-group-prepend">
																	<img alt="Imagem user" id="fotoembase64" src="" width="60" height="60">
																</div>
																<input type="file" id="filefoto" name="filefoto"
																	onchange="visualizarImg('fotoembase64','filefoto')"
																	accept="image/*" class="form-control"
																	style="margin-top: 15px; margin-left: 5px">
															</div>

															<div class="form-group form-default">
																<input type="text" name="nome" id="nome"
																	class="form-control" required="required"
																	value="${modelLogin.nome}"> <span
																	class="form-bar"></span> <label class="float-label">Nome</label>
															</div>
															<div class="form-group form-default">
																<input type="text" name="login" id="login"
																	class="form-control" required="required"
																	value="${modelLogin.login}"> <span
																	class="form-bar"></span> <label class="float-label">Login</label>
															</div>
															<div class="form-group form-default">
																<input type="email" name="email" id="email"
																	class="form-control" required="required"
																	autocomplete="off" value="${modelLogin.email}">
																<span class="form-bar"></span> <label
																	class="float-label">Email (exemplo@gmail.com)</label>
															</div>
															<div class="form-group form-default form-static-label">
																<select class="form-control"
																	aria-label="Default select exemple" name="perfil">
																	<option disabled="disabled">[Selecione o
																		perfil]</option>

																	<option value="ADMIN"
																		<%ModelLogin modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getPerfil().equals("ADMIN")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>Administrador</option>

																	<option value="SECRETARIA"
																		<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getPerfil().equals("SECRETARIA")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>Secretária</option>

																	<option value="AUXILIAR"
																		<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getPerfil().equals("AUXILIAR")) {
	out.print(" ");
	out.print("selected=\"selected\"");
	out.print(" ");
}%>>Auxiliar</option>
																</select> <span class="form-bar"></span> <label
																	class="float-label">Perfil</label>
															</div>
															<div class="form-group form-default">
																<input type="password" name="senha" id="senha"
																	class="form-control" required="required"
																	autocomplete="off" value="${modelLogin.senha}">
																<span class="form-bar"></span> <label
																	class="float-label">Senha</label>
															</div>
															<div class="form-group form-default">
																<input type="radio" name="sexo" value="MASCULINO"
																	checked="checked"
																	<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getSexo().equals("MASCULINO")) {
	out.print(" ");
	out.print("checked=\"checked\"");
	out.print(" ");
}%>>Masculino</>

																<input type="radio" name="sexo" value="FEMENINO"
																	<%modelLogin = (ModelLogin) request.getAttribute("modelLogin");

if (modelLogin != null && modelLogin.getSexo().equals("FEMENINO")) {
	out.print(" ");
	out.print("checked=\"checked\"");
	out.print(" ");
}%>>Femenino</>

															</div>

															<div class="col-12">
																<button type="button"
																	class="btn btn-primary waves-effect waves-light"
																	onclick="limparForm();">Novo</button>
																<button class="btn btn-primary waves-effect waves-light">Salvar</button>
																<button type="button"
																	class="btn btn-primary waves-effect waves-light"
																	onclick="criarDeleteComAjax();">Excluir</button>
																<button type="button" class="btn btn-success"
																	data-toggle="modal" data-target="#exampleModalUsuario">Pesquisar</button>
															</div>
														</form>
														<!--  project and team member end -->
													</div>
												</div>
											</div>
										</div>
									</div>
									<h6 id="msg" class="msg">${msg}</h6>

									<div style="height: 300px; overflow: scroll;">
										<table class="table" id="tabelaResultadoswiew">
											<thead>
												<tr>
													<th scope="col">identificador</th>
													<th scope="col">Nome</th>
													<th scope="col">Ver</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items='${modelLogins}' var='ml'>

													<tr>
														<td><c:out value="${ml.id}"></c:out></td>
														<td><c:out value="${ml.nome}"></c:out></td>
														<td><a class="btn btn-success"
															href="<%=request.getContextPath()%>/ServletUsuarioController?acao=buscarEditar&id=${ml.id}">Ver</a></td>
														<td><a class="btn btn-success" id="removeUserList"
															onclick="deleteUserListar()"
															href="<%=request.getContextPath()%>/ServletUsuarioController?acao=deletar&id=${ml.id}">Remover</a></td>
													</tr>

												</c:forEach>
											</tbody>
										</table>
									</div>
									<!-- Page-body end -->
								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="javascriptfile.jsp"></jsp:include>
	<!-- Modal -->
	<div class="modal fade" id="exampleModalUsuario" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Pesquisa de
						Usu&aacute;rio</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="input-group mb-3">
						<input type="text" class="form-control"
							placeholder="Entre com o nome..."
							aria-label="Recipient's username" id="nomeBusca"
							aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary"
								onclick="buscarUsuario();" type="button">Buscar</button>
						</div>
					</div>
				</div>
				<div style="height: 300px; overflow: scroll;">
					<table class="table" id="tabelaResultados">
						<thead>
							<tr>
								<th scope="col">Identificador</th>
								<th scope="col">Nome</th>
								<th scope="col">Ver</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
				<span id="totalResultados"></span>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	
	function visualizarImg(fotoembase64,filefoto) {
	
		var preview = document.getElementById(fotoembase64); // campo img do html
		var fileUser = document.getElementById(filefoto).files[0];
		var reader = new FileReader();
		
		reader.onloadend = function(){
		 preview.src = reader.result; /* carrega a foto na tela */
			};
			
			if (fileUser) {
				
				reader.readAsDataURL(fileUser);
			}else{

			preview.src = '';	
		}
	  }
		function verEditar(id) {

			var urlAction = document.getElementById('form-user').action;

			window.location.href = urlAction + '?acao=buscarEditar&id=' + id;

		}

		function buscarUsuario() {

			var nomeBusca = document.getElementById('nomeBusca').value;

			if (nomeBusca != null && nomeBusca != '' && nomeBusca.trim() != '') { /*Validando que tem que ter valor pra buscar no banco*/

				var urlAction = document.getElementById('form-user').action;

				$
						.ajax(
								{

									method : "get",
									url : urlAction,
									data : "nomeBusca=" + nomeBusca
											+ '&acao=buscarUserAjax',
									success : function(response) {

										var json = JSON.parse(response);

										$('#tabelaResultados > tbody > tr')
												.remove();

										for (var p = 0; p < json.length; p++) {

											$('#tabelaResultados > tbody')
													.append(
															'<tr> <td>'
																	+ json[p].id
																	+ '</td> <td>'
																	+ json[p].nome
																	+ '</td> <td><button onclick="verEditar('
																	+ json[p].id
																	+ ')" type="button" class="btn btn-info">Ver</button></td></tr>');

										}

										document
												.getElementById('totalResultados').textContent = 'Resultados: '
												+ json.length;

									}

								}).fail(
								function(xhr, status, errorThrown) {
									alert('Erro ao buscar usuario por nome: '
											+ xhr.responseText);
								});

			}

		}

		function criarDeleteComAjax() {

			if (confirm('Deseja realmente excluir os dados?')) {

				var urlAction = document.getElementById('form-user').action;
				var idUser = document.getElementById('id').value;

				$.ajax({

					method : "get",
					url : urlAction,
					data : "id=" + idUser + '&acao=deletarajax',
					success : function(response) {

						limparForm();
						document.getElementById('msg').textContent = response;
					}

				}).fail(
						function(xhr, status, errorThrown) {
							alert('Erro ao deletar usuario por id: '
									+ xhr.responseText);
						});

			}
		}

		function deleteUserListar(e) {

			if (confirm('Deseja excluir este item?')) {

				document.getElementById("removeUserList").method = 'get';
				document.getElementById("acao").value = 'deletar';
				document.getElementById("removeUserList").submit();

			} else {

				e.preventDefault();
			}
		}

		function criarDelete() {

			if (confirm('Deseja excluir o cadastro?')) {
				document.getElementById("form-user").method = 'get';
				document.getElementById("acao").value = 'deletar';
				document.getElementById("form-user").submit();
			}

		}

		function limparForm() {
			var elementos = document.getElementById("form-user").elements; //Retorna o elementos dentro do form
			for (p = 0; p < elementos.length; p++) {
				elementos[p].value = "";
			}
		}
	</script>
</body>

</html>
