<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Curso JSP</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<style type="text/css">
form {
	position: absolute;
	top: 30%;
	left: 35%;
	right: 35%;
}

.msg {
color: #084298;
background-color: #cfe2ff;
border-color: #b6d4fe;
}
</style>
</head>
<body>

	<form action="<%=request.getContextPath()%>/ServletLogin" method="post"
		class="row g-3 needs-validation" novalidate>
		
		<input type="hidden" value="<%=request.getParameter("url")%>"
			name="url">
		<legend><h4>Bem vindo ao Sistema Linus 1.0 </h4></legend>
         
		<div class="col-md-6">
			<label for="inputEmail4" class="form-label">Login:</label> 
			<input type="text" class="form-control" id="inputEmail4" name="login" required>
		<!--  	<div class="valid-feedback">Ok!</div> -->
			<div class="invalid-feedback">Entre com o login!</div>
			<label for="inputPassword4" class="form-label">Senha:</label> 
			<input type="password" class="form-control" id="inputPassword4" name="senha" required>
		<!--  	<div class="valid-feedback">Ok!</div> -->
			<div class="invalid-feedback">Entre com a senha!</div>
		</div>
		<div class="col-12">
			<button type="submit" class="btn btn-primary">Acessar</button>
		</div>
       
		<!-- <label>Login:</label>
		 <input name="login" type="text"> 
		 <label>Senha:</label>
		<input name="senha" type="password">
		 <input type="submit"value="Enviar"> -->

    
		<h6 class="msg">${msg}</h6>
	</form>
	<script
		 src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		 integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous">
	</script>
	<script type="text/javascript">
	(() => {
		  'use strict'

		  // Fetch all the forms we want to apply custom Bootstrap validation styles to
		  const forms = document.querySelectorAll('.needs-validation')

		  // Loop over them and prevent submission
		  Array.from(forms).forEach(form => {
		    form.addEventListener('submit', event => {
		      if (!form.checkValidity()) {
		        event.preventDefault()
		        event.stopPropagation()
		      }

		      form.classList.add('was-validated')
		    }, false)
		  })
		})()
	
	</script>
</body>
</html>