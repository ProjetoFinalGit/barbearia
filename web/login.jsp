<%-- 
    Document   : index
    Created on : 17 de ago. de 2021, 16:26:47
    Author     : laors
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
              
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section" style="color:#ae7b5b;">Página de Login</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	<h3 class="mb-4 text-center">Você já é cadastrado?</h3>
		      	<form action="gerenciarLogin" method="POST" class="signin-form">
                                        <div class="form-group">
                                                <input type="text" class="form-control" placeholder="Email" name="login" required>
                                        </div>
                            <div class="form-group">
                              <input id="password-field" type="password" class="form-control" placeholder="Senha" name="senha" required>
                              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="form-control btn btn-primary submit px-3">Login</button>
                            </div>
                            <div class="form-group d-md-flex" style="text-align: center;">
                                <div class="w-50">
                                        
                                                                        </div>
                                                                        <div class="w-50 text-md-center">
                                                                                <a href="#" style="color: #ae7b5b">Recuperar Senha</a>
                                                                        </div>
                            </div>
	          </form>
	          
	</section>

	<script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        
      
    

    </body>
</html>
