<%-- 
    Document   : index
    Created on : 17 de ago. de 2021, 16:26:47
    Author     : vitor
--%>

<%@page import="model.Agendamento"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="control.GerenciarLogin"%>
<%@page import="model.Usuario"%>
<%@page import="model.UsuarioDAO"%>
<%@page import="model.AgendamentoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"
        import="java.util.ArrayList"
        import="model.Perfil"
        import="model.PerfilDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>


<!DOCTYPE html>
<html>
    <head>
        <title>Meus Agendamentos</title>
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
        <%   
         Usuario usuario = new Usuario();
    usuario = GerenciarLogin.verificarAcesso(request, response);
    PrintWriter saida = response.getWriter();
     if(usuario==null){
                     out.println("<script type='text/javascript'> "+
                     "location.href='login.jsp';</script>"); 
    }else{
        if(usuario.getPerfil().getIdPerfil()<=3){



                   saida.println("<script type='text/javascript'> "+"alert('Usuário não autorizado!');"+
                   "location.href='index.jsp';</script>");
        }
     }   
   
   
    %>
        
        <div id="container">
            
            <div id="menu">

                <jsp:include page="templates/menu.jsp"/>

            </div><!-- fim da div menu -->
            <div id="content" style="padding-top: 10px">
                <div class="h-100 justify-content-center align-items-center">
                    <div clas="col-12">
                       <div class="col-sm-2 col-12" style="padding-bottom: 10px">
                        <a class="btn btn-primary btn-lg" style="background-color:#fbceb5;color:black;border-color:#fbceb5;" href="agendamento.jsp" 
                           role="button"><i class="fas fa-user-plus"></i>&nbspNOVO AGENDAMENTO</a>
                       </div><br><br>
                      
                        <div class="table-responsive" style="text-align: center;">
                            <table class="table table-hover table-striped 
                                   table-bordered" id="listarServico">
                                <thead  style="background-color:#9D6E58;">
                                    <tr class="text-white">
                                        <th>Agendamento</th>
                                        <th>Serviço</th>
                                        <th>Horário</th>
                                        <th>Duração(minutos)</th>
                                        <th>Status</th>
                                        <th>Atendente</th>
                                        
                                        <th>Data de Serviço</th>
                                        <th>Valor</th>
                                        <th>Ação</th>
                                    </tr>

                                </thead>
                                <tbody>
                                    <jsp:useBean class="model.AgendamentoDAO" id="agenda" />
                                    <jsp:useBean class="model.UsuarioDAO" id="udao" />
                                
                                
                                    
                                    <c:forEach var="agendamentos" items="${agenda.meusAgendamentos(usuario.idUsuario,usuario.perfil.idPerfil)}">
                                    <fmt:setLocale value="pt_BR"/>    
                                        
                                        <tr>
                                            <td>${agendamentos.agendamento.idAgendamento}</td>
                                            <td>${agendamentos.servico.nome}</td>
                                             <td><fmt:formatDate 
                                                    pattern="HH:mm" 
                                                    value="${agendamentos.horario}"/></td>
                                            <td>${agendamentos.servico.duracao}</td>
                                            <td><c:if test="${agendamentos.status==3}">A confirmar</c:if>
                                                    <c:if test="${agendamentos.status==2}">Cancelado</c:if>
                                                    <c:if test="${agendamentos.status==1}">Confirmado</c:if>
                                            </td>
                                          
                                            <c:forEach var="atendente" items="${udao.verificarAtendente(agendamentos.idAtendente)}">
                                                <td>${atendente.nome}</td>
                                            </c:forEach>
                                            
                                           
                                            
                                          
                                             
                                            <td><fmt:formatDate 
                                                    pattern="dd/MM/yyyy" 
                                                    value="${agendamentos.agendamento.dataAgendamento}"/></td>        
                                            <td><fmt:formatNumber value = "${agendamentos.servico.preco}" type = "currency"/></td>
                                            
                                            <td>
                                                    <c:if test="${agendamentos.status==3}">
                                                     
                                                    <button class='btn btn-warning btn-xs'
                                                        onclick="confirmarServico('${agendamentos.agendamento.idAgendamento}','2','${usuario.idUsuario}')">
                                                        <i  class="fas fa-hourglass-half">&nbspEm Espera</i>
                                                    </button>
                                                     <script  type="text/javascript">
                                           function confirmarServico(idAgendamento,status,idUsuario){
                                                                        var mensagem="";
                                                                        
                                                                        if(status==1){
                                                                            mensagem="confirmar";
                                                                        }if(status==2){
                                                                            mensagem="cancelar";
                                                                        }
                                                              
                                                                         if(confirm('Deseja realmente '+mensagem+' o serviço?')){
                                                                                           
                                                                            location.href="gerenciarAgendamento?acao="+mensagem+"&idAgendamento="+idAgendamento+"&status="+status+"&idUsuario="+idUsuario;
                                                                         }
                                                                   

                                                              
    }

                                                        </script>  
                                                    
                                                    
                                                </c:if>
                                                 <c:if test="${agendamentos.status==2}">
                                                           <button class='btn btn-danger btn-xs'
                                                       >
                                                        <i class="fas fa-ban">&nbspCancelado</i>
                                                        </button>   
                                                        
                                                 </c:if>
                                                <c:if test="${agendamentos.status==1}">
                                                           <button class='btn btn-success btn-xs'
                                                       >
                                                                        <i class="fas fa-thumbs-up">&nbspConfirmado</i>
                                                           </button>   
                                                           
                                                        
                                                 </c:if>            

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
                                    $("#listarServico").dataTable({
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