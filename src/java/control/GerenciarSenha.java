/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Usuario;
import model.UsuarioDAO;

/**
 *
 * @author Vitor
 */
@WebServlet(name = "GerenciarSenha", urlPatterns = {"/gerenciarSenha"})
public class GerenciarSenha extends HttpServlet {

  

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cpf = request.getParameter("cpf");
        String login = request.getParameter("login");
        String data = request.getParameter("dataNascimento");
        PrintWriter out= response.getWriter();
        String mensagem="";
        
        java.sql.Date dataNascimento = java.sql.Date.valueOf(data);
        
        UsuarioDAO udao = new UsuarioDAO();
        Usuario usuario = new Usuario();
        
        try {
            usuario=udao.recuperarSenha(cpf, login, dataNascimento);
            if(usuario.getCpf()==null || usuario.getIdUsuario()==0 || usuario.getNome()==null ){
               
                   mensagem= "Usuário não encontrado!";
                   out.println("<script type='text/javascript'> "+"alert('"+mensagem+"');"+
                     "location.href='recuperarSenha.jsp';</script>"); 
            }else{
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/modificarSenha.jsp");
                request.setAttribute("usuario", usuario);
                dispatcher.forward(request, response);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(GerenciarSenha.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        String senha = request.getParameter("senha");
        String mensagem="";
        PrintWriter out= response.getWriter();
        
        UsuarioDAO udao = new UsuarioDAO();
       
        
        try {
            udao.modificarSenha(idUsuario, senha);
           
                    
            mensagem= "Senha modificada com sucesso!";
                   out.println("<script type='text/javascript'> "+"alert('"+mensagem+"');"+
                     "location.href='index.jsp';</script>");
                   
        } catch (SQLException ex) {
            Logger.getLogger(GerenciarSenha.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

  

}
