/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import factory.ConexaoFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Perfil;
import model.PerfilDAO;
import model.Usuario;
import model.UsuarioDAO;

/**
 *
 * @author Vitor
 */
@WebServlet(name = "gerenciarUsuario", urlPatterns = {"/gerenciarUsuario"})
public class GerenciarUsuario extends HttpServlet {

  

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String idUsuario= request.getParameter("idUsuario");
       String idPerfil= request.getParameter("idPerfil");
       String acao= request.getParameter("acao");
       
       PrintWriter out= response.getWriter();
       UsuarioDAO udao= new UsuarioDAO();
       Usuario user= new Usuario();
       String mensagem="";
       
       Usuario usuario=GerenciarLogin.verificarAcesso(request, response);
       
      
          try{  
            
                user= udao.getCarregarPorId(Integer.parseInt(idUsuario));
                if(acao.contains("alterar")){
                

                  if(Integer.parseInt(idUsuario)== usuario.getIdUsuario() || usuario.getPerfil().getIdPerfil()==1 || usuario.getPerfil().getIdPerfil()==2){  
                    RequestDispatcher dispatcher
                                = getServletContext().
                                        getRequestDispatcher("/alterarUsuario.jsp");
                    request.setAttribute("user", user);
                    dispatcher.forward(request, response);
                  }else{
                       mensagem="Usuário não autorizado!";
                 out.println("<script type='text/javascript'> "+"alert('"+mensagem+"');"+
                   "location.href='listarUsuario.jsp';</script>");
                  }
            
             
                }else if(acao.contains("desativar")){
                  user.setStatus(0);
                  udao.gravar(user);
                  mensagem="Usuário desativado com sucesso!";
                 out.println("<script type='text/javascript'> "+"alert('"+mensagem+"');"+
                   "location.href='listarUsuario.jsp';</script>");
                }else if(acao.contains("ativar")){
                  user.setStatus(1);
                  udao.gravar(user);
                  mensagem="Usuário ativado com sucesso!";
                 out.println("<script type='text/javascript'> "+"alert('"+mensagem+"');"+
                   "location.href='listarUsuario.jsp';</script>");
                }
                
       
            
            
            } catch (SQLException ex) {
            mensagem="Erro ao alterar ou remover Usuário, motivo: "+ex.getMessage();
            out.println("<script type='text/javascript'> "+"alert('"+mensagem+ex.getMessage()+"');"+
            "location.href='listarPerfil.jsp';</script>");
            }
        
       
       
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       PrintWriter out= response.getWriter();
       String idUsuario= request.getParameter("idUsuario");
       String nome= request.getParameter("nome");
       String login= request.getParameter("login");
       String senha= request.getParameter("senha");
       int status=Integer.parseInt(request.getParameter("status"));
       String idPerfil= request.getParameter("idPerfil");
       
       String mensagem="";
       
       
       
       
       Usuario usuario = new Usuario();
                UsuarioDAO udao= new UsuarioDAO();
                Perfil perfil= new Perfil();
                PerfilDAO pdao= new PerfilDAO();
      
               
        try {
          
            
            if(idUsuario.contentEquals("")){
                
               
               usuario.setNome(nome);
               usuario.setLogin(login);
               usuario.setSenha(senha);
               usuario.setStatus(status);
               perfil.setIdPerfil(Integer.parseInt(idPerfil));
               usuario.setPerfil(perfil);
               
               udao.gravar(usuario);
               mensagem= "Usuário cadastrado com sucesso!";
              
              
            }else{
              
               usuario.setIdUsuario(Integer.parseInt(idUsuario));
               usuario.setNome(nome);
               usuario.setLogin(login);
               usuario.setSenha(senha);
               usuario.setStatus(status);
               perfil.setIdPerfil(Integer.parseInt(idPerfil));
               
               
               usuario.setPerfil(perfil);
               
               udao.gravar(usuario);
               mensagem= "Usuário alterado com sucesso!"; 
              
            }

        
        
        
              out.println("<script type='text/javascript'> "+"alert('"+mensagem+"');"+
               "location.href='listarUsuario.jsp';</script>");  
        
        } catch (SQLException ex) {
             mensagem="Erro ao cadastrar ou alterar Usuário, motivo: "+ex.getMessage();
               out.println("<script type='text/javascript'> "+"alert('"+mensagem+ex.getMessage()+"');"+
               "location.href='listarMenu.jsp';</script>");
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
