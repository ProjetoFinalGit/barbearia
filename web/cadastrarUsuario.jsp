<%-- 
    Document   : cadastrarUsuario
    Created on : 18/10/2021, 09:06:11
    Author     : Vitor
--%>


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
        <title>Cadastro de Usuário</title>
        <meta charset="UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, 
              maximum-scale=1, user-scalable=no" />
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css" media="all"/>
        <link rel="stylesheet" href="css/menu.css" type="text/css" media="all" />
        <link rel="stylesheet" href="css/font-awesome.min.css"/>
        <link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />
        <link rel="stylesheet" href="datatables/dataTables.bootstrap4.min.css"/>
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
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png">
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
      
        %>
        
    
        <div id="imagemBanner" style="margin:40px;margin-top:40px;"><a href="index.jsp"><img  src="images/logo.png" width="200" ></a></div>

        <div class="form-style-10">
            <h1>Cadastre-se <span>Cadastre-se e aproveite para conhecer nossos serviços!</span></h1>
            <form action="gerenciarUsuario" method="POST">
                <div class="section"><span>1</span>Nome:</div>
                <div class="inner-wrap">
                    <label>Seu Nome: <input type="text" name="nome" required/></label>
                    <input type="hidden" name="idUsuario" value=""/>
                    <input type="hidden" name="idPerfil" value="4"/>

                </div>

                <div class="section"><span>2</span>Email e Telefone:</div>
                <div class="inner-wrap">
                    <label>Seu Email: <input type="email" name="login" required/></label>
                    <label>Telefone: <input type="text" name="telefone" class="cel-sp-mask" required/></label>
                    <input type="hidden" name="status" value="1"/>
                </div>

                <div class="section"><span>3</span>Senha e CPF:</div>
                <div class="inner-wrap">
                    <label>Senha: <input type="password" name="senha" minlength="8"/></label>
                    <label>CPF: <input type="text" name="cpf" class="cpf-mask" minlength="9" required/></label>
                </div>
                <div class="section"><span>3</span>Nascimento e Endereço:</div>
                <div class="inner-wrap">
                     <label>Data de Nascimento: <input type="date" name="dataNascimento"  required /></label>
                    <label>Endereço: <input type="text" name="endereco" maxlenght="45" minlenght="10" required/></label>
                     <span class="privacy-policy" style="color:black;">
                        <input type="checkbox" required >Você aceita os <a href="termos.jsp" style="color:blue;">termos</a> de uso do site. 
                    </span>
                </div>
                <div class="button-section">
                    
                    <input type="submit" name="Cadastrar" />
                                        <a href="index.jsp" ><input style="float:right;background-color: #F3957A;border-color:#F3957A;" type="button" name="Cadastrar" value="Voltar"/></a>


                   
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

