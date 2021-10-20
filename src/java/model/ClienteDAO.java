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
public class ClienteDAO {
    public boolean gravarCliente(Cliente cliente){
        return true;
    }
    
    public ArrayList<Cliente> clientes(){
        ArrayList<Cliente> clientes= new ArrayList();
        
        
        return clientes;
    }
    
    public boolean deletarCliente(int idCliente){
        return true;
    }
    
    public Cliente carregarClientePorId(int idCliente){
        Cliente cliente= new Cliente();
        
        return cliente;
    }
}
