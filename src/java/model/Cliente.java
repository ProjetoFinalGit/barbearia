/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Vitor
 */
class Cliente {
    private int idCliente;
    private String nome;
    private String cpf;
    private String endereco;
    private String telefone;
    private Date dataNascimento;
    
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
