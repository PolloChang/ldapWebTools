<%--
  Created by IntelliJ IDEA.
  User: jameschang
  Date: 12/20/22
  Time: 10:04 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="bootstrap"/>
    <script type="text/javascript">

        //設定 sidebar 選擇項目
        jQuery(function(){
            jQuery("#nav-i a").attr('class','nav-link link-dark');
            jQuery("#tools").attr('class','nav-link active');
        });
    </script>
</head>

<body>
<button
        type="button" class="btn btn-primary"
        data-dict="ajax"
        data-url="${createLink(controller: 'manage', action: 'initData')}"
        data-formId="form"
>
    ${message(code: "ldap.init.db.label")}
</button>
</body>
</html>