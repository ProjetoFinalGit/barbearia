/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Menu;
import model.MenuDAO;

/**
 *
 * @author Vitor
 */
@WebServlet(name = "gerenciarMenu", urlPatterns = {"/gerenciarMenu"})
public class GerenciarMenu extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao= request.getParameter("acao");
       String id = request.getParameter("idMenu");
       int idMenu = Integer.parseInt(id);
       
       String nome= request.getParameter("nome");
       String icone= request.getParameter("icone");
       String link= request.getParameter("link");
       String exibir= request.getParameter("exibir");
       PrintWriter out = response.getWriter();
        String mensagem="";

       
        

        if(acao.contains("deletar")){
               MenuDAO mdao = new MenuDAO();
               
           try {
               
              
                  mdao.deletar(idMenu);
                
                  mensagem="Menu excluído com sucesso!"; 
               
              
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
               
               
        }if(acao.contentEquals("alterar")){
            
           try { 
               
               
                    MenuDAO mdao= new MenuDAO();
                    Menu menu= mdao.getCarregarPorId(idMenu);;
                    menu.setIdMenu(idMenu);

                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/alterarMenu.jsp");
                    request.setAttribute("menu", menu);
                    dispatcher.forward(request, response);
               
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
             
               mdao.gravar(novoMenu);
               
               
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
              
               mdao.gravar(novoMenu);
               
               
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

    

}
