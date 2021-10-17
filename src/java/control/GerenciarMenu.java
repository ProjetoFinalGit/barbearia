/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import factory.ConexaoFactory;
import model.Menu;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.MenuDAO;
import model.Usuario;
import model.UsuarioDAO;

/**
 *
 * @author Vitor
 */
@WebServlet(name = "GerenciarMenu", urlPatterns = {"/gerenciarMenu"})
public class GerenciarMenu extends HttpServlet {

  
    

    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String acao= request.getParameter("acao");
       String id = request.getParameter("idMenu");
       int idMenu = Integer.parseInt(id);
       String id2 = request.getParameter("idPerfil");
       int idPerfil = Integer.parseInt(id2);
       String nome= request.getParameter("nome");
       String icone= request.getParameter("icone");
       String link= request.getParameter("link");
       String exibir= request.getParameter("exibir");
       PrintWriter out = response.getWriter();
        String mensagem="";

       
        Usuario usuario= GerenciarLogin.verificarAcesso(request, response);

        if(acao.contains("deletar")){
               MenuDAO mdao = new MenuDAO();
               
           try {
               
               if(idPerfil==1){
                  mdao.deletar(idMenu);
                
                  mensagem="Menu excluído com sucesso!"; 
               }else{
                   mensagem= "Usuário não autorizado!";
               }
              
               out.println("<script type='text/javascript'> "+"alert('"+mensagem+"');"+
               "location.href='listarMenu.jsp';</script>");
           } catch (SQLException ex) {
                mensagem="Erro ao excluir Menu, motivo: "+ex.getMessage();
               out.println("<script type='text/javascript'> "+"alert('"+mensagem+ex.getMessage()+"');"+
               "location.href='listarMenu.jsp';</script>");
           } catch(NullPointerException nul){
               mensagem="Erro ao excluir Menu, motivo: "+nul.getMessage();
               out.println("<script type='text/javascript'> "+"alert('"+mensagem+nul.getMessage()+"');"+
               "location.href='listarMenu.jsp';</script>");
           }
               
               
        }else{
            
           try { 
               
               if(idPerfil==1){
                    MenuDAO mdao= new MenuDAO();
                    Menu menuAlterado= mdao.getCarregarPorId(idMenu);;
                    menuAlterado.setIdMenu(idMenu);

                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/alterarMenu.jsp");
                    request.setAttribute("menuAlterado", menuAlterado);
                    dispatcher.forward(request, response);
               }else{
                    mensagem="Usuário não autorizado!";
                    out.println("<script type='text/javascript'> "+"alert('"+mensagem+"');"+
                    "location.href='listarMenu.jsp';</script>");
                }
           } catch (SQLException ex) {
               mensagem="Erro ao alterar Menu, motivo: "+ex.getMessage();
               out.println("<script type='text/javascript'> "+"alert('"+mensagem+ex.getMessage()+"');"+
               "location.href='listarMenu.jsp';</script>");
           }
          
        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String idMenu = request.getParameter("idMenu");
       String nome= request.getParameter("nome");
       String icone= request.getParameter("icone");
       String link= request.getParameter("link");
       String exibir= request.getParameter("exibir");
       PrintWriter out = response.getWriter();
               
       String mensagem="";
       if(idMenu.contentEquals("")){
           Menu novoMenu = new Menu();
           MenuDAO mdao= new MenuDAO();
           novoMenu.setNome(nome);
           novoMenu.setLink(link);
           novoMenu.setIcone(icone);
           novoMenu.setExibir(Integer.parseInt(exibir));
           try {
               Connection conexao = ConexaoFactory.conectar();
               mdao.gravar(novoMenu);
               ConexaoFactory.close(conexao);
               
               mensagem="Menu cadastrado com sucesso!";
               out.println("<script type='text/javascript'> "+"alert('"+mensagem+"');"+
               "location.href='listarMenu.jsp';</script>");
           } catch (SQLException ex) {
                mensagem="Erro ao cadastrar Menu, motivo: "+ex.getMessage();
               out.println("<script type='text/javascript'> "+"alert('"+mensagem+ex.getMessage()+"');"+
               "location.href='listarMenu.jsp';</script>");
           }
       }else{
            Menu novoMenu = new Menu();
           MenuDAO mdao= new MenuDAO();
           novoMenu.setIdMenu(Integer.parseInt(idMenu));
           novoMenu.setNome(nome);
           novoMenu.setLink(link);
           novoMenu.setIcone(icone);
           novoMenu.setExibir(Integer.parseInt(exibir));
           try {
               Connection conexao = ConexaoFactory.conectar();
               mdao.gravar(novoMenu);
               ConexaoFactory.close(conexao);
               
               mensagem="Menu alterado com sucesso!";
               out.println("<script type='text/javascript'> "+"alert('"+mensagem+"');"+
               "location.href='listarMenu.jsp';</script>");
           } catch (SQLException ex) {
                mensagem="Erro ao alterar Menu, motivo: "+ex.getMessage();
               out.println("<script type='text/javascript'> "+"alert('"+mensagem+ex.getMessage()+"');"+
               "location.href='listarMenu.jsp';</script>");
           }
       }
       
    }
    
   
  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
