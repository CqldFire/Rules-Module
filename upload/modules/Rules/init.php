<?php
/*
 *    Rules module made by Coldfire
 *    https://coldfiredzn.com
 *
 *    Using code from the vote module by Partydragen and Samerton
 */

$rules_language = new Language(ROOT_PATH . '/modules/Rules/language', LANGUAGE);
$language = new Language('core', LANGUAGE);

require_once(ROOT_PATH . '/modules/Rules/module.php');
$module = new Rules_Module($language, $rules_language, $pages);