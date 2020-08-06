package br.com.casadocodigo.loja.controller;

import javax.servlet.Filter;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import br.com.casadocodigo.loja.conf.AppWebConfiguration;
import br.com.casadocodigo.loja.conf.DataSourceConfigurationTest;
import br.com.casadocodigo.loja.conf.JpaConfiguration;
import br.com.casadocodigo.loja.conf.SecurityConfiguration;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {JpaConfiguration.class, AppWebConfiguration.class
		, DataSourceConfigurationTest.class, SecurityConfiguration.class})
@ActiveProfiles("test")
public class ProdutoControllerTest {

	@Autowired
	private WebApplicationContext wac;
	
	@Autowired
	private Filter springSecurityFilterChain;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders
						.webAppContextSetup(wac)
						.addFilter(springSecurityFilterChain)
						.build();
	}
	
	@Test
	public void deveRetornarParaHomeComLivros() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/"))
				.andExpect(MockMvcResultMatchers.forwardedUrl("/WEB-INF/views/home.jsp"));
	}

	@Test
	public void somenteAdminDeveAcessarProdutosForm() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/produtos/form")
				.with(SecurityMockMvcRequestPostProcessors
						.user("user@casadocodigo.com.br")
						.password("123456")
						.roles("USER")))
		.andExpect(MockMvcResultMatchers.status().is(403));
	}
	
	@Test
	public void somenteAdminDeveAcessarProdutos() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/produtos")
				.with(SecurityMockMvcRequestPostProcessors
						.user("user@casadocodigo.com.br")
						.password("123456")
						.roles("USER")))
		.andExpect(MockMvcResultMatchers.status().is(403));
	}
}











