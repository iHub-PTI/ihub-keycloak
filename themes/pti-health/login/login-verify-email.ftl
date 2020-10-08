<#import "template.ftl" as layout>
<@layout.registrationLayout; section>

    <#if section = "header">
        ${msg("emailVerifyTitle")}

        
    <#elseif section = "form">
        <div class="mx-12 space-y-6 text-sm leading-5 text-center text-gray-500">
            <p>
                ${msg("emailVerifyInstruction1")}
            </p>
            <p>
                ${msg("emailVerifyInstruction2")} 
                <br>
                <a href="${url.loginAction}" class="text-indigo-600">${msg("doClickHere")}</a> 
                ${msg("emailVerifyInstruction3")}
            </p>
        </div>

    <#elseif section = "footer">
        <div class="inline-flex items-center mt-12 text-sm leading-5 text-indigo-600">
            <svg class="w-5 h-5 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" />
            </svg>
            <a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a>
        </div>
        
    </#if>

</@layout.registrationLayout>