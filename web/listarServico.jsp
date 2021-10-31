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


<!DOCTYPE html>
<html>
    <head>
        <title>Listagem de Perfis</title>
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
                        <a class="btn btn-primary btn-lg" style="background-color:#fbceb5;color:black;border-color:#fbceb5;" href="cadastrarServico.jsp" 
                           role="button"><i class="fas fa-user-plus"></i>&nbspNOVO SERVICO</a>
                        </div>
                      
                        <div class="table-responsive" style="text-align: center;">
                            <table class="table table-hover table-striped 
                                   table-bordered" id="listarPerfil">
                                <thead  style="background-color:#9D6E58;">
                                    <tr class="text-white">
                                        <th>Código</th>
                                        <th>Nome</th>
                                        <th>Descrição</th>
                                        <th>Preço</th>
                                        <th>Duração(Minutos)</th>
                                        <th>Ação</th>
                                    </tr>

                                </thead>
                                <tbody>
                                    <jsp:useBean class="model.ServicoDAO" id="sdao" />
                                    
                                    <c:forEach var="servico" items="${sdao.servicos()}">
                                    <fmt:setLocale value="pt_BR"/>    
                                        
                                        <tr>
                                            <td>${servico.idServico}</td>
                                            <td>${servico.nome}</td>
                                            <td>${servico.descricao}</td>
                                            <td><fmt:formatNumber value = "${servico.preco}" type = "currency"/> </td>
                                            <td>${servico.duracao}</td>
                                            <td>
                                            `<a href="gerenciarServico?acao=alterar&idServico=${servico.idServico}"
                                                   class="btn btn-primary btn-xs" role="button">
                                                 <i class="fas fa-edit">&nbspAlterar</i>
                                                </a>
                                                 <script  type="text/javascript">
                                      function confirmarExclusaoPerfil(idServico,nome,senha){
                                                           var mensagem;
                                                           var n1=0;
                                                           
                                                           do{
                                                             var confirmacao= window.prompt("Confirme a senha de administrador");  
                                                                if(confirmacao==senha){
                                                                     
                                                                     if(confirm('Deseja realmente excluir o perfil ' +nome+ ' ?')){
                                                                         return true;               
                                                                        location.href="gerenciarPerfil?acao=excluir&idUsuario="+idPerfil;
                                                                     }
                                                                }else{
                                                                      if(confirmacao==null){
                                                                          break;
                                                                      }  

                                                                      window.alert("Senha incorreta, tente novamente!");
                                                                      n1++;
                                                                      
                                                                      if(n1==3){
                                                                         window.alert("Tente novamente mais tarde!"); 
                                                                         break;
                                                                      }

                                                                    }
                                                                     
                                                            }while(confirmacao!=senha);
                                                            
                        function confirmarLoop(idPerfil,nome,senha){
                            if(confirmarExclusaoPerfil()==true){
                                location.href="gerenciarServico?acao=excluir&idServico="+idServico;
                            }else{
                               confirmarExclusaoPerfil(idPerfil,nome,senha); 
                            }
                        }                                    
}
                           
                                                    </script>  
                                                <button class='btn btn-danger btn-xs'
                                                    onclick="confirmarExclusaoPerfil('${p.idPerfil}','${p.nome}','${usuarioLogado.senha}')">
                                                    <i class="fas fa-trash">&nbspExcluir</i>
                                                </button>
                                                  
                                            </td>  
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>
                            <script src="js/jquery-3.6.0.min.js"></script>
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                            <script src="datatables/jquery.dataTables.min.js"></script>
                            <script src="datatables/dataTables.bootstrap4.min.js"></script>
                            <script>
                                $(document).ready(function () {
                                    $("#listarPerfil").dataTable({
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



                            </script>
                            <script src="js/sweetalert2.all.min.js"type="text/javascript"></script>


                        </div>
                    </div>
                </div>



            </div><!--fim da div content -->


        </div>

       
    </body>
     <jsp:include page="templates/footer.jsp"/>
</html>
