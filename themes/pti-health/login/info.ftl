<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>

    <#if section = "header">
        <#if messageHeader??>
            ${messageHeader}
        <#else>
            ${message.summary}
        </#if>

        
    <#elseif section = "form">
        <div id="kc-info-message">
            <p class="text-gray-500">
                <#if requiredActions??>
                    ${message.summary}
                    <#list requiredActions>: 
                        <b>
                            <#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#items>
                        </b>
                    </#list>
                    <#else>
                </#if>
            </p>

        </div>


    <#elseif section = "footer">
        <#if skipLink??>
        <#else>
            <div class="inline-flex items-center mt-12 text-sm leading-5 text-indigo-600">
                <svg class="w-5 h-5 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" />
                </svg>

                <#if pageRedirectUri?has_content>
                    <p><a href="${pageRedirectUri}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                <#elseif actionUri?has_content>
                    <p><a href="${actionUri}">${kcSanitize(msg("proceedWithAction"))?no_esc}</a></p>
                <#elseif (client.baseUrl)?has_content>
                    <p><a href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a></p>
                </#if>
            </div>
        </#if>

    </#if>
    
</@layout.registrationLayout>