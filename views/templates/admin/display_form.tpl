{**
 * sofortbanking Module
 *
 * Copyright (c) 2009 touchdesign
 *
 * @category  Payment
 * @author    Christin Gruber, <www.touchdesign.de>
 * @copyright 19.08.2009, touchdesign
 * @link      http://www.touchdesign.de/loesungen/prestashop/sofortueberweisung.htm
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 *
 * Description:
 *
 * Payment module sofortbanking
 *
 * --
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/osl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@touchdesign.de so we can send you a copy immediately.
 *}

{literal}
<style type="text/css">
fieldset a {
	color:#0099ff !important;
	text-decoration:underline;
}
fieldset a:hover {
	color:#000000;
	text-decoration:underline;
}
.level1 {
	font-size:1.2em
}
.level2 {
	font-size:0.9em
}
</style>
{/literal}

<div><img src="{$sofort.dfl.img_path|escape:'htmlall':'UTF-8'}/sofortbanking.png" width="200" height="75" alt="sofortbanking.png" title="" /></div>
<form method="post" action="{$sofort.dfl.action|escape:'htmlall':'UTF-8'}">
<br />

<fieldset class="level1">
<legend><img src="{$sofort.dfl.path|escape:'htmlall':'UTF-8'}/logo.gif" width="16" height="16" alt="logo.gif" title="" />{l s='About SOFORT' mod='sofortbanking'}</legend>
	<b>{l s='SOFORT is the direct payment system provided by SOFORT GmbH. SOFORT allows buyers to make a wire transfer of the respective amount during the order process using their online banking account. You as a merchant will receive a real-time confirmation after the SOFORT transaction has been completed. This enables you to immediately ship goods on stock and digital goods - and the buyer will receive the purchased items faster. Learn more about SOFORT and SOFORT GmbH at' mod='sofortbanking'}</b> <a target="_blank" href="https://sofort.com/"><b>{l s='sofort.com.' mod='sofortbanking'}</b></a><br />
</fieldset>
<br />

