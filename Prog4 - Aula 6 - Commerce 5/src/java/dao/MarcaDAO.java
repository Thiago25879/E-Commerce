/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import modelo.Marca;

/**
 *
 * @author aluno
 */
public class MarcaDAO extends GenericDAO<Marca, Integer> {
    
    public MarcaDAO(){
        super(Marca.class);
    }
    
    public List<Marca> listar(String filtro) throws Exception{
        
        return em.createNamedQuery("Marca.findFilter").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    
}
