/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
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

/**
 *
 * @author laors
 */
@WebServlet(name = "GerenciarPerfil", urlPatterns = {"/gerenciarPerfil"})
public class GerenciarPerfil extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String mensagem = "";
        String acao = request.getParameter("acao");
        String idPerfil = request.getParameter("idPerfil");
        

        Perfil perfil = new Perfil();
        PerfilDAO pdao = new PerfilDAO();
        Usuario usuario = new Usuario();
        usuario = GerenciarLogin.verificarAcesso(request, response);

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
                    if(acao.contains("alterar")){
                       perfil= pdao.getCarregarPorId(Integer.parseInt(idPerfil));

                       RequestDispatcher dispatcher
                                   = getServletContext().
                                           getRequestDispatcher("/alterarPerfil.jsp");
                       request.setAttribute("perfil", perfil);
                       dispatcher.forward(request, response);
                
                
            
             
                }if(acao.contentEquals("deletar")){


                        pdao.deletar(Integer.parseInt(idPerfil));
                        mensagem="Perfil deletado com sucesso!";
                       out.println("<script type='text/javascript'> "+"alert('"+mensagem+"');"+
                         "location.href='listarPerfil.jsp';</script>");}
                 }
                  catch (SQLException e) {
                      mensagem = "Erro: " + e.getMessage();
                      out.println(mensagem);
                    }
           }
                
        }    
        
        
       
       

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        
        PrintWriter out = response.getWriter();
        String nome = request.getParameter("nome");
        String idPerfil = request.getParameter("idPerfil");
        
        String mensagem = "";
        Date dataCadastro= Date.valueOf(request.getParameter("dataCadastro"));
       
        SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
       
        Perfil perfil = new Perfil();
        PerfilDAO pdao= new PerfilDAO();
       

        try {
 
            if(idPerfil.contentEquals("")){
                perfil.setDataCadastro(dataCadastro);
                perfil.setNome(nome);
                pdao.gravar(perfil);
                mensagem="Perfil cadastrado com sucesso!";

                
                
            }else { 
                 
                perfil.setIdPerfil(Integer.parseInt(idPerfil));
                perfil.setDataCadastro(dataCadastro);
                perfil.setNome(nome);
                pdao.gravar(perfil);
                mensagem="Perfile alterado com sucesso!";
            }    
                

        } catch (SQLException e) {
            mensagem = "Erro: " + e.getMessage();
            out.println(mensagem+e.getMessage());

        }

        out.println(
                "<script type='text/javascript'>"
                + "alert('" + mensagem + "');"
                + "location.href='listarPerfil.jsp';"
                + "</script>");

    }

 
 
}
