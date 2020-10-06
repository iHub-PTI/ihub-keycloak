<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
        <form id="kc-register-form" class="space-y-6" action="${url.registrationAction}" method="post">

            <#--  class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}"  -->

            <div>
                <label for="email" class="block text-sm font-medium leading-5 text-gray-700">${msg("email")}</label>
                <div class="mt-1 rounded-md shadow-sm">
                    <input type="text" id="email" class="block w-full form-input sm:text-sm sm:leading-5" name="email" value="${(register.formData.email!'')}" autocomplete="email" />
                </div>
            </div>

          <#if !realm.registrationEmailAsUsername>
            <div>
                <label for="username" class="block text-sm font-medium leading-5 text-gray-700">${msg("username")}</label>
                <div class="mt-1 rounded-md shadow-sm">
                    <input type="text" id="username" class="block w-full form-input sm:text-sm sm:leading-5" name="username" value="${(register.formData.username!'')}" autocomplete="username" />
                </div>
            </div>
          </#if>

            <#if passwordRequired??>
            <div>
                <label for="password" class="block text-sm font-medium leading-5 text-gray-700">${msg("password")}</label>
                <div class="mt-1 rounded-md shadow-sm">
                    <input type="password" id="password" class="block w-full form-input sm:text-sm sm:leading-5" name="password" autocomplete="new-password"/>
                </div>
            </div>

            <div>
                <label for="password-confirm" class="block text-sm font-medium leading-5 text-gray-700">${msg("passwordConfirm")}</label>
                <div class="mt-1 rounded-md shadow-sm">
                    <input type="password" id="password-confirm" class="block w-full form-input sm:text-sm sm:leading-5" name="password-confirm" />
                </div>
            </div>
            </#if>

            <#if recaptchaRequired??>
            <div class="form-group">
                <div class="mt-1 rounded-md shadow-sm">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </div>
            </#if>

            <span class="block text-gray-600">
                Al registrarse, aceptas nuestros <a class="text-teal-500 underline">términos de servicio</a> y <a class="text-teal-500 underline">política de privacidad</a>. 
            </span>

            <span class="block w-full rounded-md shadow-sm">
                <button type="submit" class="flex justify-center w-full px-4 py-2 text-sm font-medium text-white transition duration-150 ease-in-out bg-indigo-600 border border-transparent rounded-md hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700">
                ${msg("doRegister")}
                </button>
            </span>
            
            <#--  <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
            </div>  -->

            <div class="block text-sm text-center text-gray-600">
                <span>¿Ya tienes cuenta?</span>
                <br/>
                <a href="${url.loginUrl}" class="text-indigo-600">${kcSanitize(msg("backToLogin"))?no_esc}</a>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>
