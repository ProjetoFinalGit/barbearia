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
        import="model.Menu"
        import="model.MenuDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%   
    
    Usuario usuario = new Usuario();
    usuario = GerenciarLogin.verificarAcesso(request, response);
    PrintWriter saida = response.getWriter();
    if(usuario==null){
                     out.println("<script type='text/javascript'> "+
                     "location.href='login.jsp';</script>"); 
    }else{
        if(usuario.getPerfil().getIdPerfil()!=1){



                   saida.println("<script type='text/javascript'> "+"alert('Usuário não autorizado!');"+
                   "location.href='index.jsp';</script>");
        }
    }    
    %>
<!-- Novo teste de commit -->
<!DOCTYPE html>

<html>
    <head>
        <title>Vínculos de Menu</title>
        <meta charset="UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, 
              maximum-scale=1, user-scalable=no" />
       
      
        <link rel="stylesheet" href="css/font-awesome.min.css"/>
        <link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png">
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
            <h1>Vinculo de Menu <span>Vincule um Menu de Acesso</span></h1>
            <form action="gerenciarMenuPerfil" method="POST">
                <div class="section"><span>1</span>ID Perfil e Nome:</div>
                <div class="inner-wrap">
                    <label>ID Perfil: <input type="text" name="idPerfil" readonly value="${perfil.idPerfil}"/></label>
                    <label>Nome: <input type="text" name="nome" readonly value="${perfil.nome}"/></label>
                   
            
                </div>

                <div class="section"><span>2</span>Data de Cadastro:</div>
                <div class="inner-wrap">
                    <label>Data de Cadastro: <input type="date" name="dataCadastro" value="${perfil.dataCadastro}" readonly/></label>
                    
                </div>
                
                <div class="section"><span>3</span>Exibir:</div>
                <div class="inner-wrap">
                     <jsp:useBean class="model.MenuDAO" id="mdao"/>          
                                  <select name="idMenu" required >
                                      <option value="" selected> Escolha um menu para associar</option>
                                     <c:forEach var="menu" items="${mdao.menus}">
                                         <option value="${menu.idMenu}">${menu.nome}</option>
                                      
                                     </c:forEach>
                                      
                                      
                                  </select>
                </div>

                
                <div class="button-section">
                    <input type="submit" name="Cadastrar" value="Cadastrar"/>
                    <a href="listarPerfil.jsp" ><input style="float:right;background-color: #F3957A;border-color:#F3957A;" type="button" name="Cadastrar" value="Voltar"/></a>
                  

                </div>
                <link href='http://fonts.googleapis.com/css?family=Bitter' rel='stylesheet' type='text/css'>
            </form><br><br>
            </div>                      
                                  <div class="row">
                                       <h2>Menus Vinculados</h2>
                        <div class="table-responsive">
                            <table class="table table-hover table-striped table-bordered" id="listarMenus">
                                <thead>
                                    <tr>
                                        <th>Código do Menu</th>
                                        <th>Menu</th>
                                        <th>Link</th>
                                        <th>Icone</th>
                                        <th>Exibir</th>
                                        <th>Desvincular</th>
                                    </tr>

                                </thead>
                                <tbody>
                                    <c:forEach var="m" items="${perfil.menus}">
                                        <tr>
                                            <td>${m.idMenu}</td>
                                            <td>${m.nome}</td>
                                            <td>${m.link}</td>
                                            <td>${m.icone}</td>
                                            <td>
                                                <c:if test="${m.exibir == 1}">
                                                   Sim 
                                                </c:if>
                                                <c:if test="${m.exibir == 2}">
                                                   Não
                                                </c:if>
                                            </td>
                                            <td>
                                                <script type="text/javascript">
                                                    function confirmarExclusao(idMenu, nome, idPerfil) {
                                                        if (confirm('Deseja desvincular o menu ' + nome + '?')) {
                                                            location.href = "gerenciarMenuPerfil?acao=desvincular&idMenu=" + idMenu + "&idPerfil=" + idPerfil;
                                                        }
                                                    }
                                                </script>

                                                <button class='btn btn-danger btn-xs'
                                                        onclick="confirmarExclusao('${m.idMenu}', '${m.nome}',
                                                        ${perfil.idPerfil})">
                                                    Desvincular<i class="fas fa-trash"></i>
                                                </button>

                                            </td>
                                        </tr>
                                    </c:forEach>


                                </tbody>

                            </table>
                            <script src="js/jquery-3.6.0.min.js"></script>
                            <script src="datatables/jquery.dataTables.js"></script>
                            <script src="datatables/dataTables.bootstrap4.js"></script>
                            <script>
                                                            $(document).ready(function () {
                                                                $("#listarMenus").dataTable({
                                                                    "bJQueryUI": true,
                                                                    "lengthMenu": [[5, 10, 20, 25, -1], [5, 10, 20, 25, "All"]],
                                                                    "oLanguage": {
                                                                        "sProcessing": "Processando..",
                                                                        "sLengthMenu": "Mostrar _MENU_ registros",
                                                                        "sZeroRecords": "Não foram encontrados resultados",
                                                                        "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                                                                        "sInfoEmpty": "Mostrando de 0 até 0 de 0 registros",
                                                                        "sInfoFiltered": "",
                                                                        "sInfoPostFix": "",
                                                                        "sSearch": "Pesquisar",
                                                                        "sUrl": "",
                                                                        "oPaginate": {
                                                                            "sFirst": "Primeiro",
                                                                            "sPrevious": "Anterior",
                                                                            "sNext": "Próximo",
                                                                            "sLast": "Último"
                                                                        }

                                                                    }
                                                                });
                                                            });


                            </script>


                        </div>
                                      
             
        </div>     


        <script src="js/jquery.min.js"></script>
        <script src="js/popper.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/main.js"></script>
        <jsp:include page="templates/footer.jsp"/>
        



    </body>
</html>