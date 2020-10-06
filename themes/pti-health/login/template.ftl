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
    <div class="min-h-screen bg-right-bottom bg-no-repeat bg-contain md:pb-5 below-md:bg-none" style="background-image: url(${url.resourcesPath}/img/background.svg)">

      <nav class="px-4 mx-auto max-w-screen-2xl md:px-24 md:pt-8 md:pb-5">
        <div class="flex justify-between h-16">
            <div class="flex">
                <div class="flex items-center flex-shrink-0">
                <img class="block w-auto" style="height: 45px;" src="${url.resourcesPath}/img/iHub.png" alt="Workflow logo">
                </div>
            </div>
        </div>
      </nav>


      <div class="flex flex-col px-4 mx-auto xl:items-center xl:justify-between xl:flex-row max-w-screen-2xl md:px-24">

        <#nested "text">

        <div class="px-4 py-12 bg-white xl:px-6 xl:flex-shrink-0 md:mx-auto xl:mx-none md:shadow-2xl md:rounded-lg md:w-500 xl:mx-0">
          <div>
            <header class="mb-12 text-cool-gray-700">
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
                      <span class="text-green-600">${kcSanitize(message.summary)?no_esc}</span>
                      <#elseif message.type = 'warning'>
                      <span class="text-yellow-600">${kcSanitize(message.summary)?no_esc}</span>
                      <#elseif message.type = 'error'>
                      <span class="text-red-600">${kcSanitize(message.summary)?no_esc}</span>
                      <#elseif message.type = 'info'>
                      <span class="text-blue-600">${kcSanitize(message.summary)?no_esc}</span>
                      <#else>
                      <span class="text-cool-gray-700">${kcSanitize(message.summary)?no_esc}</span>
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
                <div id="kc-info" class="${properties.kcSignUpClass!}">
                  <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                    <#nested "info">
                  </div>
                </div>
                </#if>
  
              </div>
            </div>
            
          </div>
        </div>
      </div>
      
    </div>
  </body>
</html>
</#macro>