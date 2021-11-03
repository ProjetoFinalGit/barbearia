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
import java.sql.Time;
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
            String sql="INSERT INTO agendamento(dataAgendamento,valorTotal,status,idUsuario) VALUES (?,?,?,?)";
            gravar=conexao.prepareStatement(sql);
            gravar.setDate(1, (Date) agendamento.getDataAgendamento());
            gravar.setDouble(2, agendamento.getValor());
            gravar.setInt(3, agendamento.getStatus());
            gravar.setInt(4, agendamento.getUsuario().getIdUsuario());
            
            gravar.execute();
            
            conexao.close();
            return true;
        }else{
            String sql="INSERT INTO agendamento(dataAgendamento,valorTotal,status,idUsuario) VALUES (?,?,?,?,?)";
            gravar=conexao.prepareStatement(sql);
            gravar.setInt(1, agendamento.getIdAgendamento());
            gravar.setDate(2, (Date) agendamento.getDataAgendamento());
            gravar.setDouble(3, agendamento.getValor());
            gravar.setInt(4, agendamento.getStatus());
            gravar.setInt(5, agendamento.getUsuario().getIdUsuario());
            
            gravar.execute();
            
            gravar.close();
            return true;
        }
    }
    
    public boolean vincularAgendamentoServico(Servico servico, Agendamento agendamento,AgendamentoServico agendamentoServico) throws SQLException{
        Connection conexao = ConexaoFactory.conectar();
        
        String sql="INSERT INTO agendamento_servico(idServico,idAgendamento,horario,status,idAtendente) VALUES (?,?,?,?,?)";
        PreparedStatement gravar = conexao.prepareStatement(sql);
        gravar.setInt(1, servico.getIdServico());
        gravar.setInt(2, agendamento.getIdAgendamento());
        gravar.setTime(3, (Time) agendamentoServico.getHorario());
        gravar.setInt(4, agendamentoServico.getStatus());
        gravar.setInt(5, agendamentoServico.getIdAtendente());
        gravar.execute();
        
        conexao.close();
        return true;
    }
    
    public ArrayList<AgendamentoServico> agendamentosServicos() throws SQLException{
        ArrayList<AgendamentoServico> agendamentos = new ArrayList<>();
        Connection conexao = ConexaoFactory.conectar();
        PreparedStatement gravar;
       
        
        
        
        UsuarioDAO udao= new UsuarioDAO();
     
        ServicoDAO sdao = new ServicoDAO();
        
       
          String sql = "SELECT idServico, idAgendamento, horario, status, idAtendente FROM agendamento_servico";
            gravar = conexao.prepareStatement(sql);
            ResultSet lista = gravar.executeQuery();
            while(lista.next()){
                AgendamentoServico agendamentoServico= new AgendamentoServico();
                agendamentoServico.setServico(sdao.carregarServicoPorId(lista.getInt("idServico")));
                agendamentoServico.setAgendamento(this.carregarPorID(lista.getInt("idAgendamento")));
                agendamentoServico.setHorario(lista.getTime("horario"));
                agendamentoServico.setStatus(lista.getInt("status"));
                agendamentoServico.setIdAtendente(lista.getInt("idAtendente"));
                agendamentos.add(agendamentoServico);
            }
            
            
        /*if(idPerfil==3){
          
            sql = "SELECT as.idServico,as.idAgendamento,as.horario,as.status,as.idAtendente,"
                   + "s.idServico,s.nome,s.descricao,s.preco,s.duracao,"
                   + "a.idAgendamento,a.dataAgendamento,a.valorTotal,a.status,a.idUsuario "
                   + "FROM agendamento_servico as INNER JOIN servico s INNER JOIN agendamento a ON as.idServico = s.idServico AND as.idAgendamento = a.idAgendamento WHERE as.idAtendente = ?";
            gravar = conexao.prepareStatement(sql);
            gravar.setInt(1, idUsuario);
            ResultSet lista = gravar.executeQuery();
            while(lista.next()){
                AgendamentoServico agendamentoServico= new AgendamentoServico();
                agendamentoServico.setServico(sdao.carregarServicoPorId(lista.getInt("as.idServico")));
                agendamentoServico.setAgendamento(this.carregarPorID(lista.getInt("as.idAgendamento")));
                agendamentoServico.setHorario(lista.getTime("as.horario"));
                agendamentoServico.setStatus(lista.getInt("as.status"));
                agendamentoServico.setIdAtendente(lista.getInt("as.idAtedente"));
                agendamentos.add(agendamentoServico);
            }
        }*/
        conexao.close();
        return agendamentos;
    }
    
    public boolean deletarAgendamento(int idAgendamento) throws SQLException{
        Connection conexao = ConexaoFactory.conectar();
        String sql = "DELETE FROM agendamento WHERE idAgendamento = ?";
        PreparedStatement deletar = conexao.prepareStatement(sql);
        deletar.setInt(1, idAgendamento);
        deletar.execute();
        conexao.close();
        return true;
    }
    
    public Agendamento carregarIDAgendamento(int status,Date dataAgendamento,int idUsuario) throws SQLException{
        
        Agendamento agendamento= new Agendamento();
        UsuarioDAO udao = new UsuarioDAO();
        Connection conexao = ConexaoFactory.conectar();
        String sql="SELECT idAgendamento, dataAgendamento, valorTotal, status, idUsuario FROM agendamento WHERE status=? AND dataAgendamento =? AND idUsuario =? ";
        PreparedStatement puxar = conexao.prepareStatement(sql);
        puxar.setInt(1, status);
        puxar.setDate(2, dataAgendamento);
        puxar.setInt(3, idUsuario);
        ResultSet lista = puxar.executeQuery();
        if(lista.next()){
            agendamento.setIdAgendamento(lista.getInt("idAgendamento"));
            agendamento.setDataAgendamento(lista.getDate("dataAgendamento"));
            agendamento.setUsuario(udao.getCarregarPorId(lista.getInt("idUsuario")));
            agendamento.setStatus(lista.getInt("status"));
            agendamento.setValor(lista.getDouble("valorTotal"));
            
        }
        conexao.close();
        return agendamento;
    }
    
    public Agendamento carregarPorID(int idAgendamento) throws SQLException{
        
        Agendamento agendamento = new Agendamento();
         UsuarioDAO udao = new UsuarioDAO();
        Connection conexao = ConexaoFactory.conectar();
        String sql="SELECT idAgendamento, dataAgendamento, valorTotal, status, idUsuario FROM agendamento WHERE idAgendamento =? ";
        PreparedStatement puxar = conexao.prepareStatement(sql);
         puxar.setInt(1, idAgendamento);
         
          ResultSet lista = puxar.executeQuery();
        if(lista.next()){
            agendamento.setIdAgendamento(lista.getInt("idAgendamento"));
            agendamento.setDataAgendamento(lista.getDate("dataAgendamento"));
            agendamento.setUsuario(udao.getCarregarPorId(lista.getInt("idUsuario")));
            agendamento.setStatus(lista.getInt("status"));
            agendamento.setValor(lista.getDouble("valorTotal"));
            
        }
        conexao.close();
        return agendamento;
    }
    
    public ArrayList<Agendamento> carregarCliente(int idAgendamento) throws SQLException{
        Agendamento agendamento = new Agendamento();
        ArrayList<Agendamento> agendamentos = new ArrayList();
         UsuarioDAO udao = new UsuarioDAO();
        Connection conexao = ConexaoFactory.conectar();
        String sql="SELECT idAgendamento, dataAgendamento, valorTotal, status, idUsuario FROM agendamento WHERE idAgendamento =? ";
        PreparedStatement puxar = conexao.prepareStatement(sql);
         puxar.setInt(1, idAgendamento);
         
          ResultSet lista = puxar.executeQuery();
        if(lista.next()){
            agendamento.setIdAgendamento(lista.getInt("idAgendamento"));
            agendamento.setDataAgendamento(lista.getDate("dataAgendamento"));
            agendamento.setUsuario(udao.getCarregarPorId(lista.getInt("idUsuario")));
            agendamento.setStatus(lista.getInt("status"));
            agendamento.setValor(lista.getDouble("valorTotal"));
            agendamentos.add(agendamento);
        }
     
        return agendamentos;
    }
    
    
}
