<%--
  Created by IntelliJ IDEA.
  User: jameschang
  Date: 12/15/22
  Time: 11:39 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="bootstrap"/>
</head>

<body>
<g:form name="content-form">
    Email:<g:textField name="email" />
    password:<g:passwordField name="password" />
</g:form>
<button
    type="button" class="btn btn-primary"
    data-dict="ajax"
    data-url="${createLink(controller: 'manage', action: 'creatAccount')}"
    data-form-id="content-form"
    >
    ${message(code: "default.button.create.account.label")}
</button>

</body>
</html>