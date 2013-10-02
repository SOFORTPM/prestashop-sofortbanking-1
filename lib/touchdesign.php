<?php
/**
 * $Id$
 *
 * touchdesign module
 *
 * Copyright (c) 2011 touchdesign
 *
 * @category Library
 * @version 0.1
 * @copyright 12.04.2010, touchdesign
 * @author Christin Gruber, <www.touchdesign.de>
 * @link http://www.touchdesign.de
 * @license http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 *
 * Description:
 *
 * touchdesign module library
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

class Touchdesign
{

	public static function redirect($path = null, $query = null, $scheme = null, $host = null)
	{
		$url = '';

		if ($scheme === null)
			$scheme = (Configuration::get('PS_SSL_ENABLED') == 1 ? 'https://' : 'http://');

		if ($host === null)
			$host = $_SERVER['HTTP_HOST'];

		if ($path === null)
			$path = __PS_BASE_URI__;

		die(header('Location: '.$scheme.$host.$path.($query !== null ? '?'.$query : '')));
	}

}

?>