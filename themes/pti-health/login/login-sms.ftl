<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false displayMessage=false displayWide=(realm.password && social.providers??); section>
    
    <#if section = "form">
        <#if changeNumber == false>
            <div id="kc-form">
                <div id="kc-form-wrapper">
                    <form id="kc-sms-code-login-form" class="space-y-6 text-cool-gray-700" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                        <div>
                            <span>${msg("smsAuthInstruction")} ${(phone)}</span>
                        </div>
                        <div>
                        <input id="changeNumber" name="changeNumber" style="display: none">
                            <#--  <button tabindex="4" class="flex justify-center w-full px-4 py-2 text-sm font-medium text-white transition duration-150 ease-in-out border border-transparent rounded-md bg-primary-600 hover:bg-primary-500 focus:outline-none focus:border-primary-700 focus:shadow-outline-primary active:bg-primary-700"
                            onclick="changeNumber = true">"Cambiar numero"</button>  -->
                        </div>
                        <div>
                            <label for="code" class="block text-sm font-medium leading-5">${msg("smsAuthLabel")}</label>
                            <div class="relative mt-1 rounded-md shadow-sm">
                                <input tabindex="1" id="code" type="text" class="block w-full form-input sm:text-sm sm:leading-5" name="code"/>
                            </div>
                        </div>
                        <div>
                        
                            <a class="text-sm text-right text-secondary-500" style="cursor: pointer" onclick="changeNumberss()"
                                
                                name="try-again" id="kc-try-again"
                            >Reenviar código</a>
                        </div>
                        <div id="kc-form-buttons" class="py-6">

                            <span class="block w-full rounded-md shadow-sm">
                                <button tabindex="4" class="flex justify-center w-full px-4 py-2 text-sm font-medium text-white transition duration-150 ease-in-out border border-transparent rounded-md bg-primary-600 hover:bg-primary-500 focus:outline-none focus:border-primary-700 focus:shadow-outline-primary active:bg-primary-700" name="login" id="kc-login" type="submit">${msg("doSubmit")}</button>
                            </span>
                        </div>

                    </form>
                </div>
                
            </div>
        <#else>
            <div id="kc-form-repeat">
                <div id="kc-form-wrapper-repeat">
                    <form id="kc-sms-code-resend-form" class="space-y-6 text-cool-gray-700" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                        <div>
                            <span>${msg("resendCodeAuthInstruction")}</span>
                            <pre>${phone}</pre>
                        </div>
                        <div>
                            <input id="changeNumber" name="changeNumber" style="visibility: hidden" value="true">
                            <label for="phone" class="block text-sm font-medium leading-5">${msg("phone")}</label>
                                <div class="relative mt-1 rounded-md shadow-sm">
                                <input tabindex="1" id="phone" type="text" class="block w-full form-input sm:text-sm sm:leading-5" value="${(phone)!}" name="phone"/>
                            </div>
                        </div>
                    
                        <div id="kc-form-buttons" class="py-6">

                            <span class="block w-full rounded-md shadow-sm">
                                <button tabindex="4" class="flex justify-center w-full px-4 py-2 text-sm font-medium text-white transition duration-150 ease-in-out border border-transparent rounded-md bg-primary-600 hover:bg-primary-500 focus:outline-none focus:border-primary-700 focus:shadow-outline-primary active:bg-primary-700" name="resend" id="kc-resend" type="submit">${msg("resendCode")}</button>
                            </span>
                        </div>

                    </form>
                </div>
                
            </div>
        </#if>
    </#if>
    <script type="text/javascript">
        changeNumberss = () => {
            document.getElementById('changeNumber').value = true;
            document.getElementById('kc-sms-code-login-form').submit();
        }
    </script>
</@layout.registrationLayout>
