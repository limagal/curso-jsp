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
												<h4 class="sub-title">Cad. Telefone</h4>	

													<form class="form-material"
														action="<%=request.getContextPath()%>/ServletTelefone"
														method="post" id="formFone">
														<div class="form-group form-default form-static-label">
															<input type="text" name="id" id="id" class="form-control"
																readonly="readonly" value="${modelLogin.id}"> <span
																class="form-bar"></span> <label class="float-label">ID
																User:</label>
														</div>
														<div class="form-group form-default form-static-label">
															<input readonly="readonly" type="text" name="nome" id="nome"
																class="form-control" required="required"
																value="${modelLogin.nome}"> <span
																class="form-bar"></span> <label class="float-label">Nome:</label>
														</div>
														<div class="form-group form-default form-static-label">
															<input  type="text" name="numero" id="numero"
																class="form-control" required="required">
																<span class="form-bar"></span> <label class="float-label">N&uacute;mero:</label>
														</div>
														<button  class="btn btn-success waves-effect waves-light">Salvar</button>
													</form>
													<div class="card-block"></div>
												</div>
											</div>
										</div>
									</div>
									<span id="msg">${msg}</span>
									
									<div style="height: 300px; overflow: scroll;">
											<table class="table" id="tabelaresultadosview">
												<thead>
													<tr>
														<th scope="col">ID</th>
														<th scope="col">N&uacute;mero</th>
														<th scope="col">Excluir</th>
													</tr>
												</thead>
												<tbody>
												
												<c:forEach items='${modelTelefones}' var='f'>
												
												<tr>
												<td><c:out value="${f.id}"></c:out></td>
												<td><c:out value="${f.numero}"></c:out></td>
												<td><a class="btn btn-success" href="<%=request.getContextPath() %>/ServletTelefone?acao=excluir&id=${f.id}&userpai=${modelLogin.id}">Excluir</a></td>
												<!-- <td><a class="btn btn-danger" href="javascript:del(${f.id});">Excluir</a></td>  -->
												</tr>
												
												</c:forEach>

												</tbody>
											</table>
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

	$("#numero").keypress(function (event){
	return /\d/.test(String.fromCharCode(event.keyCode));
});

</script>	
</body>
</html>
