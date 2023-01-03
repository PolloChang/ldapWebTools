<%--
  Created by IntelliJ IDEA.
  User: pollochang
  Date: 1/2/23
  Time: 3:17 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="bootstrap"/>
</head>

<body>

<div class="row h-50">
    <div class="col-4">
        <div id="list-example" class="list-group">
            <a class="list-group-item list-group-item-action" href="#system-1">系統資訊</a>
            <a class="list-group-item list-group-item-action" href="#system-2">目前系統狀態</a>
            <a class="list-group-item list-group-item-action" href="#system-3">已安裝的套件(Plugins)</a>
            <a class="list-group-item list-group-item-action" href="#system-4">已開發的系統元件</a>
            <a class="list-group-item list-group-item-action" href="#system-5">Controller 清單</a>
            <a class="list-group-item list-group-item-action" href="#system-6">Service 清單</a>
            <a class="list-group-item list-group-item-action" href="#system-7">Domain 清單</a>
            <a class="list-group-item list-group-item-action" href="#system-8">TagLib 清單</a>
        </div>
    </div>
    <div class="col-8">
        <div data-bs-spy="scroll" data-bs-target="#list-example" data-bs-offset="0" tabindex="0"
            style="position: relative;height: 80vh;overflow: auto;"
        >
            <h4 id="system-1">系統資訊</h4>
            <p>Environment: ${grails.util.Environment.current.name}</p>
            <p>App profile: ${grailsApplication.config.getProperty('grails.profile')}</p>
            <p>App version:<g:meta name="info.app.version"/></p>
            <p>Grails version:
            <g:meta name="info.app.grailsVersion"/>
            </p>
            <p>Groovy version: ${GroovySystem.getVersion()}</p>
            <p>JVM version: ${System.getProperty('java.version')}</p>

            <h4 id="system-2">目前系統狀態</h4>
            <p>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</p>
            <h4 id="system-3">已安裝的套件(Plugins)</h4>
            <g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">
                <p>${plugin.name} - ${plugin.version}</p>
            </g:each>

            <h4 id="system-4">已開發的系統元件數量</h4>
            <p>Controllers: ${grailsApplication.controllerClasses.size()}</p>
            <p>Domains: ${grailsApplication.domainClasses.size()}</p>
            <p>Services: ${grailsApplication.serviceClasses.size()}</p>
            <p>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</p>

            <h4 id="system-5">Controller 清單</h4>
            <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                <p>
                    <g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link>
                </p>
            </g:each>

            <h4 id="system-6">Service 清單</h4>
            <g:each var="c" in="${grailsApplication.serviceClasses.sort { it.fullName } }">
                <p>
                    ${c.fullName}
                </p>
            </g:each>

            <h4 id="system-7">Domain 清單</h4>
            <g:each var="c" in="${grailsApplication.domainClasses.sort { it.fullName } }">
                <p>
                    ${c.fullName}
                </p>
            </g:each>

            <h4 id="system-8">TagLib 清單</h4>
            <g:each var="c" in="${grailsApplication.tagLibClasses.sort { it.fullName } }">
                <p>
                    ${c.fullName}
                </p>
            </g:each>
        </div>
    </div>
</div>
</body>
</html>