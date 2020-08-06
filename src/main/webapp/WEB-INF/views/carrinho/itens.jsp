<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate titulo="Itens do carrinho">

	<jsp:attribute name="extraScripts">
		<script>
			console.log("Finalização de compra de ${carrinho.quantidade} itens");
		</script>
	</jsp:attribute>
	
	<jsp:body>
		<section class="container middle">
			<h2 id="cart-title">Seu carrinho de compras</h2>
			<table id="cart-table">
				<colgroup>
					<col class="item-col" />
					<col class="item-price-col" />
					<col class="item-quantity-col" />
					<col class="line-price-col" />
					<col class="delete-col" />
				</colgroup>
				<thead>
					<tr>
						<th class="cart-img-col"></th>
						<th width="65%">Item</th>
						<th width="10%">Preço</th>
						<th width="10%">Quantidade</th>
						<th width="10%">Total</th>
						<th width="5%">Excluir</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${carrinho.itens }" var="item" >
						<tr>
							<td class="cart-img-col">
								<img src="http://cdn.shopify.com/s/files/1/0155/7645/products/css-eficiente-featured_large.png?v=1435245145"
									width="71px" height="100px" />
							</td>
							<td class="item-title">${item.produto.titulo }</td>
							<td class="numeric-cell">${item.preco }</td>
							<td class="quantity-input-cell">
									<input type="number" min="0" id="quantidade" name="quantidade" value="${carrinho.getQuantidade(item) }" />
							</td>
							<td class="numeric-cell">${carrinho.getTotal(item) }</td>
							<td class="remove-item">
								<form:form action="${s:mvcUrl('CC#remover').arg(0, item.produto.id).arg(1, item.tipoPreco).build() }" method="POST">
									<input type="image" src="resources/imagens/excluir.png" alt="Excluir" title="Excluir" />
								</form:form>	
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<form:form action="${s:mvcUrl('PC#finalizar').build() }" method="post">
								<input type="submit" class="checkout" name="checkout" value="Finalizar compra" />
							</form:form>
						</td>
						<td></td>
						<td class="numeric-cell">${carrinho.quantidade }</td>
						<td class="numeric-cell">${carrinho.total }</td>
						<td></td>
					</tr>
				</tfoot>
			</table>
	
		</section>
	</jsp:body>
</tags:pageTemplate>