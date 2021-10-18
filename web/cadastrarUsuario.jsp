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
        <title>Página de Login</title>
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

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="css/style.css">
        
    </head>
    <body>
      
        <body class="img js-fullheight" style="background-image: url(http://localhost:8080/ProjetoFinal/images/imagembanner.jpeg);">
             <div id="imagemBanner" style="margin:40px;margin-top:40px;"><a href="index.jsp"><img  src="images/logo.png" width="200" ></a></div>
        
        <div class="form-style-10">
        <h1>Cadastre-se <span>Cadastre-se e aproveite para conhecer nossos serviços!</span></h1>
        <form>
                <div class="section"><span>1</span>Nome</div>
                <div class="inner-wrap">
                    <label>Seu Nome: <input type="text" name="nome" /></label>
                    
                </div>

                <div class="section"><span>2</span>Email</div>
                <div class="inner-wrap">
                    <label>Seu Email: <input type="email" name="email" /></label>
                    <input type="hidden" name="status" />
                </div>

                <div class="section"><span>3</span>Senha:</div>
                    <div class="inner-wrap">
                    <label>Senha: <input type="password" /></label>
                    <label>Confirme a Senha: <input type="password" name="senha" /></label>
                </div>
                <div class="section"><span>3</span>Perfil</div>
                    <div class="inner-wrap">
                    <select class="selectionFormulario" name="idPerfil" required>
                                  <option value="" selected> Escolha um perfil associado</option>
                                  <jsp:useBean class="model.PerfilDAO" id="pdao" />
                                  <c:forEach var="p" items="${pdao.lista}">
                                      
                                      <option value="${p.idPerfil}">${p.nome}</option>
                                      
                                  </c:forEach>
                                  
                              </select>
                </div>
                <div class="button-section">
                 <input type="submit" name="Sign Up" />
                 <span class="privacy-policy">
                 <input type="checkbox" required>Você aceita os termos de uso do site. 
                 </span>
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

