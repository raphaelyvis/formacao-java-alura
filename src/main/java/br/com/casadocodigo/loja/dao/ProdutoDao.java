package br.com.casadocodigo.loja.dao;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.casadocodigo.loja.model.Produto;
import br.com.casadocodigo.loja.model.TipoPreco;

@Repository
@Transactional
public class ProdutoDao {

	@PersistenceContext
	private EntityManager manager;

	public void gravar(Produto produto) {
		manager.persist(produto);
	}

	public List<Produto> listar() {
		return manager.createQuery("select distinct(p) from Produto p"
				+ " join fetch p.precos"
				, Produto.class).getResultList();
	}

	public Produto find(Long id) {
		return manager.createQuery("select distinct (p) from Produto p "
				+ "join fetch p.precos precos where p.id = :id", Produto.class)
				.setParameter("id", id).getSingleResult();
	}
	
	public BigDecimal somaPrecosPorTipo(TipoPreco tipoPreco) {
		return manager.createQuery("select sum(preco.valor) from Produto p "
				+ "join p.precos preco where preco.tipo = :tipoPreco", BigDecimal.class)
				.setParameter("tipoPreco", tipoPreco).getSingleResult();
	}

}
