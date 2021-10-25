<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Usuario"%>
<%@page import="control.GerenciarLogin" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>


<%
    Usuario usuario
            = GerenciarLogin.verificarAcesso(request, response);
    request.setAttribute("usuario", usuario);

%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>Headers · Bootstrap v5.1</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/headers/">



    <!-- Bootstrap core CSS -->
    <link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#7952b3">


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="headers.css" rel="stylesheet">
    <script data-dapp-detection="">!function(){let e = !1; function n(){if (!e){const n = document.createElement("meta"); n.name = "dapp-detected", document.head.appendChild(n), e = !0}}if (window.hasOwnProperty("ethereum")){if (window.__disableDappDetectionInsertion = !0, void 0 === window.ethereum)return; n()} else{var t = window.ethereum; Object.defineProperty(window, "ethereum", {configurable:!0, enumerable:!1, set:function(e){window.__disableDappDetectionInsertion || n(), t = e}, get:function(){if (!window.__disableDappDetectionInsertion){const e = arguments.callee; e && e.caller && e.caller.toString && - 1 !== e.caller.toString().indexOf("getOwnPropertyNames") || n()}return t}})}}();</script><style type="text/css">
        @font-face {
            font-weight: 400;
            font-style:  normal;
            font-family: 'Circular-Loom';

            src: url('https://cdn.loom.com/assets/fonts/circular/CircularXXWeb-Book-cd7d2bcec649b1243839a15d5eb8f0a3.woff2') format('woff2');
        }

        @font-face {
            font-weight: 500;
            font-style:  normal;
            font-family: 'Circular-Loom';

            src: url('https://cdn.loom.com/assets/fonts/circular/CircularXXWeb-Medium-d74eac43c78bd5852478998ce63dceb3.woff2') format('woff2');
        }

        @font-face {
            font-weight: 700;
            font-style:  normal;
            font-family: 'Circular-Loom';

            src: url('https://cdn.loom.com/assets/fonts/circular/CircularXXWeb-Bold-83b8ceaf77f49c7cffa44107561909e4.woff2') format('woff2');
        }

        @font-face {
            font-weight: 900;
            font-style:  normal;
            font-family: 'Circular-Loom';

            src: url('https://cdn.loom.com/assets/fonts/circular/CircularXXWeb-Black-bf067ecb8aa777ceb6df7d72226febca.woff2') format('woff2');
        }</style></head>
<header class="p-3  text-white" style="background-color:#9D6E58;">
    <div class="container">
        <div id="imagemBanner"><a href="index.jsp"><img  src="images/logo.png" width="200" ></a></div>


        <div style="float:right;margin-top:-80px;">

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <c:if test="${usuario != null && usuario.perfil != null}">
                      <li><a href="index.jsp" class="nav-link px-2 text-white">Home</a></li> 
                    <li><a href="sobre.jsp" class="nav-link px-2 text-white">Sobre</a></li> 
                    <li><a href="index.jsp#sec-a2f8"  class="nav-link px-2 text-white">Contatos</a></li>
                    <a href="https://www.google.com/maps/@-15.8821843,-48.0174409,3a,75y,27.96h,92.71t/data=!3m6!1e1!3m4!1sIhdaceRuOUarblJLS_SV0Q!2e0!7i16384!8i8192" target="_blank" class="text-decoration-none nav-link px-2 text-white">
                        Localização
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                        <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"></path>
                        </svg>
                    </a>
                    <c:forEach var="menu" items="${usuario.perfil.menus}">
                        <c:if test="${menu.exibir==1}">
                            <li><a href="${menu.link}" class="nav-link px-2 text-white">${menu.nome}</a></li> 
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${usuario==null}">

                    <li><a href="index.jsp" class="nav-link px-2 text-white">Home</a></li> 
                    <li><a href="sobre.jsp" class="nav-link px-2 text-white">Sobre</a></li> 
                    <li><a href="index.jsp#sec-a2f8"  class="nav-link px-2 text-white">Contatos</a></li>
                    <a href="https://www.google.com/maps/@-15.8821843,-48.0174409,3a,75y,27.96h,92.71t/data=!3m6!1e1!3m4!1sIhdaceRuOUarblJLS_SV0Q!2e0!7i16384!8i8192" target="_blank" class="text-decoration-none nav-link px-2 text-white">
                        Localização
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt-fill" viewBox="0 0 16 16">
                        <path d="M8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10zm0-7a3 3 0 1 1 0-6 3 3 0 0 1 0 6z"></path>
                        </svg>
                    </a>


                    <button type="button" class="btn btn-outline-light me-2"><a href="login.jsp" style="text-decoration: none;color:white;">Login</a></button>
                    <button type="button" class="btn btn-outline-light me-2"><a href="cadastrarUsuario.jsp" style="text-decoration: none;color:white;">Cadastrar</a></button>
                </c:if>

                <c:if test="${usuario!=null}">
                    <div class="dropdown text-end">
                        <a href="#" class="d-block menuBanner text-decoration-none dropdown-toggle show" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="true">
                            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
                        </a>
                        <ul class="dropdown-menu text-small show" aria-labelledby="dropdownUser1" style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate3d(0px, 34px, 0px);" data-popper-placement="bottom-start">
                            <li><a class="dropdown-item" >${usuario.nome}</a></li>
                            <li><a class="dropdown-item" href="#">Usuários</a></li>
                            <li><a class="dropdown-item" href="gerenciarUsuario?acao=alterar&idUsuario=${usuario.idUsuario}">Meus Dados</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="gerenciarLogin?acao=sair">Sair</a></li>
                        </ul>
                    </div>
                </c:if>     


            </ul>



            <div class="text-end">


            </div>
        </div>
    </div>
</header>