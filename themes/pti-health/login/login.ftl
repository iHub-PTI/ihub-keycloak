<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>


    <#if section = "header">
        ${msg("doLogIn")}

    <#elseif section = "text">
        <div class="hidden xl:block xl:w-500">
            <h1 class="text-5xl font-bold text-cool-gray-700">Bienvenido!</h1>
            <p class="text-2xl text-gray-500">Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p>
        </div>
            
    <#elseif section = "form">
        <div id="kc-form">
        <div id="kc-form-wrapper">
            <#if realm.password>
                <form class="space-y-6 text-cool-gray-700" id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">

                    <div>
                        <label for="username" class="block text-sm font-medium leading-5"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                        <div class="relative mt-1 rounded-md shadow-sm">
                            <#if usernameEditDisabled??>
                                <input tabindex="1" id="username" class="block w-full form-input sm:text-sm sm:leading-5" name="username" value="${(login.username!'')}" type="text" disabled />
                            <#else>
                                <input tabindex="1" id="username" class="block w-full form-input sm:text-sm sm:leading-5" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off" />
                            </#if>
                        </div>
                    </div>
                
                
                    <div>
                        <label for="password" class="block text-sm font-medium leading-5">${msg("password")}</label>
                        <div class="relative mt-1 rounded-md shadow-sm">
                            <input tabindex="2" id="password" class="block w-full form-input sm:text-sm sm:leading-5" name="password" type="password" autocomplete="off" />
                        </div>
                        <#if realm.resetPasswordAllowed>
                            <p class="w-full mt-2 text-sm text-right text-indigo-600"><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></p>
                        </#if>
                    </div>

                    <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                        <div id="kc-form-options">
                            <#if realm.rememberMe && !usernameEditDisabled??>
                                <div class="checkbox">
                                    <label>
                                        <#if login.rememberMe??>
                                            <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                        <#else>
                                            <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                        </#if>
                                    </label>
                                </div>
                            </#if>
                        </div>
                    </div>


                    <div id="kc-form-buttons" class="py-6">
                        <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>

                        <span class="block w-full rounded-md shadow-sm">
                            <button tabindex="4" class="flex justify-center w-full px-4 py-2 text-sm font-medium text-white transition duration-150 ease-in-out bg-indigo-600 border border-transparent rounded-md hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700" name="login" id="kc-login" type="submit">${msg("doLogIn")}</button>
                        </span>
                    </div>

                </form>
            </#if>
        </div>
        
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                    <#list social.providers as p>
                        <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span>${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
        
        </div>

    <#elseif section = "footer">
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration" class="block text-sm leading-5 text-center text-gray-500">
                <p>
                    ${msg("noAccount")}
                    <br/>
                    <a href="${url.registrationUrl}" class="text-indigo-600">${msg("doRegister")}</a>
                </p>
            </div>
        </#if>

    </#if>

</@layout.registrationLayout>
