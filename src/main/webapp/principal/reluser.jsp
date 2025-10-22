<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

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
			<!-- 	<jsp:include page="theme-loader.jsp"></jsp:include>
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
										<div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">
													<div class="card-block">
														<h4 class="sub-title">Relatórios de Usu&aacute;rios</h4>

														<form class="form-material"
															action="<%=request.getContextPath()%>/ServletUsuarioController"
															method="get" id="formUser">

															<input type="hidden" id="acaoRelatorioImprimirTipo" name="acao"
																value="imprimirRelatorioUser">

															<div class="form-row align-items-center">
																<div class="col-auto">
																	<label class="sr-only" for="dataInicial">Data
																		Inicial</label> <input value="${dataInicial}" type="text"
																		class="form-control mb-2" id="dataInicial"
																		name="dataInicial" placeholder="Data inicial">
																</div>
																<div class="col-auto">
																	<label class="sr-only" for="dataFinal">Data
																		Final</label>
																	<div class="input-group mb-2">
																		<input value="${dataFinal}" type="text"
																			class="form-control" id="dataFinal" name="dataFinal"
																			placeholder="Data final">
																	</div>
																</div>
																<div class="col-auto">
																	<button type="button" onclick="ImprimirHTML();" class="btn btn-primary mb-2">Imprimir
																		relatório</button>
																	<button type="button" onclick="ImprimirPDF();" class="btn btn-primary mb-2">Imprimir
																		PDF</button>
																	<button type="button" onclick="ImprimirExcel();" class="btn btn-primary mb-2">Imprimir
																		Excel</button>	
																</div>
															</div>
													</div>

													</form>

													<div style="height: 300px; overflow: scroll;">
														<table class="table" id="tabelaresultadosview">
															<thead>
																<tr>
																	<th scope="col">ID</th>
																	<th scope="col">Nome</th>
																</tr>
															</thead>
															<tbody>

																<c:forEach items='${listaUser}' var='ml'>

																	<tr>
																		<td><c:out value="${ml.id}"></c:out></td>
																		<td><c:out value="${ml.nome}"></c:out></td>
																	</tr>
																	
																	<c:forEach items="${ml.telefones}" var="fone">
																	 	<tr>
																	 	<td/>
																	 	<td style="font-size:10px; color:blue">
																	 	<c:out value="${fone.numero}"></c:out>
																	 	</td>
																	 	</tr>	
																	 		
																		
																	</c:forEach>
																</c:forEach>

															</tbody>
														</table>
													</div>

												</div>
											</div>
										</div>
									</div>
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
	<!-- Warning Section Starts -->
	<!-- Older IE warning message -->
	<!--[if lt IE 10]>
    <div class="ie-warning">
        <h1>Warning!!</h1>
        <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
        <div class="iew-container">
            <ul class="iew-download">
                <li>
                    <a href="http://www.google.com/chrome/">
                        <img src="assets/images/browser/chrome.png" alt="Chrome">
                        <div>Chrome</div>
                    </a>
                </li>
                <li>
                    <a href="https://www.mozilla.org/en-US/firefox/new/">
                        <img src="assets/images/browser/firefox.png" alt="Firefox">
                        <div>Firefox</div>
                    </a>
                </li>
                <li>
                    <a href="http://www.opera.com">
                        <img src="assets/images/browser/opera.png" alt="Opera">
                        <div>Opera</div>
                    </a>
                </li>
                <li>
                    <a href="https://www.apple.com/safari/">
                        <img src="assets/images/browser/safari.png" alt="Safari">
                        <div>Safari</div>
                    </a>
                </li>
                <li>
                    <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                        <img src="assets/images/browser/ie.png" alt="">
                        <div>IE (9 & above)</div>
                    </a>
                </li>
            </ul>
        </div>
        <p>Sorry for the inconvenience!</p>
    </div>
    <![endif]-->
	<!-- Warning Section Ends -->
	<jsp:include page="javascriptfile.jsp"></jsp:include>

	<script type="text/javascript">
	
	function ImprimirHTML(){
		document.getElementById("acaoRelatorioImprimirTipo").value = 'imprimirRelatorioUser';
		$("#formUser").submit();
	}
	
	
	function ImprimirPDF(){
		document.getElementById("acaoRelatorioImprimirTipo").value = 'imprimirRelatorioPDF';
		$("#formUser").submit();
		return false;
	}
	
	function ImprimirExcel(){
		document.getElementById("acaoRelatorioImprimirTipo").value = 'imprimirRelatorioExcel';
		$("#formUser").submit();
		return false;
	}
	
		$(function() {

			$("#dataInicial")
					.datepicker(
							{
								dateFormat : 'dd/mm/yy',
								dayNames : [ 'Domingo', 'Segunda', 'Terça',
										'Quarta', 'Quinta', 'Sexta', 'Sábado' ],
								dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S',
										'S', 'D' ],
								dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua',
										'Qui', 'Sex', 'Sáb', 'Dom' ],
								monthNames : [ 'Janeiro', 'Fevereiro', 'Março',
										'Abril', 'Maio', 'Junho', 'Julho',
										'Agosto', 'Setembro', 'Outubro',
										'Novembro', 'Dezembro' ],
								monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr',
										'Mai', 'Jun', 'Jul', 'Ago', 'Set',
										'Out', 'Nov', 'Dez' ],
								nextText : 'Próximo',
								prevText : 'Anterior'
							});
		});

		$(function() {

			$("#dataFinal")
					.datepicker(
							{
								dateFormat : 'dd/mm/yy',
								dayNames : [ 'Domingo', 'Segunda', 'Terça',
										'Quarta', 'Quinta', 'Sexta', 'Sábado' ],
								dayNamesMin : [ 'D', 'S', 'T', 'Q', 'Q', 'S',
										'S', 'D' ],
								dayNamesShort : [ 'Dom', 'Seg', 'Ter', 'Qua',
										'Qui', 'Sex', 'Sáb', 'Dom' ],
								monthNames : [ 'Janeiro', 'Fevereiro', 'Março',
										'Abril', 'Maio', 'Junho', 'Julho',
										'Agosto', 'Setembro', 'Outubro',
										'Novembro', 'Dezembro' ],
								monthNamesShort : [ 'Jan', 'Fev', 'Mar', 'Abr',
										'Mai', 'Jun', 'Jul', 'Ago', 'Set',
										'Out', 'Nov', 'Dez' ],
								nextText : 'Próximo',
								prevText : 'Anterior'
							});
		});
	</script>

</body>

</html>
