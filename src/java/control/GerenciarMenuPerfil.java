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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Menu;
import model.MenuDAO;
import model.Perfil;
import model.PerfilDAO;
import model.Usuario;

/**
 *
 * @author Vitor
 */
@WebServlet(name = "GerenciarMenuPerfil", urlPatterns = {"/gerenciarMenuPerfil"})
public class GerenciarMenuPerfil extends HttpServlet {


   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String acao= request.getParameter("acao");
       int idPerfil= Integer.parseInt(request.getParameter("idPerfil"));
       String idMenu= request.getParameter("idMenu");
       PrintWriter out = response.getWriter();
       String mensagem="";
       PerfilDAO pdao= new PerfilDAO();
       Usuario usuario = GerenciarLogin.verificarAcesso(request, response);
       
        
        if(usuario==null){
                     out.println("<script type='text/javascript'> "+
                     "location.href='login.jsp';</script>"); 
        }else{
            if(usuario.getPerfil().getIdPerfil()!=1){
                        mensagem="Perfil não autorizado!";
                     out.println("<script type='text/javascript'> "+"alert('"+mensagem+"');"+
                       "location.href='index.jsp';</script>");
            }else{
                try { 


                    if(acao.contentEquals("gerenciar")){

                     Perfil perfil= new Perfil();
                     perfil= pdao.getCarregarPorId(idPerfil);


                     RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/cadastrarMenuPerfil.jsp");
                     request.setAttribute("perfil", perfil);
                     dispatcher.forward(request, response);
                    }if(acao.contentEquals("desvincular")){
                       pdao.desvincular(Integer.parseInt(idMenu), idPerfil);
                       mensagem="Menu desvinculado com sucesso!";
                         out.println("<script type='text/javascript'> "+"alert('"+mensagem+"');"+
                           "location.href='gerenciarMenuPerfil?acao=gerenciar&idPerfil="+idPerfil+"'</script>");


                    }
                } catch (SQLException ex) {
                    Logger.getLogger(GerenciarMenuPerfil.class.getName()).log(Level.SEVERE, null, ex);
                }
            }   
        }         
       
       
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idPerfil = Integer.parseInt(request.getParameter("idPerfil"));
        int idMenu= Integer.parseInt(request.getParameter("idMenu"));
        String mensagem="";
        PrintWriter out = response.getWriter();
        
        try {
            PerfilDAO pdao= new PerfilDAO();
            ArrayList<Menu> menus = new ArrayList<>();
            menus= pdao.menusVinculadosPorPerfil(idPerfil);
            
           
                  pdao.vincular(idMenu, idPerfil);
                  mensagem="Menu referenciado com sucesso!";
                  
             
            
             out.println("<script type='text/javascript'> "+"alert('"+mensagem+"');"+
                   "location.href='gerenciarMenuPerfil?acao=gerenciar&idPerfil="+idPerfil+"'</script>");
        } catch (SQLException ex) {
            mensagem = "Erro: " ;
            out.println("<script type='text/javascript'> "+"alert('"+mensagem+ex.getMessage()+"');"+
                   "location.href='listarPerfil.jsp';</script>");
        }
    
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
