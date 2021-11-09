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
        import="model.Perfil"
        import="model.PerfilDAO"%>
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
        if(usuario.getPerfil().getIdPerfil()>3){



                   saida.println("<script type='text/javascript'> "+"alert('Usuário não autorizado!');"+
                   "location.href='index.jsp';</script>");
        }
     }    
    %>

<!DOCTYPE html>
<html>
    <head>
        <title>Usuários</title>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, 
              maximum-scale=1, user-scalable=no" />
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" media="all"/>
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png">
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
                        <a class="btn btn-primary btn-lg" style="background-color:#fbceb5;color:black;border-color:#fbceb5;" href="cadastrarUsuario.jsp" 
                           role="button"><i class="fas fa-user-plus"></i>&nbspNOVO USUÁRIO</a><br><br>
                        </div>
                      
                        <div class="table-responsive" style="text-align: center;">
                            <table class="table table-hover table-striped 
                                   table-bordered" id="listarUsuario">
                                <thead  style="background-color:#9D6E58;">
                                    <tr class="text-white">
                                        <th>Código</th>
                                        <th>Nome</th>
                                        <th>Login</th>
                                        <th>Status</th>
                                        <th>Perfil</th>
                                        <th>CPF</th>
                                        <th>Endereço</th>
                                        <th>Telefone</th>
                                        <th>Data de Nascimento</th>
                                        <th>Ações</th>
                                    </tr>

                                </thead>
                                <tbody>
                                    <jsp:useBean class="model.UsuarioDAO" id="udao" />
                                    
                                    <c:forEach var="usuario" items="${udao.getLista(usuario.perfil.idPerfil)}">
                                    <fmt:setLocale value="pt_BR"/>    
                                        
                                        <tr>
                                            <td>${usuario.idUsuario}</td>
                                            <td>${usuario.nome}</td>
                                            <td>${usuario.login}</td>
                                            <td><c:if test="${usuario.status==1}">Ativado</c:if> <c:if test="${usuario.status==0}">Desativado</c:if> </td>
                                            <td>${usuario.perfil.nome}</td>
                                            <td>${usuario.cpf}</td>
                                            <td>${usuario.endereco}</td>
                                            <td>${usuario.telefone}</td>
                                            <td><fmt:formatDate 
                                                    pattern="dd/MM/yyyy" 
                                                    value="${usuario.dataNascimento}"/></td>
                                            <td>
                                            <a href="gerenciarUsuario?acao=alterar&idUsuario=${usuario.idUsuario}"
                                                   class="btn btn-primary btn-xs" role="button">
                                                 <i class="fas fa-edit">&nbspAlterar</i>
                                                </a>
                                             
                                                </button>
                                                    <button   <c:if test="${usuario.status==0}"> class='btn btn-success btn-xs'</c:if> <c:if test="${usuario.status==1}"> class='btn btn-danger btn-xs'</c:if>
                                                    onclick="confirmarAtivacao('${usuario.idUsuario}', '${usuario.status}')">
                                                                <c:if test="${usuario.status==1}"> <!-- Condicional, se for igual a 1 vai escrever Exibir no Td -->
                                                                    
                                                                    <i class="fas fa-power-off">&nbspDesativar</i> 
                                                                    
                                                                </c:if>
                                                               <c:if test="${usuario.status==0}"> <!-- Condicional, se for igual a 1 vai escrever Exibir no Td -->
                                                                   <i class="fas fa-angle-double-up">&nbspAtivar</i>

                                                                </c:if>
                                                </button>
                                             
                                                
                                                  
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
                                    $("#listarUsuario").dataTable({
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
                                <script  type="text/javascript">
                                      function confirmarAtivacao(idUsuario,status){
                                                                     var mensagem;
                                                                     var controle;
                                                             
                                                                     if(status==1){
                                                                         mensagem="desativar";
                                                                         controle="desativar";
                                                                     }if(status==0){
                                                                         mensagem="ativar";
                                                                         controle="ativar";
                                                                     }
                                                                     if(confirm('Deseja realmente ' +mensagem+ ' o usuário  ?')){
                                                                                        
                                                                        location.href="gerenciarUsuario?acao="+controle+"&idUsuario="+idUsuario;
                                                                     }
                                                                
}
                           
                       </script>  
                         
                        </div>
                    </div>
                </div>



            </div><!--fim da div content -->


        </div>
                                    
       
    </body>
     <jsp:include page="templates/footer.jsp"/>
</html>
