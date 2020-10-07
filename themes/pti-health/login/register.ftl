<#import "template.ftl" as layout>
<@layout.registrationLayout; section>


    <#if section = "header">
        ${msg("registerTitle")}


    <#elseif section = "text">
    <div class="hidden xl:block xl:w-500">
        <h1 class="text-5xl font-bold text-cool-gray-700">XXX <span class="text-indigo-600">Telemedicina</span></h1>
        <p class="text-2xl text-gray-500">Especifíca tu disponibilidad para las consultas remotas y atiende a tus pacientes en línea de forma fácil y rápida.</p>
    </div>


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

            <span class="block text-sm leading-5 text-gray-500">
                Al registrarse, aceptas nuestros <a class="text-indigo-600">términos de servicio</a> y <a class="text-indigo-600">política de privacidad</a>. 
            </span>

            <div id="kc-form-buttons" class="py-6">
                <span class="block w-full rounded-md shadow-sm">
                    <button type="submit" class="flex justify-center w-full px-4 py-2 text-sm font-medium text-white transition duration-150 ease-in-out bg-indigo-600 border border-transparent rounded-md hover:bg-indigo-500 focus:outline-none focus:border-indigo-700 focus:shadow-outline-indigo active:bg-indigo-700">
                    ${msg("doRegister")}
                    </button>
                </span>
            </div>


        </form>


    <#elseif section = "footer">
        <div class="block text-sm leading-5 text-center text-gray-500">
            <p>
                ¿Ya tienes cuenta?
                <br/>
                <a href="${url.loginUrl}" class="text-indigo-600">${kcSanitize(msg("backToLogin"))?no_esc}</a>
            </p>
        </div>

    </#if>
</@layout.registrationLayout>
