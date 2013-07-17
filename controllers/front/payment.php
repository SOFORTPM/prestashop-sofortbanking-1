<?php
/**
 * $Id$
 *
 * sofortbanking Module
 *
 * Copyright (c) 2009 touchdesign
 *
 * @category Payment
 * @version 1.8
 * @copyright 19.08.2009, touchdesign
 * @author Christin Gruber, <www.touchdesign.de>
 * @link http://www.touchdesign.de/loesungen/prestashop/sofortueberweisung.htm
 * @license http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
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
 *
 */

class SofortbankingPaymentModuleFrontController extends ModuleFrontController
{
	public $ssl = true;

	/**
	 * @see FrontController::initContent()
	 */
	public function initContent()
	{
		$this->display_column_left = false;
		parent::initContent();

		$cart = $this->context->cart;
		
		$address = new Address(intval($cart->id_address_invoice));
		$customer = new Customer(intval($cart->id_customer));
		$currency = $this->context->currency;
		$country = new Country(intval($address->id_country));
		$lang = Language::getIsoById(intval($cart->id_lang));
		
		if (!Configuration::get('SOFORTBANKING_USER_ID'))
			return $this->l($this->displayName.' Error: (invalid or undefined userId)');
		
		if (!Configuration::get('SOFORTBANKING_PROJECT_ID'))
			return $this->l($this->displayName.' Error: (invalid or undefined projectId)');
		
		if (!Validate::isLoadedObject($address) || !Validate::isLoadedObject($customer) 
			|| !Validate::isLoadedObject($currency))
			return $this->l($this->displayName.' Error: (invalid address or customer)');
		
		$parameters = array(
			'user_id' => Configuration::get('SOFORTBANKING_USER_ID'),'project_id' => Configuration::get('SOFORTBANKING_PROJECT_ID'),
			'sender_holder' => '','','','sender_country_id' => $country->iso_code,
			'amount' => number_format(Tools::convertPrice($cart->getOrderTotal(), $currency), 2, '.', ''),
			'sender_currency_id' => $currency->iso_code,'reason_1' => time().'-'.intval($cart->id),
			'reason_2' => $customer->firstname.' '.ucfirst(strtolower($customer->lastname)),
			'user_variable_0' => $customer->secure_key,'user_variable_1' => intval($cart->id),
			'user_variable_2' => '','user_variable_3' => '','user_variable_4' => '','user_variable_5' => '',
			'project_password' => Configuration::get('SOFORTBANKING_PROJECT_PW'),
		);
		
		$this->context->smarty->assign(array(
			'this_path' => $this->module->getPathUri(),
			'this_path_ssl' => Tools::getHttpHost(true, true).__PS_BASE_URI__.'modules/'.$this->module->name.'/',
			'nbProducts' => $cart->nbProducts(),
			'cust_currency' => $this->context->currency,
			'currencies' => $this->context->currency,
			'total' => $cart->getOrderTotal(true, 3),
			'isoCode' =>  $this->context->language->iso_code,
			'version' => _PS_VERSION_,
			'hash' => sha1(implode('|',$parameters)),
			'gateway' => 'https://www.sofortueberweisung.de/payment/start',
			'lang' => $lang,
			'cprotect' => Configuration::get('SOFORTBANKING_CPROTECT'),
			'parameters' => $parameters
		));
		
		$this->setTemplate((Configuration::get('SOFORTBANKING_REDIRECT') == 'Y'
			? 'payment_redirect.tpl' : 'payment_execution.tpl'));
	}
}
