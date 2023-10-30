<?php 
/*
 *    Rules module made by Coldfire
 *    https://coldfiredzn.com
 *
 *    Using code from the vote module by Partydragen and Samerton
 */

class Rules_Module extends Module {
    private $_rules_language;
    
    public function __construct($rules_language, $pages){
        $this->_rules_language = $rules_language;
        
        $name = 'Rules';
        $author = '<a href="https://coldfiredzn.com" target="_blank" rel="nofollow noopener">Coldfire</a>';
        $module_version = '1.8.4';
        $nameless_version = '2.1.0';
        
        parent::__construct($this, $name, $author, $module_version, $nameless_version);
        
        $pages->add('Rules', '/rules', 'pages/rules.php', 'rules', true);
        $pages->add('Rules', '/panel/rules', 'pages/panel/rules.php');
    }
    
    public function onInstall(){
        
        try {
            $data = DB::getInstance()->createTable("rules_settings", " `id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(20) NOT NULL, `value` varchar(2048) NOT NULL, PRIMARY KEY (`id`)", "ENGINE=$engine DEFAULT CHARSET=$charset");
            $data = DB::getInstance()->createTable("rules_catagories", " `id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(96) NOT NULL, `icon` varchar(96) NOT NULL, `rules` longtext NOT NULL, PRIMARY KEY (`id`)", "ENGINE=$engine DEFAULT CHARSET=$charset");
            $data = DB::getInstance()->createTable("rules_buttons", " `id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(96) NOT NULL, `link` varchar(96) NOT NULL, PRIMARY KEY (`id`)", "ENGINE=$engine DEFAULT CHARSET=$charset");
        } catch(Exception $e){
        }
        
        try {
            DB::getInstance()->insert('rules_settings', [
                'name' => 'rules_message',
                'value' => '<div style="text-align: center;"><strong><span style="font-size:18px">Welcome to Skyfall&#39;s rules page!</span></strong><br />Click on the tabs above to see the different sections of the rules.<br /><br /><strong>Note:</strong>&nbsp;You can change this message and the rules lists on the tabs above in StaffCP -&gt; Rules. All of the rules lists are fully customizable via a text editor, so you can create unlimited rules, include any type of punishments, and format it all however you want.<br /><br />Useful links:</div>'
            ]);
            DB::getInstance()->insert('rules_catagories', [
                'name' => 'Bedwars',
                'icon' => '<i class="fas fa-bed"></i>',
                'rules' => '&lt;div style=&quot;text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Bedwars Server Rules:&lt;/span&gt;&lt;/strong&gt;&lt;/div&gt;&lt;br /&gt;1. No hacking or unfair advantages of any kind.&lt;br /&gt;&lt;br /&gt;2. No cross teaming in any bedwars mode.&lt;br /&gt;&lt;br /&gt;3. No team griefing&lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;color:#c0392b&quot;&gt;&lt;strong&gt;Punishment:&lt;/strong&gt;&lt;/span&gt; Breaking any of these rules will result in a temporary ban for 30 days.'
            ]);
            DB::getInstance()->insert('rules_catagories', [
                'name' => 'Chat',
                'icon' => '<i class="fas fa-comments"></i>',
                'rules' => '&lt;div style=&quot;text-align: center;&quot;&gt;&lt;strong&gt;&lt;span style=&quot;font-size:18px&quot;&gt;Chat Rules:&lt;/span&gt;&lt;/strong&gt;&lt;/div&gt;&lt;br /&gt;1. No swearing&lt;br /&gt;&lt;br /&gt;2. No bullying, put-downs, or other harassment&lt;br /&gt;&lt;br /&gt;3. No spamming&lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;color:#c0392b&quot;&gt;&lt;strong&gt;Punishment:&lt;/strong&gt;&lt;/span&gt; Breaking any of these rules can result in a temporary/permanent mute'
            ]);
            DB::getInstance()->insert('rules_buttons', [
                'name' => 'Player Report',
                'link' => 'https://hypixel.net/forums/report-rule-breakers.37/'
            ]);
            DB::getInstance()->insert('rules_buttons', [
                'name' => 'Bans',
                'link' => 'https://www.lemoncloud.org/bans/'
            ]);
            DB::getInstance()->insert('rules_buttons', [
                'name' => 'Ban Appeal',
                'link' => 'https://hypixel.net/forums/ban-appeal.36/'
            ]);
        } catch(Exception $e){
        }
        
        try {
            $group = DB::getInstance()->get('groups', ['id', '=', 2])->results();
            $group = $group[0];
            
            $group_permissions = json_decode($group->permissions, TRUE);
            $group_permissions['admincp.rules'] = 1;
            
            $group_permissions = json_encode($group_permissions);
            DB::getInstance()->update('groups', 2, ['permissions' => $group_permissions]);
        } catch(Exception $e){
        }
    }

