<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}

        
    <#elseif section = "form">
        <form id="kc-passwd-update-form" class="space-y-6" action="${url.loginAction}" method="post">
            <input type="text" id="username" name="username" value="${username}" autocomplete="username" readonly="readonly" style="display:none;"/>
            <input type="password" id="password" name="password" autocomplete="current-password" style="display:none;"/>



            <div>
                <label for="password-new" class="block text-sm font-medium leading-5 text-gray-700">${msg("passwordNew")}</label>
                <div class="mt-1 rounded-md shadow-sm">
                    <input type="password" id="password-new" class="block w-full form-input sm:text-sm sm:leading-5" name="password-new" autocomplete="new-password"/>
                </div>
            </div>

            <div>
                <label for="password-confirm" class="block text-sm font-medium leading-5 text-gray-700">${msg("passwordConfirm")}</label>
                <div class="mt-1 rounded-md shadow-sm">
                    <input type="password" id="password-confirm" class="block w-full form-input sm:text-sm sm:leading-5" name="password-confirm" />
                </div>
            </div>


            <div class="${properties.kcFormGroupClass!}">
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                    </div>
                </div>

                <div id="kc-form-buttons" class="py-6">
                    <#if isAppInitiatedAction??>
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}" />
                    <button class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
                    <#else>
                    <span class="block w-full rounded-md shadow-sm">
                        <button class="flex justify-center w-full px-4 py-2 text-sm font-medium text-white transition duration-150 ease-in-out border border-transparent rounded-md bg-primary-600 hover:bg-primary-500 focus:outline-none focus:border-primary-700 focus:shadow-outline-primary active:bg-primary-700" type="submit">
                        ${msg("doSubmit")}
                        </button>
                    </span>
                    </#if>
                </div>
            </div>
        </form>


    <#elseif section = "card-right">
        <div class="hidden ml-4 xl:block">
            <img class="block w-auto" src="${url.resourcesPath}/img/resetPassword.svg" alt="User resetting password">
        </div>

    </#if>
</@layout.registrationLayout>
