<#import "template.ftl" as layout>
<#import "password-commons.ftl" as passwordCommons>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
			<div>
				<img src="${url.resourcesPath}/img/qualiopsys-logo.svg">
				<h1>${msg("updatePasswordTitle")}</h1>
			</div>
    <#elseif section = "form">
        <form id="kc-passwd-update-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="${properties.kcFormGroupClass!}">
							<label for="password-new" class="${properties.kcLabelClass!}">${msg("passwordNew")}</label>
							<div class="password-container">
												<input type="password" id="password-new" name="password-new" class="${properties.kcInputClass!}"
															 autofocus autocomplete="new-password"
															 aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
												/>
											<button class="${properties.kcFormPasswordVisibilityButtonClass!}" type="button" aria-label="${msg("showPassword")}"
															aria-controls="password-new" data-password-toggle tabindex="4"
															data-icon-show="${properties.kcFormPasswordVisibilityIconShow!}" data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!}"
															data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
													<i class="${properties.kcFormPasswordVisibilityIconShow!}" aria-hidden="true"></i>
											</button>
										</div>
            </div>

            <div class="${properties.kcFormGroupClass!}">
							<label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
							<div class="password-container">
											<input type="password" id="password-confirm" name="password-confirm"
														 class="${properties.kcInputClass!}"
														 autocomplete="new-password"
														 aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
											/>
											<button class="${properties.kcFormPasswordVisibilityButtonClass!}" type="button" aria-label="${msg("showPassword")}"
															aria-controls="password-confirm" data-password-toggle tabindex="4"
															data-icon-show="${properties.kcFormPasswordVisibilityIconShow!}" data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!}"
															data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
													<i class="${properties.kcFormPasswordVisibilityIconShow!}" aria-hidden="true"></i>
											</button>
										</div>

						</div>

						<#if message?has_content && (message.type = 'error')>
							<div class="alert-${message.type} ${properties.kcAlertClass!} pf-m-<#if message.type = 'error'>danger<#else>${message.type}</#if>">
								<span class="${properties.kcAlertTitleClass!}">${kcSanitize(message.summary)?no_esc}</span>
							</div>
						</#if>
						<div class="${properties.kcFormGroupClass!}">

							<div id="kc-form-buttons" class="pf-c-button pf-m-primary">
								<#if isAppInitiatedAction??>
									<input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}" />
									<button class="${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonLargeClass!}" type="submit" name="cancel-aia" value="true" />${msg("doCancel")}</button>
								<#else>
									<input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}" />
								</#if>
							</div>
						</div>
				</form>
				<script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>
			</#if>
			</@layout.registrationLayout>
