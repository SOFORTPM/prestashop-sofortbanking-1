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

<p class="payment_module">
	<a href="{if method_exists('Link','getModuleLink')}{$link->getModuleLink('sofortbanking', 'payment', ['token' => $static_token])}{else}{$this_path_ssl|escape:'htmlall':'UTF-8'}payment.php?token={$static_token|escape:'htmlall':'UTF-8'}{/if}" title="{l s='Pay with SOFORT' mod='sofortbanking'}">
	{if $cprotect == "Y" && $lang_iso == "de"}
		<img src="https://images.sofort.com/{$mod_lang|escape:'htmlall':'UTF-8'}/su/banner_400x100_ks.png" alt="banner_400x100_ks.png" title="{l s='Shop safely with buyer protection by Deutsche Handelsbank' mod='sofortbanking'}" width="400" height="100" />
		{l s='Shop safely with buyer protection by Deutsche Handelsbank' mod='sofortbanking'}
	{elseif $cprotect == "N" && $lang_iso == "de"}
	                <img src="https://images.sofort.com/{$mod_lang|escape:'htmlall':'UTF-8'}/su/banner_300x100.png" alt="banner_300x100.png" title="{l s='Pay easy and secure with SOFORT.' mod='sofortbanking'}" width="300" height="100" />
			                {l s='SOFORT - Online payments made easy.' mod='sofortbanking'}
	{elseif $lang_iso == "en"}
                        <img src="https://images.sofort.com/{$mod_lang|escape:'htmlall':'UTF-8'}/su/banner_300x100.png" alt="banner_300x100.png" title="{l s='Pay easy and secure with SOFORT.' mod='sofortbanking'}" width="300" height="100" />
			                                        {l s='SOFORT - Online payments made easy.' mod='sofortbanking'}
	{elseif $lang_iso == "es"}
                        <img src="https://images.sofort.com/{$mod_lang|escape:'htmlall':'UTF-8'}/sb/100x38.png" alt="banner_300x100.png" title="{l s='Pay easy and secure with SOFORT.' mod='sofortbanking'}" width="100" height="38" />
			                                                                <br><b>Transferencia bancaria directa online</b><br>Pague en 3 simples pasos con su Banca Online.</a>
	{else}
		<img src="https://images.sofort.com/{$mod_lang|escape:'htmlall':'UTF-8'}/sb/banner_300x100.png" alt="banner_300x100.png" title="{l s='Pay easy and secure with SOFORT.' mod='sofortbanking'}" width="300" height="100" />

		{l s='SOFORT - Online payments made easy.' mod='sofortbanking'}
	{/if}
	<br class="clear" />
	</a>
</p>