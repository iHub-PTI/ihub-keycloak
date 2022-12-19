<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false displayMessage=false displayWide=(realm.password && social.providers??); section>
            
    <#if section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-sms-code-login-form" class="space-y-6 text-cool-gray-700" id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <div>
                        <span>${msg("smsAuthInstruction")}</span>
                    </div>
                    <div>
                        <label for="code" class="block text-sm font-medium leading-5">${msg("smsAuthLabel")}</label>
                        <div class="relative mt-1 rounded-md shadow-sm">
                            <input tabindex="1" id="code" type="text" class="block w-full form-input sm:text-sm sm:leading-5" name="code"/>
                        </div>
                    </div>
                
                    <div id="kc-form-buttons" class="py-6">

                        <span class="block w-full rounded-md shadow-sm">
                            <button tabindex="4" class="flex justify-center w-full px-4 py-2 text-sm font-medium text-white transition duration-150 ease-in-out border border-transparent rounded-md bg-primary-600 hover:bg-primary-500 focus:outline-none focus:border-primary-700 focus:shadow-outline-primary active:bg-primary-700" name="login" id="kc-login" type="submit">${msg("doSubmit")}</button>
                        </span>
                    </div>

                </form>
            </div>
            
        </div>
    </#if>
</@layout.registrationLayout>
