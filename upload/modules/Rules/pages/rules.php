<?php
/*
 *    Rules module made by Coldfire
 *    https://coldfiredzn.com
 *
 *    Using code from the vote module by Partydragen and Samerton
 */

define('PAGE', 'rules');
$page_title = $rules_language->get('rules', 'rules');
require_once(ROOT_PATH . '/core/templates/frontend_init.php');

$rules_message = $queries->getWhere("rules_settings", ["name", "=", "rules_message"]);
$rules_message = $rules_message[0]->value;

$catagories = $queries->getWhere("rules_catagories", ["id", "<>", 0]);

$catagories_array = [];
foreach($catagories as $catagory){
    $catagories_array[] = [
    'id' => Output::getClean($catagory->id),
        'name' => Output::getClean($catagory->name),
        'icon' => Output::getPurified(Output::getDecoded($catagory->icon)),
        'rules' => Output::getPurified(Output::getDecoded($catagory->rules))
    ];
}

$buttons = $queries->getWhere("rules_buttons", ["id", "<>", 0]);

$buttons_array = [];
foreach($buttons as $button){
    $buttons_array[] = [
    'name' => Output::getClean($button->name),
        'link' => Output::getClean($button->link),
    ];
}

$smarty->assign([
    'RULES' => $rules_language->get('rules', 'rules'),
    'MESSAGE' => Output::getPurified(Output::getDecoded($rules_message)),
    'CATAGORIES' => $catagories_array,
    'BUTTONS' => $buttons_array
]);

Module::loadPage($user, $pages, $cache, $smarty, [$navigation, $cc_nav, $staffcp_nav], $widgets, $template);

$page_load = microtime(true) - $start;
define('PAGE_LOAD_TIME', str_replace('{x}', round($page_load, 3), $language->get('general', 'page_loaded_in')));

$template->onPageLoad();
$template->addJSScript('$(\'.menu .item\').tab()');

$smarty->assign('WIDGETS_LEFT', $widgets->getWidgets('left'));
$smarty->assign('WIDGETS_RIGHT', $widgets->getWidgets('right'));

require(ROOT_PATH . '/core/templates/navbar.php');
require(ROOT_PATH . '/core/templates/footer.php');

$template->displayTemplate('rules.tpl', $smarty);
