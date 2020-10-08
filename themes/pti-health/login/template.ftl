<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false showAnotherWayIfPresent=true>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
        <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    
    <title>${msg("loginTitle",(realm.displayName!''))}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <link rel="stylesheet" href="${url.resourcesPath}/css/styles.output.css">
    <link rel="stylesheet" href="https://rsms.me/inter/inter.css" />

    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
        <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    
    <#if scripts??>
        <#list scripts as script>
        <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>

  </head>
  
  <body class="antialiased">
    <div class="fixed bottom-0 right-0 w-screen h-screen bg-right-bottom bg-no-repeat bg-contain below-md:bg-none" style="background-image: url(${url.resourcesPath}/img/background.svg)"></div>
    <div class="relative h-full">

      <nav class="px-4 mx-auto max-w-screen-2xl md:px-24 md:pt-8 md:pb-5">
        <div class="flex justify-between h-16">
            <div class="flex">
                <div class="flex items-center flex-shrink-0">
                <img class="block w-auto" style="height: 45px;" src="${url.resourcesPath}/img/iHub.svg" alt="iHub logo">
                </div>
            </div>
        </div>
      </nav>


      <div class="flex flex-col px-4 mx-auto xl:items-center xl:justify-between xl:flex-row max-w-screen-2xl md:px-24 md:mb-5">

        <#nested "text">

        <div class="px-4 py-12 bg-white xl:px-6 xl:flex-shrink-0 md:mx-auto md:shadow-2xl md:rounded-lg text-cool-gray-700">
          <div class="flex">
            <div id="card-form" class="flex flex-col justify-between w-full below-md:min-h-without-nav md:w-500">
                <div>
                    <header class="mb-12">

                    <#if realm.internationalizationEnabled  && locale.supported?size gt 1>
                        <div id="kc-locale">
                            <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                            <div class="kc-dropdown" id="kc-locale-dropdown">
                                <a href="#" id="kc-current-locale-link">${locale.current}</a>
                                <ul>
                                <#list locale.supported as l>
                                <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                                </#list>
                                </ul>
                            </div>
                            </div>
                        </div>
                    </#if>
                    
                    <#if !(auth?has_content && auth.showUsername() && !auth.showResetCredentials())>
                        <#if displayRequiredFields>
                            <div class="${properties.kcContentWrapperClass!}">
                            <div class="${properties.kcLabelWrapperClass!} subtitle">
                                <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                            </div>
                            <div>
                                <h2 id="kc-page-title"  class="text-2xl font-semibold leading-tight"> <#nested "header"> </h2>
                            </div>
                            </div>
                        <#else>
                            <div class="flex items-center">
                            <h2 id="kc-page-title" class="text-2xl font-semibold leading-tight">
                                <#nested "header">
                            </h2>
                            </div>
                        </#if>
                    <#else>
                        <#if displayRequiredFields>
                            <div class="${properties.kcContentWrapperClass!}">
                            <div class="${properties.kcLabelWrapperClass!} subtitle">
                                <span class="subtitle"><span class="required">*</span> ${msg("requiredFields")}</span>
                            </div>
                            <div class="col-md-10">
                                <#nested "show-username">
                                <div class="${properties.kcFormGroupClass!}">
                                <div id="kc-username">
                                    <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                                    <a id="reset-login" href="${url.loginRestartFlowUrl}">
                                    <div class="kc-login-tooltip">
                                        <i class="${properties.kcResetFlowIcon!}"></i>
                                        <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                                    </div>
                                    </a>
                                </div>
                                </div>
                            </div>
                            </div>
                        <#else>
                            <#nested "show-username">
                            <div class="${properties.kcFormGroupClass!}">
                            <div id="kc-username">
                                <label id="kc-attempted-username">${auth.attemptedUsername}</label>
                                <a id="reset-login" href="${url.loginRestartFlowUrl}">
                                <div class="kc-login-tooltip">
                                    <i class="${properties.kcResetFlowIcon!}"></i>
                                    <span class="kc-tooltip-text">${msg("restartLoginTooltip")}</span>
                                </div>
                                </a>
                            </div>
                            </div>
                        </#if>
                    </#if>
                    </header>
                    
                    <div id="kc-content">
                        <div id="kc-content-wrapper">
            
                            <#-- App-initiated actions should not see warning messages about the need to complete the action -->
                            <#--  during login.                                                                               -->
                            <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                            <div class="mb-6 text-sm">
                                <#if message.type = 'success'>
                                    <div class="p-4 rounded-md bg-green-50">
                                        <div class="flex">
                                            <div class="flex-shrink-0">
                                                <svg class="w-5 h-5 text-green-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                                                </svg>
                                            </div>
                                            <div class="ml-3 text-sm leading-5 text-green-700">
                                                <p>
                                                ${kcSanitize(message.summary)?no_esc}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    
                                <#elseif message.type = 'warning'>
                                    <div class="p-4 rounded-md bg-yellow-50">
                                        <div class="flex">
                                            <div class="flex-shrink-0">
                                                <svg class="w-5 h-5 text-yellow-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                                    <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd" />
                                                </svg>
                                            </div>
                                            <div class="ml-3 text-sm leading-5 text-yellow-700">
                                                <p>
                                                ${kcSanitize(message.summary)?no_esc}
                                                </p>
                                            </div>
                                        </div>
                                    </div>

                                <#elseif message.type = 'error'>
                                    <div class="p-4 rounded-md bg-red-50">
                                        <div class="flex">
                                            <div class="flex-shrink-0">
                                                <svg class="w-5 h-5 text-red-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                                                </svg>
                                            </div>
                                            <div class="ml-3 text-sm leading-5 text-red-700">
                                                <p>
                                                ${kcSanitize(message.summary)?no_esc}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                <#elseif message.type = 'info'>
                                    <div class="p-4 rounded-md bg-blue-50">
                                        <div class="flex">
                                            <div class="flex-shrink-0">
                                                <svg class="w-5 h-5 text-blue-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                                                    <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd" />
                                                </svg>
                                            </div>
                                            <div class="ml-3 text-sm leading-5 text-blue-700">
                                                <p>
                                                ${kcSanitize(message.summary)?no_esc}
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    
                                <#else>
                                    <div class="p-4 rounded-md bg-cool-gray-50">
                                        <div class="ml-3 text-sm leading-5 text-cool-gray-700">
                                            <p>
                                            ${kcSanitize(message.summary)?no_esc}
                                            </p>
                                        </div>
                                    </div>
                                    
                                </#if>
                                
                            </div>
                            </#if>
            
                            <#nested "form">
            
                            <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
                            <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post" <#if displayWide>class="${properties.kcContentWrapperClass!}"</#if>>
                                <div <#if displayWide>class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}"</#if>>
                                    <div class="${properties.kcFormGroupClass!}">
                                        <input type="hidden" name="tryAnotherWay" value="on" />
                                        <a href="#" id="try-another-way" onclick="document.forms['kc-select-try-another-way-form'].submit();return false;">${msg("doTryAnotherWay")}</a>
                                    </div>
                                </div>
                            </form>
                            </#if>

                            <#if displayInfo>
                                <div id="kc-info" class="my-6 text-gray-500">
                                    <div id="kc-info-wrapper">
                                        <#nested "info">
                                    </div>
                                </div>
                            </#if>
            
                        </div>
                    </div>
                </div>

                <#nested "footer">

            </div>

            <#nested "card-right">

          </div>
        </div>
      </div>
      
    </div>
    <#--  Script to get the footer of the card into viewport on iphones  -->
    <script>
    if (window.innerWidth < 768){
        document.addEventListener('DOMContentLoaded', function(){
            var height = window.innerHeight - 64 - 96;
            document.getElementById("card-form").style["min-height"] = height+"px";
        })
    }
    
    </script>
  </body>
</html>
</#macro>