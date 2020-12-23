<#import "template.ftl" as layout>
<@layout.registrationLayout; section>


    <#if section = "header">
        ${msg("pageExpiredTitle")}


    <#elseif section = "form">
        <p id="instruction1" class="my-6 text-gray-500">
            ${msg("pageExpiredMsg1")} 
            <a id="loginRestartLink" class="text-secondary-500" href="${url.loginRestartFlowUrl}">${msg("doClickHere")}</a>.
            <br/>
            ${msg("pageExpiredMsg2")} 
            <a id="loginContinueLink" class="text-secondary-500" href="${url.loginAction}">${msg("doClickHere")}</a>.
        </p>
    </#if>

    
</@layout.registrationLayout>
