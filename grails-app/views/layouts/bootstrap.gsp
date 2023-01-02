<%--
  Created by IntelliJ IDEA.
  User: jameschang
  Date: 12/16/22
  Time: 12:19 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
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
<%
    List menuL = [
            [id:"home",menuTitle:"${message(code: "default.home.label")}",controller:"manage",action:"index",iconHref:"svg/home.svg"],
            [id:"tools",menuTitle:"${message(code: "default.admin.label")}",controller:"manage",action:"admin",iconHref:"svg/tools.svg"],
    ]
%>
<main class="d-flex flex-nowrap">
    <div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;">
        <a href="${createLink(controller: "manage" ,action: "index")}" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
            <asset:image src="svg/ldap.svg" alt="home" width="40" height="32"/>
            <span class="fs-6">LDAP Manage Web</span>
        </a>
        <hr>
        <ul id="nav-i" class="nav nav-pills flex-column mb-auto">
            <g:each in="${menuL}" var="menI">
                <li class="nav-item">
                    <a id="${menI.controller}-${menI.action}" href="${createLink(controller: menI.controller ,action: menI.action)}" class="nav-link" aria-current="page">
                        <asset:image src="${menI.iconHref}" alt="${menI.controller}-${menI.action}"/>
                        ${menI.menuTitle}
                    </a>
                </li>
            </g:each>
        </ul>
        <hr>
        <div class="dropdown">
            <a href="#" class="d-flex align-items-center link-dark text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                <img src="${assetPath(src: "grails.svg")}" alt="" width="32" height="32" class="rounded-circle me-2">
                <strong>mdo</strong>
            </a>
            <ul class="dropdown-menu text-small shadow">
                <li><a class="dropdown-item" href="${createLink(controller: "manage",action: "admin")}">${message(code: "default.admin.label")}</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">About</a></li>
            </ul>
        </div>
    </div>
    <div class="" style="">
    <g:layoutBody/>
    </div>
</main>
</body>
</html>