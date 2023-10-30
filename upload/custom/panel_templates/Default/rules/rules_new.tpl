{include file='header.tpl'}

<body id="page-top">

    <!-- Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        {include file='sidebar.tpl'}

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main content -->
            <div id="content">

                <!-- Topbar -->
                {include file='navbar.tpl'}

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">{$RULES}</h1>
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="{$PANEL_INDEX}">{$DASHBOARD}</a></li>
                            <li class="breadcrumb-item active">{$RULES}</li>
                        </ol>
                    </div>

                    <!-- Update Notification -->
                    {include file='includes/update.tpl'}
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <h5 style="display:inline">{$NEW_CATAGORY}</h5>
                            <div class="float-md-right">
                                <a href="{$BACK_LINK}" class="btn btn-warning">{$BACK}</a>
                            </div>
                            <hr />
                            <!-- Success and Error Alerts -->
                            {include file='includes/alerts.tpl'}
                            <form action="" method="post">
                                <div class="form-group">
                                    <label for="InputCatagoryName">{$RULES_CATAGORY_NAME}</label>
                                    <input type="text" id="InputCatagoryName" placeholder="{$RULES_CATAGORY_NAME}"
                                        name="rules_catagory_name" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="InputCatagoryIcon">{$RULES_CATAGORY_ICON}</label>
                                    <input type="text" id="InputCatagoryIcon" placeholder="{$RULES_CATAGORY_ICON}"
                                        name="rules_catagory_icon" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label for="InputCatagoryRules">{$RULES_CATAGORY_RULES}</label>
                                    <textarea name="rules_catagory_rules" rows="3" id="InputCatagoryRules"
                                        class="form-control" placeholder="{$RULES_CATAGORY_RULES}"></textarea>
                                </div>
                                <div class="form-group">
                                    <input type="hidden" name="token" value="{$TOKEN}">
                                    <input type="submit" class="btn btn-primary" value="{$SUBMIT}">
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Spacing -->
                    <div style="height:1rem;"></div>

                    <!-- End Page Content -->
                </div>

                <!-- End Main Content -->
            </div>

            {include file='footer.tpl'}

            <!-- End Content Wrapper -->
        </div>

        <!-- End Wrapper -->
    </div>

    {include file='scripts.tpl'}

</body>

</html>