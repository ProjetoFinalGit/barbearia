/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import factory.ConexaoFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Vitor
 */
public class ServicoDAO {
    public boolean gravarServico(Servico servico) throws SQLException{
        Connection conexao = ConexaoFactory.conectar();
        
        if(servico.getIdServico()==0){
            String sql = "INSERT INTO servico(nome,descricao,preco,duracao) VALUES (?,?,?,?)";
            PreparedStatement ps= conexao.prepareStatement(sql);
            ps.setString(1, servico.getNome());
            ps.setString(2, servico.getDescricao());
            ps.setInt(4, servico.getDuracao());
            ps.setDouble(3, servico.getPreco());
            ps.execute();
            conexao.close();
            
        }if(servico.getIdServico()>0){
            String sql= "UPDATE servico SET nome=?,descricao=?,preco=?,duracao=? WHERE idServico=?";
            PreparedStatement ps= conexao.prepareStatement(sql);
            ps.setString(1, servico.getNome());
            ps.setString(2, servico.getDescricao());
            ps.setDouble(3, servico.getPreco());
            ps.setDouble(4, servico.getPreco());
            ps.setInt(5, servico.getIdServico());
            ps.execute();
            conexao.close();
        }
        return true;
    }
    
    public ArrayList<Servico> servicos() throws SQLException{
        ArrayList<Servico> servicos= new ArrayList();
       
        
            Connection conexao = ConexaoFactory.conectar();
            String sql= "SELECT idServico, nome, descricao, preco,duracao FROM servico";
            PreparedStatement ps = conexao.prepareStatement(sql);
            ResultSet lista = ps.executeQuery();
            
        while(lista.next()){
            Servico servico = new Servico();
            servico.setIdServico(lista.getInt("idServico"));
            servico.setDescricao(lista.getString("descricao"));
            servico.setDuracao(lista.getInt("duracao"));
            servico.setPreco(lista.getDouble("preco"));
            servico.setNome(lista.getString("nome"));
            servicos.add(servico);
        }
        
        conexao.close();
        return servicos;
    }
    
    public boolean deletarServico(int idServico) throws SQLException{
        Connection conexao = ConexaoFactory.conectar();
        String sql = "DELETE FROM servico WHERE idServico =?";
        PreparedStatement ps= conexao.prepareStatement(sql);
        ps.setInt(1, idServico);
        ps.execute();
        conexao.close();
        
       return true; 
       
    }
    
    public Servico carregarServicoPorId(int idServico) throws SQLException{
        Servico servico= new Servico();
        Connection conexao= ConexaoFactory.conectar();
        String sql = "SELECT idServico, nome, descricao, preco,duracao FROM servico WHERE idServico=?";
        PreparedStatement ps = conexao.prepareStatement(sql);
        ps.setInt(1, idServico);
        ResultSet lista= ps.executeQuery();
        
        if(lista.next()){
            servico.setIdServico(lista.getInt("idServico"));
            servico.setNome(lista.getString("nome"));
            servico.setDescricao(lista.getString("descricao"));
            servico.setDuracao(lista.getInt("duracao"));
            servico.setPreco(lista.getDouble("preco"));
            
           
        }
        
        conexao.close();
        return servico;
        
    }
}
