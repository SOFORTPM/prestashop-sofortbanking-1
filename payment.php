<?php
/**
 * $Id$
 *
 * sofortbanking Module
 *
 * Copyright (c) 2009 touchdesign
 *
 * @category Payment
 * @version 1.9
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

/**
 * This file will be removed in new module version for PS 1.6
 */

$useSSL = true;

require_once dirname(__FILE__).'/../../config/config.inc.php';
require_once dirname(__FILE__).'/sofortbanking.php';
require_once dirname(__FILE__).'/lib/touchdesign.php';

// If PS 1.5 redirect to controller
if (class_exists('Context'))
	touchdesign::redirect(Context::getContext()->link->getModuleLink('sofortbanking', 'payment'),null,false,false);

$controller = new FrontController();
$controller->display_column_left = false;
$controller->init();
$controller->setMedia();

$controller->displayHeader();

if (!$cookie->isLogged(true))
	touchdesign::redirect(__PS_BASE_URI__.'order.php','order=back.php');

$sofortbanking = new sofortbanking();

// Build and display payment page 
echo $sofortbanking->execPayment($cart);

$controller->displayFooter();

?>