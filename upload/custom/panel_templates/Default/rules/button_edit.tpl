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
                            <h5 style="display:inline">{$EDIT_BUTTON}</h5>
                            <div class="float-md-right"><a href="{$BACK_LINK}" class="btn btn-warning">{$BACK}</a></div>
                            <hr />
                            <!-- Success and Error Alerts -->
                            {include file='includes/alerts.tpl'}
                            <form action="" method="post">
                                <div class="form-group">
                                    <label for="InputButtonName">{$RULES_BUTTON_NAME}</label>
                                    <input type="text" id="InputButtonName" placeholder="{$RULES_BUTTON_NAME}"
                                        name="rules_button_name" class="form-control"
                                        value="{$RULES_BUTTON_NAME_VALUE}">
                                </div>
                                <div class="form-group">
                                    <label for="InputButtonLink">{$RULES_BUTTON_LINK}</label>
                                    <input type="text" id="InputButtonLink" placeholder="{$RULES_BUTTON_LINK}"
                                        name="rules_button_link" class="form-control"
                                        value="{$RULES_BUTTON_LINK_VALUE}">
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