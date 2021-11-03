/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Agendamento;
import model.AgendamentoDAO;
import model.AgendamentoServico;
import model.Servico;
import model.ServicoDAO;
import model.Usuario;
import model.UsuarioDAO;

/**
 *
 * @author Vitor
 */
@WebServlet(name = "GerenciarAgendamento", urlPatterns = {"/gerenciarAgendamento"})
public class GerenciarAgendamento extends HttpServlet {


    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       int idServico = Integer.parseInt(request.getParameter("idServico"));
       int status= Integer.parseInt(request.getParameter("status"));
       int idUsuario= Integer.parseInt(request.getParameter("idUsuario"));
       String idAgendamento = request.getParameter("idAgendamento");
       int idAtendente= Integer.parseInt(request.getParameter("idAtendente"));
       String tempo= request.getParameter("horario");
       Date dataAgendamento = Date.valueOf(request.getParameter("dataAgendamento"));
       String mensagem = "";
       PrintWriter out = response.getWriter();
       
     
       
       Servico servico = new Servico();
       Usuario usuario = new Usuario();
       Agendamento agendamento = new Agendamento();
       AgendamentoServico agendamentoServico = new AgendamentoServico();
       ServicoDAO sdao = new ServicoDAO();
       UsuarioDAO udao= new UsuarioDAO();
       AgendamentoDAO adao= new AgendamentoDAO();
       
       
       
       
       
       
        try {
            servico= sdao.carregarServicoPorId(idServico);
            usuario= udao.getCarregarPorId(idUsuario);
            
            SimpleDateFormat formatador = new SimpleDateFormat("HH:mm");
            java.util.Date data2 =  formatador.parse(tempo);
            Time time = new Time(data2.getTime());
            
          
            
            
            if(idAgendamento.contentEquals("")){
               
                agendamento.setStatus(status);
                agendamento.setUsuario(usuario);
                agendamento.setValor(servico.getPreco());
                agendamento.setDataAgendamento(dataAgendamento);
                agendamentoServico.setIdAtendente(idAtendente);
                agendamentoServico.setStatus(status);
                agendamentoServico.setAgendamento(agendamento);
                agendamentoServico.setHorario(time);
                
                adao.gravarAgendamento(agendamento);
                agendamento = adao.carregarIDAgendamento(status, dataAgendamento, idUsuario);
               
                adao.vincularAgendamentoServico(servico, agendamento, agendamentoServico);
                 mensagem="Agendamento efetuado com sucesso!"; 
               out.println("<script type='text/javascript'> "+"alert('"+mensagem+"');"+
                   "location.href='index.jsp';</script>");
               
            }
        } catch (SQLException ex) {
            Logger.getLogger(GerenciarAgendamento.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(GerenciarAgendamento.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }

   

}
