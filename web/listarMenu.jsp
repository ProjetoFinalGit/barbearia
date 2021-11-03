<%-- 
    Document   : index
    Created on : 17 de ago. de 2021, 16:26:47
    Author     : vitor
--%>

<%@page import="java.io.PrintWriter"%>
<%@page import="control.GerenciarLogin"%>
<%@page import="model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.util.ArrayList"
        import="model.Menu"
        import="model.MenuDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<%   
    
    Usuario usuario = new Usuario();
    usuario = GerenciarLogin.verificarAcesso(request, response);
    PrintWriter saida = response.getWriter();
     if(usuario==null){
                     out.println("<script type='text/javascript'> "+
                     "location.href='login.jsp';</script>"); 
    }else{
        if(usuario.getPerfil().getIdPerfil()>2 ){



                   saida.println("<script type='text/javascript'> "+"alert('Usuário não autorizado!');"+
                   "location.href='index.jsp';</script>");
        }
     }    
    %>
<!DOCTYPE html>
<html>
    <head>
        <title>Menus</title>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, 
              maximum-scale=1, user-scalable=no" />
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css" media="all"/>
        
        <link rel="stylesheet" href="css/font-awesome.min.css"/>
        <link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />
        <link rel="stylesheet" href="datatables/dataTables.bootstrap4.css"/>
        <link rel="stylesheet" href="css/styles.css" type="text/css" media="all" />
        
        <script src="https://kit.fontawesome.com/3f3417947e.js" crossorigin="anonymous"></script>

      
        
    </head>
    <body>
        <div id="container">
            
            <div id="menu">

                <jsp:include page="templates/menu.jsp"/>

            </div><!-- fim da div menu -->
            <div id="content" style="padding-top: 10px">
                <div class="h-100 justify-content-center align-items-center">
                    <div clas="col-12">
                       <div class="col-sm-2 col-12" style="padding-bottom: 10px">
                        <a class="btn btn-primary btn-lg" style="background-color:#fbceb5;color:black;border-color:#fbceb5;" href="cadastrarMenu.jsp" 
                           role="button"><i class="fas fa-user-plus"></i>&nbspNOVO MENU</a><br><br>
                        </div>
                      
                        <div class="table-responsive" style="text-align: center;">
                            <table class="table table-hover table-striped 
                                   table-bordered" id="listarMEnu">
                                <thead  style="background-color:#9D6E58;">
                                    <tr class="text-white">
                                        <th>Código</th>
                                        <th>Nome</th>
                                        <th>Link</th>
                                        <th>Ícone</th>
                                        <th>Exibir</th>
                                        <th>Ações</th>
                                    </tr>

                                </thead>
                                <tbody>
                                    <jsp:useBean class="model.MenuDAO" id="mdao" />
                                    
                                    <c:forEach var="menu" items="${mdao.menus}">
                                   
                                        <tr>
                                            <td>${menu.idMenu}</td>
                                            <td>${menu.nome}</td>
                                           
                                            <td>${menu.link}</td>
                                            <td>${menu.icone}</td>
                                            <td>
                                                <c:if test="${menu.exibir == 1}">Sim</c:if>
                                                <c:if test="${menu.exibir == 0}">Não</c:if>
                                            </td>
                                            <td>
                                            <a href="gerenciarMenu?acao=alterar&idMenu=${menu.idMenu}"
                                                   class="btn btn-primary btn-xs" role="button">
                                                 <i class="fas fa-edit">&nbspAlterar</i>
                                                </a>
                                                 <script  type="text/javascript">
                                      function confirmarExclusao(idMenu){
                                                                     
                                                                     if(confirm('Deseja realmente excluir o menu?')){
                                                                                        
                                                                        location.href="gerenciarMenu?acao=deletar&idMenu="+idMenu;
                                                                     }
                                                                
}
                           
                       </script>  
                                                <button class='btn btn-danger btn-xs'
                                                    onclick="confirmarExclusao('${menu.idMenu}')">
                                                    <i class="fas fa-trash">&nbspExcluir</i>
                                                
                                                  
                                            </td>  
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                            
                              <script src="js/jquery-3.6.0.js"></script>
                            <script src="datatables/jquery.dataTables.js"></script>
                            <script src="datatables/dataTables.bootstrap4.js"></script>
                            <script>
                                $(document).ready(function () {
                                    $("#listarMenu").dataTable({
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
                </div>



            </div><!--fim da div content -->


        </div>
                                    
       
    </body>
     <jsp:include page="templates/footer.jsp"/>
</html>
