/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Menu;
import model.Usuario;
import model.UsuarioDAO;

/**
 *
 * @author Vitor
 */
@WebServlet(name = "GerenciarLogin", urlPatterns = {"/gerenciarLogin"})
public class GerenciarLogin extends HttpServlet {
    protected static HttpServletResponse response;

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao= request.getParameter("acao");
        HttpSession session= request.getSession();
        
        if(acao.contentEquals("sair")){
            session.invalidate();
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        GerenciarLogin.response= response;
        String mensagem="";
        PrintWriter out= response.getWriter();
        
        String login= request.getParameter("login");
        String senha= request.getParameter("senha");
        
        Usuario usuario= new Usuario();
        UsuarioDAO udao= new UsuarioDAO();
        
        try {
            usuario= udao.getCarregarUsuario(login,senha);
            
            if((usuario.getIdUsuario()>0) && (usuario.getSenha().equals(senha.trim()))){
               
                if(usuario.getStatus()!=1){
                     mensagem="Usuário desativado, entre em contato com o administrador para mais informações!"; 
                    out.println("<script type='text/javascript'> "+"alert('"+mensagem+"');"+
                   "location.href='login.jsp';</script>");
                    
                }else{
                    HttpSession session= request.getSession();
                    session.setAttribute("usuario", usuario);
                    response.sendRedirect("index.jsp");
                }
                
               
            }else{
                
               mensagem="Usuário ou senha incorretas!"; 
               out.println("<script type='text/javascript'> "+"alert('"+mensagem+"');"+
                   "location.href='login.jsp';</script>");
               
            }
            
            
        } catch (SQLException ex) {
            Logger.getLogger(GerenciarLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
           
    }
    
    public static Usuario verificarAcesso(HttpServletRequest request, HttpServletResponse response) throws IOException{
        GerenciarLogin.response= response;
        PrintWriter out = response.getWriter();
        Usuario usuario= null;
        
        try {
            HttpSession sessao = request.getSession();
            if(sessao.getAttribute("usuario") == null){
                response.sendRedirect("login.jsp");
            }else{
                String uri = request.getRequestURI();
                /*
                                        url de exemplo: localhost:8080/projeto/gerenciarUsuario?acao=alterar&idUsuario=9
                                       URL = URI + QueryString
                                       URI= gerenciarUsuario
                                       QueryString= acao=alterar e idUsuario=9
                
                                    */
                String queryString = request.getQueryString();
                if(queryString != null){ // se nao tiver a querystring adicionada
                    uri += "?"+queryString;
                }
                usuario = (Usuario) request.getSession().getAttribute("usuario"); //atribuiçao para usuario
                if(usuario == null){
                    sessao.setAttribute("mensagem", 
                            "Usuário não autenticado no sistema!");
                    response.sendRedirect("login.jsp");
                    
                }else{
                    for(Menu m: usuario.getPerfil().getMenus()){
                       boolean possuiAcesso = false;
                       if(uri.contains(m.getLink())){
                           possuiAcesso = true;
                           break;
                       } 
                    }
                 
                }
               
          
            }
            
        } catch (Exception e) {
            out.println("Falha: " + e.getMessage());
        }
        return usuario;
        
       
    }

   
   
}
