<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Livros</title>

<c:url value="/resources/css" var="cssPath" />
<link rel="stylesheet" href="${cssPath }/bootstrap.min.css" >
<link rel="stylesheet" href="${cssPath }/bootstrap-theme.min.css" >

</head>
<body>

	<nav class="navbar navbar-inverse">
	    <div class="container">
	        <div class="navbar-header">
	            <button type="button" class="navbar-toggle collapsed" 
	                data-toggle="collapse" 
	                    data-target="#bs-example-navbar-collapse-1" 
	                        aria-expanded="false">
	                <span class="sr-only">Toggle navigation</span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	            </button>
	            <a class="navbar-brand" href="${s:mvcUrl('HC#index').build()}">
	                Casa do Código
	            </a>
	        </div>
	        <div class="collapse navbar-collapse" 
	                id="bs-example-navbar-collapse-1">
	            <ul class="nav navbar-nav">
	                <li class="nav-item">
	                    <a href="${s:mvcUrl('PC#listar').build()}">
	                        Lista de Produtos
	                    </a>
	                </li>
	                <li class="nav-item">
	                    <a href="${s:mvcUrl('PC#form').build()}">
	                        Cadastro de Produtos
	                    </a>
	                </li>
	            </ul>
	            <ul class="nav nav-bar navbar-right">
	            	<li class="nav-item">
	            		<a href="#">
	            			<security:authentication property="principal" var="usuario"/>
	            				Usuário: ${usuario.nome }
	            		</a>
	            	</li>
	            	<li class="nav-item">
				    	<a href="<c:url value="/logout" />">Sair</a></span>
				 	</li>	            
	            </ul>
	        </div><!-- /.navbar-collapse -->
	    </div>
	</nav>

	<div class="container">
		<h1>Lista de livros</h1>
		
		<div><h2>${sucesso }</h2> </div>
		
		<table class="table table-bordered table-striped table-hover">
			<tr>
				<th>Título</th>
				<th>Descrição</th>
				<th>Preço</th>
				<th>Páginas</th>
				<th>Data de Lançamento</th>
			</tr>
			<c:forEach items="${produtos }" var="produto">
				<tr>
					<td>
						<a href="${s:mvcUrl('PC#detalhe').arg(0,produto.id).build()}">${produto.titulo }</a>
					</td>
					<td>${produto.descricao }</td>
					<td>${produto.precos }</td>
					<td>${produto.paginas }</td>
					<td><fmt:formatDate pattern="dd/MM/yyyy" value="${produto.dataLancamento }"/></td>
				</tr>
			</c:forEach>
	</table>
	</div>
</body>
</html>