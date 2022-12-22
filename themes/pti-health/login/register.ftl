<#import "template.ftl" as layout>
<@layout.registrationLayout; section>


    <#if section = "header">
        ${msg("registerTitle")}


    <#elseif section = "text">
    <div class="hidden xl:block xl:w-500">
        <h1 class="text-5xl font-bold text-primary-600">¡Empecemos!</h1>
        <p class="text-2xl text-gray-500">Crea tu cuenta para usar todas las funcionalidades de Boldo, es totalmente gratuita. Todos los datos se almacenan de forma segura.</p>
    </div>


    <#elseif section = "form">
        <form id="kc-register-form" class="space-y-6" action="${url.registrationAction}" method="post">

            <#--  class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}"  -->

            <div class="w-full ">
                <label for="phone" class="block text-sm font-medium leading-5 text-gray-700">${msg("phone")}</label>
                <div class="w-full flex">
                    <select
                            id="country_code"
                            style="width: 30%; margin-right: 2px;"
                            class="form-select mt-1"
                            name="country_code"
                            value="${(register.formData['country_code']!'')}">
                        <option value="+595" <#if ((register.formData['country_code']!'') == "+595")> selected="selected"</#if>>🇵🇾+595</option>
                        <option value="+55" <#if ((register.formData['country_code']!'') == "+55")> selected="selected"</#if>>🇧🇷+55</option>
                    </select>
                    <input type="text" id="phone" style="width: 70%;" class="form-input mt-1 w-10 sm:col-span-6" name="phone" value="${(register.formData.phone!'')}" autocomplete="phone"
                    placeholder="981123123"/>
                </div>
            </div>
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
                    <input type="tel" id="username" class="block w-full form-input sm:text-sm sm:leading-5" name="username" value="${(register.formData.username!'')}" autocomplete="cedula" />
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

            <#if client.clientId=='boldo-patient'>
                <div>
                    <label for="healthcare_organization" class="block text-sm font-medium leading-5 text-gray-700">${msg("healthAttentionOrganization")}</label>
                    <div class="mt-1 rounded-md shadow-sm">
                        <select
                                id="healthcare_organization"
                                class="block w-full form-select sm:text-sm sm:leading-5"
                                name="healthcare_organization"
                                value="${(register.formData['healthcare_organization']!'')}">
                            <option value="" <#if ((register.formData['healthcare_organization']!'') == "")> selected="selected"</#if>>--Selecciona uno--</option>
                            <option value="32664" <#if ((register.formData['healthcare_organization']!'') == "32664")> selected="selected"</#if>>Centro Ambulatorio Básico - Fundación Tesãi</option>
                            <option value="-1" <#if ((register.formData['healthcare_organization']!'') == "-1")> selected="selected"</#if>>No estoy seguro</option>
                        </select>
                    </div>
                </div>
            </#if>

            <span class="block text-sm leading-5 text-gray-500">
                Al registrarse, aceptas nuestros <a class="text-secondary-500">términos de servicio</a> y <a class="text-secondary-500">política de privacidad</a>. 
            </span>

            <div id="kc-form-buttons" class="py-6">
                <span class="block w-full rounded-md shadow-sm">
                    <button type="submit" class="flex justify-center w-full px-4 py-2 text-sm font-medium text-white transition duration-150 ease-in-out border border-transparent rounded-md bg-primary-600 hover:bg-primary-500 focus:outline-none focus:border-primary-700 focus:shadow-outline-primary active:bg-primary-700">
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
                <a href="${url.loginUrl}" class="text-secondary-500">${kcSanitize(msg("backToLogin"))?no_esc}</a>
            </p>
        </div>

    </#if>
</@layout.registrationLayout>
