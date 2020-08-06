<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<header id="layout-header">
	<div class="clearfix container">
		<a href="/casadocodigo" id="logo"> </a>
		<div id="header-content">
			<nav id="main-nav">
				<ul class="clearfix">
					<security:authorize access="hasRole('ROLE_ADMIN')">
						<li><a href="${s:mvcUrl('PC#listar').build() }" rel="nofollow">Produtos</a></li>
						<li><a href="${s:mvcUrl('PC#form').build() }" rel="nofollow">Cadastro</a></li>
					</security:authorize>
					<li>
						<a href="${s:mvcUrl('CC#itens').build() }" rel="nofollow">
							<fmt:message key="menu.carrinho">
								<fmt:param value="${carrinho.quantidade }" />
							</fmt:message>
						</a>
					</li>
					<li>
						<a href="/pages/sobre-a-casa-do-codigo" rel="nofollow">
							<fmt:message key="menu.sobre" />
						</a>
					</li>
					<li>
						<a href="?locale=pt" rel="nofollow">
							<fmt:message key="menu.pt" />
						</a>
					</li>
					<li>
						<a href="?locale=en_US" rel="nofollow">
							<fmt:message key="menu.en" />
						</a>
					</li>
					<li><a href="${s:mvcUrl('LC#formLogin').build() }" rel="nofollow">Login</a></li>
				</ul>
			</nav>
		</div>
	</div>
</header>