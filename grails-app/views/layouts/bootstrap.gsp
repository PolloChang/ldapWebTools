<%--
  Created by IntelliJ IDEA.
  User: jameschang
  Date: 12/16/22
  Time: 12:19 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%
    List menuL = [
            [menuTitle:"${message(code: "default.home.label")}",controller:"base",action:"index",iconHref:"svg/home.svg"],
            [menuTitle:"Ldap帳號註冊",controller:"manage",action:"index"],
            [menuTitle:"${message(code: "default.admin.label")}",controller:"manage",action:"admin",iconHref:"svg/tools.svg"],
    ]
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <asset:link rel="icon" href="svg/ldap.svg" type="image/x-ico"/>
    <title><g:layoutTitle default="LDAP Manage Web"/></title>
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>

    <asset:stylesheet src="sidebars.css"/>
    <asset:javascript src="sidebars.js"/>
    <style>
        .bi {
        vertical-align: -.125em;
        fill: currentColor;
        }

        .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
        }
    </style>
    <script type="text/javascript">

        //設定 sidebar 選擇項目
        jQuery(function(){
            jQuery("#nav-i a").attr('class','nav-link link-dark');
            jQuery("#${controllerName}-${actionName}").attr('class','nav-link active');
        });
    </script>
    <g:layoutHead/>
</head>

<body>
<nav
    class="
    navbar navbar-dark sticky-top bg-primary flex-md-nowrap p-03
">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="${createLink(controller: "manage" ,action: "index")}">
        <asset:image src="svg/ldap.svg" alt="home" width="40" height="32"/>
        <span class="fs-6">${message(code: "base.app.label")}</span>
    </a>
    <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a class="nav-link" href="#">Sign out</a>
        </li>
    </ul>
</nav>
<div class="container-fluid">
    <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
                <ul id="nav-i" class="nav  flex-column ">
                    <g:each in="${menuL}" var="menI">
                        <li class="nav-item">
                            <a id="${menI.controller}-${menI.action}" href="${createLink(controller: menI.controller ,action: menI.action)}" class="nav-link" aria-current="page">
                                <g:if test="${menI.iconHref}">
                                    <asset:image src="${menI.iconHref}" alt="${menI.controller}-${menI.action}"/>
                                </g:if>
                                <g:else>
                                    <asset:image src="svg/default.svg" alt="${menI.controller}-${menI.action}"/>
                                </g:else>
                                ${menI.menuTitle}
                            </a>
                        </li>
                    </g:each>
                </ul>
            </div>
        </nav>
        <main class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active" aria-current="page">
                    </li>
                </ol>
            </nav>
            <div>
                <g:layoutBody/>
            </div>
        </main>
    </div>
</div>
%{--<main class="d-flex flex-nowrap">--}%
%{--    <div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;">--}%

%{--        <hr>--}%
%{--        <div class="dropdown">--}%
%{--            <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">--}%
%{--                <img src="${assetPath(src: "svg/grails.svg")}" alt="" width="32" height="32" class="rounded-circle me-2">--}%
%{--                <strong>mdo</strong>--}%
%{--            </a>--}%
%{--            <ul class="dropdown-menu text-small shadow">--}%
%{--                <li><a class="dropdown-item" href="${createLink(controller: "manage",action: "admin")}">${message(code: "default.admin.label")}</a></li>--}%
%{--                <li><hr class="dropdown-divider"></li>--}%
%{--                <li><a class="dropdown-item" href="#">About</a></li>--}%
%{--            </ul>--}%
%{--        </div>--}%
%{--    </div>--}%
%{--    <div class="" style="">--}%
%{--    <g:layoutBody/>--}%
%{--    </div>--}%
%{--</main>--}%
</body>
</html>