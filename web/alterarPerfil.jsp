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
        <title>Cadastro de Perfil</title>
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
            <h1>Alteração de Perfil <span>Altere um Perfil de Acesso</span></h1>
            <form action="gerenciarPerfil" method="POST">
                <div class="section"><span>1</span>ID e Nome:</div>
                <div class="inner-wrap">
                    <label>ID Perfil <input type="text" name="idPerfil" readonly value="${perfil.idPerfil}"/></label>
                    <label>Nome do serviço: <input type="text" name="nome" required value="${perfil.nome}"/></label>
                  
             

                </div>

                <div class="section"><span>2</span>Data de Cadastro:</div>
                <div class="inner-wrap">
                    <label>Data: <input type="date" name="dataCadastro" value="${perfil.dataCadastro}"  required/></label>
                    
                </div>

                
                <div class="button-section">
                    <input type="submit" name="Salvar" value="Salvar"/>

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