    public function onUninstall(){
        // No actions necessary
    }

    public function onEnable(){
        // No actions necessary
    }

    public function onDisable(){
        // No actions necessary
    }

    public function onPageLoad($user, $pages, $cache, $smarty, $navs, $widgets, $template){
        if(defined('PANEL_PAGE') && PANEL_PAGE == 'rules') {
            $template->assets()->include([
                AssetTree::TINYMCE,
            ]);

            $template->addJSScript(Input::createTinyEditor($this->_rules_language, 'InputMessage', null, false, true));
            $template->addJSScript(Input::createTinyEditor($this->_rules_language, 'InputCatagoryRules', null, false, true));
        }
        if(defined('PAGE') && PAGE == 'rules'){
            $template->assets()->include([
                AssetTree::TINYMCE,
            ]);
        }
        PermissionHandler::registerPermissions('Rules', [
            'admincp.rules' => $this->_rules_language->get('rules', 'rules')
        ]);
        
        $cache->setCache('nav_location');
        if(!$cache->isCached('rules_location')){
            $link_location = 1;
            $cache->store('rules_location', 1);
        } else {
            $link_location = $cache->retrieve('rules_location');
        }
        
        $cache->setCache('navbar_icons');
        if(!$cache->isCached('rules_icon')) {
            $icon = '';
        } else {
            $icon = $cache->retrieve('rules_icon');
        }
        
        $cache->setCache('navbar_order');
        if(!$cache->isCached('rules_order')){
            // Create cache entry now
            $rules_order = 3;
            $cache->store('rules_order', 3);
        } else {
            $rules_order = $cache->retrieve('rules_order');
        }
        
        switch($link_location){
            case 1:
                $navs[0]->add('rules', $this->_rules_language->get('rules', 'rules'), URL::build('/rules'), 'top', null, $rules_order, $icon);
            break;
            case 2:
                $navs[0]->addItemToDropdown('more_dropdown', 'rules', $this->_rules_language->get('rules', 'rules'), URL::build('/rules'), 'top', null, $icon, $rules_order);
            break;
            case 3:
                $navs[0]->add('rules', $this->_rules_language->get('rules', 'rules'), URL::build('/rules'), 'footer', null, $rules_order, $icon);
            break;
        }

        if(defined('BACK_END')){
            if($user->hasPermission('admincp.rules')){
                $cache->setCache('panel_sidebar');
                if(!$cache->isCached('rules_new_order')){
                    $order = 14;
                    $cache->store('rules_new_order', 14);
                } else {
                    $order = $cache->retrieve('rules_new_order');
                }

                if(!$cache->isCached('rules_icon')){
                    $icon = '<i class="nav-icon fas fa-cogs"></i>';
                    $cache->store('rules_icon', $icon);
                } else {
                    $icon = $cache->retrieve('rules_icon');
                }
                
                $navs[2]->add('rules_divider', mb_strtoupper($this->_rules_language->get('rules', 'rules'), 'UTF-8'), 'divider', 'top', null, $order, '');
                $navs[2]->add('rules', $this->_rules_language->get('rules', 'rules'), URL::build('/panel/rules'), 'top', null, $order + 0.1, $icon);
            }
        }
    }

    public function getDebugInfo(): array {
        return [];
    }
}
