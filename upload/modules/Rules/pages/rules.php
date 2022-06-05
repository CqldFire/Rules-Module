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

$rules_message = DB::getInstance()->get("rules_settings", ["name", "=", "rules_message"])->results();
$rules_message = $rules_message[0]->value;

$catagories = DB::getInstance()->get("rules_catagories", ["id", "<>", 0])->results();

$catagories_array = [];
foreach($catagories as $catagory){
    $catagories_array[] = [
    'id' => Output::getClean($catagory->id),
        'name' => Output::getClean($catagory->name),
        'icon' => Output::getPurified(Output::getDecoded($catagory->icon)),
        'rules' => Output::getPurified(Output::getDecoded($catagory->rules))
    ];
}

$buttons = DB::getInstance()->get("rules_buttons", ["id", "<>", 0])->results();

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

$template->onPageLoad();
$template->addJSScript('$(\'.menu .item\').tab()');

$smarty->assign('WIDGETS_LEFT', $widgets->getWidgets('left'));
$smarty->assign('WIDGETS_RIGHT', $widgets->getWidgets('right'));

require(ROOT_PATH . '/core/templates/navbar.php');
require(ROOT_PATH . '/core/templates/footer.php');

$template->displayTemplate('rules.tpl', $smarty);
