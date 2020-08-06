<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="Casa do Código">
	<jsp:body>
		<section id="index-section" class="container middle">
			<ul class="clearfix book-collection">
				<c:forEach items="${produtos }" var="produto" >
					<li>
						<a href="${s:mvcUrl('PC#detalhe').arg(0, produto.id).build() }" class="block clearfix">
						<h2 class="product-title">${produto.titulo }</h2> 
						<img width="143" height="202" src="https://cdn.shopify.com/s/files/1/0155/7645/products/java8-featured_large.png?v=1411490181" alt="Java 8 Prático" title="Java 8 Prático" /> 
						<small class="buy-button">Compre</small>
						</a>
					</li>
				</c:forEach>
			</ul>
		</section>
	</jsp:body>
</tags:pageTemplate>