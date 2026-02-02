<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false displayMessage=messagesPerField.existsError('username'); section>
    <#if section = "header">
			<div>
				<img src="${url.resourcesPath}/img/qualiopsys-logo.svg">
			</div>
    <#elseif section = "form">
				<h1>${msg("emailForgotTitle")}</h1>
				<p class="subtitle">${msg("emailForgotSubtitle")}</p>
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
							<label for="username" class="${properties.kcLabelClass!}">
								${msg("email")}
							</label>
						<input type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus value="${(auth.attemptedUsername!'')}" aria-invalid="<#if messagesPerField.existsError('username')>true</#if>" dir="ltr"/>
                <div class="${properties.kcLabelWrapperClass!}">
                </div>
            </div>
            <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">

                <div id="kc-form-buttons" class="pf-c-button pf-m-primary">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
                </div>
                <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                    <div class="${properties.kcFormOptionsWrapperClass!}">
                        <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                    </div>
                </div>
            </div>
        </form>
    <#elseif section = "info" >
        <#if realm.duplicateEmailsAllowed>
            ${msg("emailInstructionUsername")}
        <#else>
            ${msg("emailInstruction")}
        </#if>
    </#if>
</@layout.registrationLayout>
