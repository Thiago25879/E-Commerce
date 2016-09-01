/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import modelo.Status;

/**
 *
 * @author aluno
 */
public class StatusDAO extends GenericDAO<Status, Integer> {
    
    public StatusDAO(){
        super(Status.class);
    }
    
    public List<Status> listar(String filtro) throws Exception{
        
        return em.createNamedQuery("Status.findFilter").setParameter("filtro", "%" + filtro + "%").getResultList();
    }
    
}
