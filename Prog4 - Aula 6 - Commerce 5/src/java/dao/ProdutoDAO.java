/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import modelo.Produto;

/**
 *
 * @author aluno
 */
public class ProdutoDAO extends GenericDAO<Produto, Integer> {
    
    public ProdutoDAO(){
        super(Produto.class);
    }
    
    public List<Produto> listar(String filtro) throws Exception{
        
        return em.createNamedQuery("Produto.findFilter").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    
}
