<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=false; section>
    <#if section = "header">
			<div>
				<img src="${url.resourcesPath}/img/qualiopsys-logo.svg">
				<h1>${msg("emailVerifyTitle")}</h1>
			</div>
        
    <#elseif section = "form">
        <p class="instruction color-secondary">${msg("emailVerifyInstruction1",user.email)}</p> 
    <#elseif section = "info">
			<div class="verify-email-info-container">
				<div id="kc-form-buttons" class="pf-c-button pf-m-primary">
            <a href="${url.loginAction}">${msg("emailVerifyInstruction3")}</a> 				
				</div>
			</div>
    </#if>
</@layout.registrationLayout>
