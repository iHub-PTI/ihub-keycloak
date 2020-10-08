<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>

    <#if section = "form">
        <div class="space-y-6">
            <div class="p-4 rounded-md bg-yellow-50">
                <div class="flex">
                    <div class="flex-shrink-0">
                    <svg class="w-5 h-5 text-yellow-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd" />
                    </svg>
                    </div>
                    <div class="ml-3">
                    <h3 class="text-sm font-medium leading-5 text-yellow-800">
                        Doctor Validation required
                    </h3>
                    <div class="mt-2 text-sm leading-5 text-yellow-700">
                        <p>
                        Valida tu cuenta en el Ministerio de Salud Pública y Bienestar Social.
                        </p>
                    </div>
                    </div>
                </div>
            </div>
            <p class="text-sm leading-5 text-center text-gray-500">
                Para la validación de tu cuenta como médico habilitado es necesario acercarse de forma presencial al Ministerio de Salud Pública y Bienestar Social (MSPBS).
                <br>
                Luego recibirás un correo de confirmación para empezar usar las aplicaciones de Telemedicina.
            </p>
            <#--  <div id="kc-info-message">
                <p class="instruction">${kcSanitize(msg("validationRequired"))?no_esc}</p>
            </div>  -->

        </div>

    <#elseif section = "footer">
        <#if client?? && client.baseUrl?has_content>

            <div class="inline-flex items-center mt-12 text-sm leading-5 text-indigo-600">
                <svg class="w-5 h-5 mr-2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clip-rule="evenodd" />
                </svg>
                <a href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a>
            </div>


            </#if>



    </#if>
    
</@layout.registrationLayout>