<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Tela de erros</title>
</head>
<body>
<h3>Mesagem de erro. Entre em contato com a equipe de suporte do sistema.</h3>
<%
out.print(request.getAttribute("msg"));
%>
</body>
</html>