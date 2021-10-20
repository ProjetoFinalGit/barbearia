/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Vitor
 */
public class ServicoDAO {
    public boolean gravarServico(Servico servico){
        return true;
    }
    
    public ArrayList<Servico> servicos(){
        ArrayList<Servico> servicos= new ArrayList();
        
        
        return servicos;
    }
    
    public boolean deletarServico(int idServico){
       return true; 
       
    }
    
    public Servico carregarServicoPorId(int idServico){
        Servico servico= new Servico();
        
        return servico;
        
    }
}
