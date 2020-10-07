<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>


    <#if section = "header">
        ${msg("emailForgotTitle")}


    <#elseif section = "form">
        <form id="kc-reset-password-form" class="space-y-6 text-cool-gray-700" action="${url.loginAction}" method="post">

            <p class="my-6 text-gray-500">${msg("emailInstruction")}</p>

            <div>
                <label for="username" class="block text-sm font-medium leading-5 text-gray-700">
                    <#if !realm.loginWithEmailAllowed>
                        ${msg("username")}
                    <#elseif !realm.registrationEmailAsUsername>
                        ${msg("usernameOrEmail")}
                    <#else>
                        ${msg("email")}
                    </#if>
                </label>
                <div class="mt-1 rounded-md shadow-sm">
                    <#if auth?has_content && auth.showUsername()>
                        <input type="text" id="username" name="username" class="block w-full form-input sm:text-sm sm:leading-5" autofocus value="${auth.attemptedUsername}"/>
                    <#else>
                        <input type="text" id="username" name="username" class="block w-full form-input sm:text-sm sm:leading-5" autofocus/>
                    </#if>
                </div>
            </div>

            <div id="kc-form-buttons" class="py-6">
                <span class="block w-full rounded-md shadow-sm">
                    <button class="flex justify-center w-full px-4 py-2 text-sm font-medium text-white transition duration-150 ease-in-out bg-indigo-600 border border-transparent rounded-md hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700" type="submit">
                      ${msg("doSubmit")}
                    </button>
                </span>
            </div>

        </form>

    <#elseif section = "footer-right">
        <div class="hidden ml-4 xl:block">
            <img class="block w-auto" src="${url.resourcesPath}/img/placeholder.svg" alt="placeholder">
        </div>

    <#elseif section = "footer">
        <div class="inline-flex items-center text-sm leading-5 text-indigo-600">
            <svg class="w-5 h-5 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" />
            </svg>
            <a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a>
        </div>
    </#if>

</@layout.registrationLayout>
