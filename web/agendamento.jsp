<%-- 
    Document   : cadastrarUsuario
    Created on : 18/10/2021, 09:06:11
    Author     : Vitor
--%>


<%@page import="java.io.PrintWriter"%>
<%@page import="control.GerenciarLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.util.ArrayList"
        import="model.Perfil"
        import="model.Usuario"
        import="model.UsuarioDAO"
        import="model.PerfilDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<!-- Novo teste de commit -->
<!DOCTYPE html>
<%   
    
    Usuario usuario = new Usuario();
    usuario = GerenciarLogin.verificarAcesso(request, response);
    PrintWriter saida = response.getWriter();
     if(usuario==null){
                     out.println("<script type='text/javascript'> "+
                     "location.href='login.jsp';</script>"); 
    } 
    %>
<html>
    <head>
        <title>Agendamento de Serviço</title>
        <meta charset="UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, 
              maximum-scale=1, user-scalable=no" />
       
      
        <link rel="stylesheet" href="css/font-awesome.min.css"/>
        <link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />
   
        <link rel="stylesheet" href="css/formulario.css" >
        <script src="https://kit.fontawesome.com/3f3417947e.js" crossorigin="anonymous"></script>
        
       
     
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/style.css">
        
        
      

    </head>
  
        

    <body class="img js-fullheight" style="background-image: url(http://localhost:8080/ProjetoFinal/images/imagembanner.jpeg);">
          <%
        //HTTP 1.1
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        //HTTP 1.0
        response.setHeader("Pragma", "no-cache");
        //Proxie
        //response.setHeader("Expires", "0");
      
        %>
        
        
        <div id="imagemBanner" style="margin:40px;margin-top:40px;"><a href="index.jsp"><img  src="images/logo.png" width="200" ></a></div>

        <div class="form-style-10">
            <h1>Agendamento de Serviço <span>Agenda um Serviço Conosco</span></h1>
            <form action="gerenciarAgendamento" method="POST">
                <div class="section"><span>1</span>Serviço:</div>
                <div class="inner-wrap">
                    <label>Nome do serviço:  
                        <fmt:setLocale value="pt_BR"/> 
                        <jsp:useBean class="model.ServicoDAO" id="sdao"/>          
                                  <select name="idServico" required >
                                      <option value="" selected> Escolha um Serviço</option>
                                      <c:forEach var="servico" items="${sdao.servicos()}">
                                         <option value="${servico.idServico}">${servico.nome}(<fmt:formatNumber value = "${servico.preco}" type = "currency"/>)</option>
                                      
                                     </c:forEach>
                                      
                                      
                                  </select>
                    </label>
                    <input type="hidden" name="idAgendamento" value=""/>
                    <input type="hidden" name="status" value="3"/>
                    <input type="hidden" name="idUsuario" value="${usuario.idUsuario}"/>
                    
             

                </div>

                <div class="section"><span>2</span>Atendente:</div>
                <div class="inner-wrap">
                    <label>Atendente:  <jsp:useBean class="model.UsuarioDAO" id="udao"/>          
                                  <select name="idAtendente" required >
                                      <option value="" selected> Escolha um Atendente</option>
                                      <c:forEach var="atendente" items="${udao.atendentes()}">
                                         <option value="${atendente.idUsuario}">${atendente.nome}</option>
                                      
                                     </c:forEach>
                                      
                                      
                                  </select>
                    </label>
                    
                </div>
                <div class="section"><span>4</span>Dia de Atendimento:</div>
                        <div class="inner-wrap">
                            <label>Data do Dia: <input type="date" name="dataAgendamento" maxlength="125" required/></label>

                        </div>

                        <div class="section"><span>3</span>Horário do Agendamento:</div>
                        <div class="inner-wrap">
                            <label>Hora : </label>
                                    <select name="horario" required >
                                      <option value="" selected> Escolha um Horário:</option>
                                      
                                         <option value="09:00">09:00</option>
                                         <option value="10:00">10:00</option>
                                         <option value="11:00">11:00</option>
                                         <option value="12:00">12:00</option>
                                         <option value="13:00">13:00</option>
                                         <option value="14:00">14:00</option>
                                         <option value="15:00">15:00</option>
                                         <option value="16:00">16:00</option>
                                         <option value="17:00">17:00</option>
                                         <option value="18:00">18:00</option>
                                         <option value="19:00">19:00</option>
                                         <option value="20:00">20:00</option>
                                     
                                      
                                      
                                  </select>
                        </div>
                <div class="button-section">
                    <input type="submit" name="Cadastrar" value="Agendar"/>

                </div>
                <link href='http://fonts.googleapis.com/css?family=Bitter' rel='stylesheet' type='text/css'>
            </form>
        </div>     


        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <jsp:include page="templates/footer.jsp"/>
        



    </body>
</html>

