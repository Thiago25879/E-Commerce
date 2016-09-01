/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import modelo.Categoria;

/**
 *
 * @author aluno
 */
public class CategoriaDAO extends GenericDAO<Categoria, Integer> {
    
    public CategoriaDAO(){
        super(Categoria.class);
    }
    
    public List<Categoria> listar(String filtro) throws Exception{
        
        return em.createNamedQuery("Categoria.findFilter").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    
}
