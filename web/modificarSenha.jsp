<%-- 
    Document   : modificarSenha
    Created on : 03/11/2021, 20:23:01
    Author     : Vitor
--%>


<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.util.ArrayList"
        import="model.Perfil"
        import="model.Usuario"
        import="model.UsuarioDAO"
        import="model.PerfilDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<!-- Novo teste de commit -->
<!DOCTYPE html>

<html>
    <head>
        <title>Recuperar Senha</title>
        <meta charset="UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, 
              maximum-scale=1, user-scalable=no" />
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css" media="all"/>
        <link rel="stylesheet" href="css/menu.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/font-awesome.min.css"/>
        <link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/formulario.css" >
        <script src="https://kit.fontawesome.com/3f3417947e.js" crossorigin="anonymous"></script>
        <script src="js/jquery-3.6.0.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/sweetalert2.all.min.js"type="text/javascript"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Máscaras -->
        <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="//assets.locaweb.com.br/locastyle/2.0.6/stylesheets/locastyle.css">
        <!-- Fim Máscaras -->

        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

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
        
        if(request.getAttribute("usuario")==null){
             PrintWriter saida = response.getWriter();
             saida.println("<script type='text/javascript'> "+
                     "location.href='recuperarSenha.jsp';</script>"); 
        }
        %>
        
    
        <div id="imagemBanner" style="margin:40px;margin-top:40px;"><a href="index.jsp"><img  src="images/logo.png" width="200" ></a></div>

        <div class="form-style-10">
            <h1>Modificar Senha <span>Modifique sua senha de acesso.</span></h1>
            <form action="gerenciarSenha" method="POST">
                <div class="section"><span>1</span>Email:</div>
                <div class="inner-wrap">
                    <label>Seu email: <input type="email" name="login" value="${usuario.login}" readonly/></label>
                    <input type="hidden" name="idUsuario" value="${usuario.idUsuario}" readonly/>
                   

                </div>

                <div class="section"><span>2</span>CPF:</div>
                <div class="inner-wrap">
                 
                    <label>CPF: <input type="text" name="cpf" class="cpf-mask" value="${usuario.cpf}" minlength="9" readonly/></label>
                </div>
                <div class="section"><span>3</span>Data de Nascimento:</div>
                <div class="inner-wrap">
                     <label>Data de Nascimento: <input type="date" name="dataNascimento" value="${usuario.dataNascimento}" readonly /></label>
                   
                </div>
                <div class="section"><span>4</span>Nova Senha:</div>
                <div class="inner-wrap">
                     <label>Senha: <input type="password" name="senha"  required /></label>
                   
                </div>     
                <div class="button-section">
                    <input type="submit" name="Salvar" />

                    
                </div>
                <link href='http://fonts.googleapis.com/css?family=Bitter' rel='stylesheet' type='text/css'>
            </form>
        </div>     


        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <jsp:include page="templates/footer.jsp"/>
        <script async="" src="//www.google-analytics.com/analytics.js"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-2.0.3.min.js"></script>
        <script type="text/javascript" src="//assets.locaweb.com.br/locastyle/2.0.6/javascripts/locastyle.js"></script>
        <script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>



    </body>
</html>

