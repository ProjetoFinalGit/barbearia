/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import factory.ConexaoFactory;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Vitor
 */
public class AgendamentoDAO {
    public boolean gravarAgendamento(Agendamento agendamento) throws SQLException{
        Connection conexao = ConexaoFactory.conectar();
        PreparedStatement gravar;
        
        if(agendamento.getIdAgendamento()==0){
            String sql="INSERT INTO agendamento(dataAgendamento,valorTotal,status,idUsuario,idAtendente) VALUES (?,?,?,?,?)";
            gravar=conexao.prepareStatement(sql);
            gravar.setDate(1, (Date) agendamento.getDataAgendamento());
            gravar.setDouble(2, agendamento.getValor());
            gravar.setInt(3, agendamento.getStatus());
            gravar.setInt(4, agendamento.getUsuario().getIdUsuario());
            gravar.setInt(5, agendamento.getAtendente());
            gravar.execute();
            
            conexao.close();
            return true;
        }else{
            String sql="INSERT INTO agendamento(dataAgendamento,valorTotal,status,idUsuario,idAtendente) VALUES (?,?,?,?,?,?)";
            gravar=conexao.prepareStatement(sql);
            gravar.setInt(1, agendamento.getIdAgendamento());
            gravar.setDate(2, (Date) agendamento.getDataAgendamento());
            gravar.setDouble(3, agendamento.getValor());
            gravar.setInt(4, agendamento.getStatus());
            gravar.setInt(5, agendamento.getUsuario().getIdUsuario());
            gravar.setInt(6, agendamento.getAtendente());
            gravar.execute();
            
            gravar.close();
            return true;
        }
    }
    
    public ArrayList<Agendamento> agendamentos(int idUsuario) throws SQLException{
        ArrayList<Agendamento> agendamentos = new ArrayList<>();
        Connection conexao = ConexaoFactory.conectar();
        PreparedStatement gravar;
        String sql= "";
        
        Agendamento agendamento= new Agendamento();
        UsuarioDAO udao= new UsuarioDAO();
        
        if(idUsuario<=2){
            sql= "SELECT idAgendamento,dataAgendamento, valorTotal, status, idUsuario,idAtendente FROM agendamento";
            gravar=conexao.prepareStatement(sql);
            ResultSet lista= gravar.executeQuery();
            while(lista.next()){
                agendamento.setIdAgendamento(lista.getInt("idAgendamento"));
                agendamento.setDataAgendamento(lista.getDate("dataAgendamento"));
                agendamento.setStatus(lista.getInt("status"));
                agendamento.setValor(lista.getDouble("valorTotal"));
                agendamento.setUsuario(udao.getCarregarPorId(lista.getInt("idUsuario")));
                agendamento.setAtendente(lista.getInt("idAtendente"));
                agendamentos.add(agendamento);
            }
            
        }if(idUsuario==3){
            sql= "SELECT a.idAgendamento,a.dataAgendamento, a.valorTotal, a.status, a.idUsuario,a.idAtendente,u.idPerfil,u.nome,u.login,u.telefone FROM agendamento a INNER JOIN usuario u WHERE a.idAtedente=?";
            gravar=conexao.prepareStatement(sql);
            gravar.setInt(1, idUsuario);
            ResultSet lista= gravar.executeQuery();
            while(lista.next()){
                agendamento.setIdAgendamento(lista.getInt("idAgendamento"));
                agendamento.setDataAgendamento(lista.getDate("dataAgendamento"));
                agendamento.setStatus(lista.getInt("status"));
                agendamento.setValor(lista.getDouble("valorTotal"));
                agendamento.setUsuario(udao.getCarregarPorId(lista.getInt("idUsuario")));
                agendamentos.add(agendamento);
            }
        }
        
        return agendamentos;
    }
    
    public boolean deletarAgendamento(int idAgendamento){
        
        return true;
    }
    
    public Agendamento carregarAgendamentoPorId(int idAgendamento){
        
        Agendamento agendamento= new Agendamento();
        return agendamento;
    }
}
