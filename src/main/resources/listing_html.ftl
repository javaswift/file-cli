<!DOCTYPE html>
<html>

    <head>
<#if !containerName??>
        <title>SIS / All Containers</title>
</#if>
<#if containerName??>
        <title>SIS / Container / ${containerName}</title>
</#if>
        <script>
            function confirmDelete(containerName, objectName)
            {
                if (confirm("Are you sure you want to delete this Object?") == true) {
                    var xmlHttp = new XMLHttpRequest();
                    xmlHttp.open( "DELETE", "/object/"+containerName+"/"+objectName, false );
                    xmlHttp.send( null );

                    window.open(window.location, "_self", false);
                }
                event.preventDefault();
            }
        </script>
    </head>

    <body>


<#if !containerName??>
    <#list containers as container>
        <h1><a href="container/${container.name}">${container.name}</a></h1>
        <ul>
    <#list container.objects as object>
            <li><a href="${object.tempUrl}">${object.name}</a> (${object.size}) | <a href="" onclick="var event=arguments[0] || window.event; confirmDelete('${container.name}', '${object.name}')">delete</a></li>
    </#list>
        </ul>
    </#list>
</#if>

<#if containerName??>
        <p><a href="/">&lt;&lt; Back</a></p>
        <h1>${containerName}</h1>
        <ul>
        <#list objects as object>
            <li><a href="${object.tempUrl}">${object.name}</a> (${object.size}) | <a href="" onclick="var event=arguments[0] || window.event; confirmDelete('${containerName}', '${object.name}')">delete</a></li>
        </#list>
        </ul>
</#if>

    </body>

</html>