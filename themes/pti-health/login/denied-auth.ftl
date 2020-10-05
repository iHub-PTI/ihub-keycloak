<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "form">
    <div id="kc-info-message">
        <p class="instruction">${kcSanitize(msg("validationRequired"))?no_esc}</p>
    </div>
    <#if client?? && client.baseUrl?has_content>
        <p><a id="backToApplication" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
    </#if>
    </#if>
</@layout.registrationLayout>