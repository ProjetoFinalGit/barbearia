<%-- 
    Document   : cadastrarUsuario
    Created on : 18/10/2021, 09:06:11
    Author     : Vitor
--%>


<%@page import="control.GerenciarLogin"%>
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
<%   
    
    Usuario usuario = new Usuario();
    usuario = GerenciarLogin.verificarAcesso(request, response);
    PrintWriter saida = response.getWriter();
     if(usuario==null){
                     out.println("<script type='text/javascript'> "+
                     "location.href='login.jsp';</script>"); 
    }else{
        if(usuario.getPerfil().getIdPerfil()>2){



                   saida.println("<script type='text/javascript'> "+"alert('Usuário não autorizado!');"+
                   "location.href='index.jsp';</script>");
        }
     }    
    %>
<html>
    <head>
        <title>Alteração de Serviço</title>
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
        
        
        <script>
			   
					function moeda(a, e, r, t) {
					   let n = "",
					      h = j = 0,
					      u = tamanho2 = 0,
					      l = ajd2 = "",
					      o = window.Event ? t.which : t.keyCode;
					   if (13 == o || 8 == o)
					      return !0;
					   if (n = String.fromCharCode(o),
					      -1 == "0123456789".indexOf(n))
					      return !1;
					   for (u = a.value.length,
					      h = 0; h < u && ("0" == a.value.charAt(h) || a.value.charAt(h) == r); h++);
					   for (l = ""; h < u; h++) - 1 != "0123456789".indexOf(a.value.charAt(h)) && (l += a.value.charAt(h));
					   if (l += n, 0 == (u = l.length) && (a.value = ""), 1 == u && (a.value = "0" + r + "0" + l), 2 == u && (a.value = "0" + r + l), u > 2) {
					      for (ajd2 = "",
					         j = 0,
					         h = u - 3; h >= 0; h--)
					         3 == j && (ajd2 += e,
					            j = 0),
					         ajd2 += l.charAt(h),
					         j++;
					      for (a.value = "",
					         tamanho2 = ajd2.length,
					         h = tamanho2 - 1; h >= 0; h--)
					         a.value += ajd2.charAt(h);
					      a.value += r + l.substr(u - 2, u)
					   }
					   return !1
					}      
			
    			
    </script>

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
            <h1>Alterar Serviço <span>Altere os dados de Cadastro</span></h1>
            <form action="gerenciarServico" method="POST">
                <div class="section"><span>1</span>ID Nome:</div>
                <div class="inner-wrap">
                    <label>ID serviço: <input type="text" name="idServico" value="${servico.idServico}" readonly /></label>
                    <label>Nome do serviço: <input type="text" name="nome" value="${servico.nome}" required/></label>
                    
             

                </div>

                <div class="section"><span>2</span>Descrição:</div>
                <div class="inner-wrap">
                    <label>Descrição: <input type="text" name="descricao" maxlength="125" required value="${servico.descricao}"/></label>
                    
                </div>

                <div class="section"><span>3</span>Duração:</div>
                <div class="inner-wrap">
                    <label>Duração (Minutos): <input type="number" name="duracao" required value="${servico.duracao}"/></label>
                   
                </div>
                
                <div class="section"><span>3</span>Preço:</div>
                <div class="inner-wrap">
                    
                   
                    <label>R$<input class="money" name="preco" type="text" value="${servico.duracao}" required onkeypress="return(moeda(this,'.',',',event))"></label>
                     
                </div>
                <div class="button-section">
                    <input type="submit" name="Alterar" value="Salvar"/>

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