<fieldset class="level1">
	<legend><img src="{$sofort.dfl.path|escape:'htmlall':'UTF-8'}/logo.gif" width="16" height="16" alt="logo.gif" title="" />{l s='Set-up and configuration' mod='sofortbanking'}</legend>
	<b>{l s='Just a few steps are required to use SOFORT:' mod='sofortbanking'}</b><br /><br />
	<fieldset class="level2">
		<legend><img src="{$sofort.dfl.img_path|escape:'htmlall':'UTF-8'}/step_1.png" width="16" height="16" alt="unknown.gif" title="">{l s='Registration' mod='sofortbanking'}</legend>
		<b>{l s='In order to use SOFORT , you need a customer account with SOFORT GmbH. You are not a customer yet?' mod='sofortbanking'}</b>
		<a target="_blank" href="https://www.sofortueberweisung.de/payment/users/register/284"><b>{l s='Register now!' mod='sofortbanking'}</b></a><br />
	</fieldset>
	<br />
	
	<fieldset class="level2" style="border-color:#FF8C00; border-width:4px">
		<b>{l s='Please set up a project in the merchant menu of SOFORT GmbH and store the following URLS at the appropriate location' mod='sofortbanking'} <font color="#FF0000">{l s='(please make sure to create a "SOFORT Classic Project")' mod='sofortbanking'}</font>:</b><br /><br />
		<legend style="border-color:#FF8C00; border-width:4px"><img src="{$sofort.dfl.img_path|escape:'htmlall':'UTF-8'}/step_2.png" width="16" height="16" alt="step_2.png" title="" />{l s='Project set-up' mod='sofortbanking'}</legend>
		<b>{l s='Success-Link (redirect to order-confirmation):' mod='sofortbanking'}</b><br /><textarea rows=1 style="width:98%;">{$sofort.link.success|escape:'htmlall':'UTF-8'}</textarea>
		<br /><br />
		<b>{l s='Cancellation-Link (return to shop):' mod='sofortbanking'}</b><br /><textarea rows=1 style="width:98%;">{$sofort.link.cancellation|escape:'htmlall':'UTF-8'}</textarea>
		<br /><br />
		<b>{l s='Confirmation-URL (HTTP-notification):' mod='sofortbanking'} {l s='(method POST)' mod='sofortbanking'}</b><br /><textarea rows=1 style="width:98%;">{$sofort.link.validation|escape:'htmlall':'UTF-8'}</textarea>
		<br />
		<p>{l s='Please generate a project and a notification password in the corresponding menu entry at SOFORT and make sure that the hash algorithm "SHA1" is selected.' mod='sofortbanking'}</p>
	</fieldset>
	<br />
	
	<fieldset class="level2">
		<legend><img src="{$sofort.dfl.img_path|escape:'htmlall':'UTF-8'}/step_3.png" width="16" height="16" alt="step_3.png" title="">{l s='Module configuration' mod='sofortbanking'}</legend>
		<b>{l s='Please store your SOFORT project data and passwords in the following fields:' mod='sofortbanking'}</b><br /><br />
		<label>{l s='Customer number:' mod='sofortbanking'}</label>
		<div class="margin-form">
			<input type="text" name="SOFORTBANKING_USER_ID" value="{$sofort.config.SOFORTBANKING_USER_ID|escape:'htmlall':'UTF-8'}" />
			<p>{l s='Leave it blank for disabling' mod='sofortbanking'}</p>
		</div>
		<div class="clear"></div>
		<label>{l s='Project ID:' mod='sofortbanking'}</label>
		<div class="margin-form">
			<input type="text" name="SOFORTBANKING_PROJECT_ID" value="{$sofort.config.SOFORTBANKING_PROJECT_ID|escape:'htmlall':'UTF-8'}" />
			<p>{l s='Leave it blank for disabling' mod='sofortbanking'}</p>
		</div>
		<div class="clear"></div>
		<label>{l s='Project password:' mod='sofortbanking'}</label>
		<div class="margin-form">
			<input type="password" name="SOFORTBANKING_PROJECT_PW" value="{$sofort.config.SOFORTBANKING_PROJECT_PW|escape:'htmlall':'UTF-8'}" />
			<p>{l s='Leave it blank for disabling' mod='sofortbanking'}</p>
		</div>
		<div class="clear"></div>
		<label>{l s='Notification password:' mod='sofortbanking'}</label>
		<div class="margin-form">
			<input type="password" name="SOFORTBANKING_NOTIFY_PW" value="{$sofort.config.SOFORTBANKING_NOTIFY_PW|escape:'htmlall':'UTF-8'}" />
			<p>{l s='Leave it blank for disabling' mod='sofortbanking'}</p>
		</div>
		<div class="clear"></div>
		<label>{l s='Status for successful listing of transfer:' mod='sofortbanking'}</label>
		<div class="margin-form">
			<select name="SOFORTBANKING_OS_ACCEPTED">
				{$sofort.order_states.accepted|escape:'UTF-8'}
			</select> <input type="checkbox" name="SOFORTBANKING_OS_ACCEPTED_IGNORE" {if $sofort.config.SOFORTBANKING_OS_ACCEPTED_IGNORE == "Y"}checked="checked"{/if} value="Y" /> {l s='No status update shall be made for this event.' mod='sofortbanking'}<br />
			<br />
			<p>{l s='Please enter the status here, which your order is supposed to have after successful confirmation by SOFORT GmbH.' mod='sofortbanking'}</p>
		</div>
		<div class="clear"></div>
		<label>{l s='Order error status' mod='sofortbanking'}</label>
		<div class="margin-form">
			<select name="SOFORTBANKING_OS_ERROR">
				{$sofort.order_states.error|escape:'UTF-8'}
			</select> <input type="checkbox" name="SOFORTBANKING_OS_ERROR_IGNORE" {if $sofort.config.SOFORTBANKING_OS_ERROR_IGNORE == "Y"}checked="checked"{/if} value="Y" /> {l s='No status update shall be made for this event.' mod='sofortbanking'}<br />
			<br />
			<p>{l s='Status for payment error:' mod='sofortbanking'}</p>
		</div>
		<div class="clear"></div>
		<label>{l s='SOFORT Logo:' mod='sofortbanking'}</label>
		<div class="margin-form">
			<select name="SOFORTBANKING_BLOCK_LOGO">
				<option {if $sofort.config.SOFORTBANKING_BLOCK_LOGO == "Y"}selected{/if} value="Y">{l s='Yes, display the logo (recommended)' mod='sofortbanking'}</option>
				<option {if $sofort.config.SOFORTBANKING_BLOCK_LOGO == "N"}selected{/if} value="N">{l s='No, do not display the logo' mod='sofortbanking'}</option>
			</select>
			<p>{l s='Display SOFORT logo and payment info block in left column' mod='sofortbanking'}</p>
		</div>
		<div class="clear"></div>
		<label>{l s='Customer protection active:' mod='sofortbanking'}</label>
		<div class="margin-form">
			<select name="SOFORTBANKING_CPROTECT">
				<option {if $sofort.config.SOFORTBANKING_CPROTECT == "Y"}selected{/if} value="Y">{l s='Yes' mod='sofortbanking'}</option>
				<option {if $sofort.config.SOFORTBANKING_CPROTECT == "N"}selected{/if} value="N">{l s='No' mod='sofortbanking'}</option>
			</select>
			<p>
				{l s='You need a bank account with' mod='sofortbanking'}
				<a target="_blank" href="http://www.sofort-bank.com" target="_blank">Sofort Bank</a>
				{l s='You need a bank account with and customer protection must be enabled in your project settings. Please check with' mod='sofortbanking'}
				<a target="_blank" href="https://kaeuferschutz.sofort-bank.com/consumerProtections/index/{$sofort.config.SOFORTBANKING_PROJECT_ID|escape:'htmlall':'UTF-8'}">{l s='this link' mod='sofortbanking'}</a>
				{l s='if customer protection is activated and enabled before enabling it here.' mod='sofortbanking'}
			</p>
		</div>
		<div class="clear"></div>
		<label>{l s='Force redirect?' mod='sofortbanking'}</label>
		<div class="margin-form">
			<select name="SOFORTBANKING_REDIRECT">
				<option {if $sofort.config.SOFORTBANKING_REDIRECT == "Y"}selected{/if} value="Y">{l s='Yes' mod='sofortbanking'}</option>
				<option {if $sofort.config.SOFORTBANKING_REDIRECT == "N"}selected{/if} value="N">{l s='No, let the customer confirm the order first.' mod='sofortbanking'}</option>
			</select>
			<p>{l s='Force redirect to SOFORT payment page (skip confirmation page).' mod='sofortbanking'}</p>
		</div>
		<div class="clear"></div>
		<div class="margin-form clear pspace"><input type="submit" name="submitUpdate" value="{l s='Save' mod='sofortbanking'}" class="button" /></div>
	</fieldset>
</fieldset>
</form>
<br />

<fieldset class="level1 space">
	<legend><img src="{$sofort.dfl.path|escape:'htmlall':'UTF-8'}/logo.gif" width="16" height="16" alt="logo.gif" title="" />{l s='Help & Support' mod='sofortbanking'}</legend>
	<b>{l s='Detailed instructions can be found on our' mod='sofortbanking'}</b> <a target="_blank" href="https://www.sofort.com/integrationCenter-ger-DE/integration/shopsysteme/PrestaShop/"><b>{l s='Website' mod='sofortbanking'}</b></a>.<br /><br />
	<b>{l s='We will be happy to assist you in the set-up. Please contact our' mod='sofortbanking'}</b> <a target="_blank" href="https://addons.prestashop.com/de/Write-to-developper?id_product=9176"><b>{l s='Support.' mod='sofortbanking'}</b></a><br />
</fieldset>
<br />

<fieldset class="level1">
	<legend><img src="../img/admin/unknown.gif" width="16" height="16" alt="unknown.gif" title="" />{l s='Author and Copyright:' mod='sofortbanking'}</legend>
	<a target="_blank" href="http://www.touchdesign.de"><b>touchdesign</b></a><br />
</fieldset>