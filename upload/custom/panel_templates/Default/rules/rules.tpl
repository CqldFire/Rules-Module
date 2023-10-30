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
                            <a href="{$NEW_CATAGORY_LINK}" class="btn btn-primary">{$NEW_CATAGORY}</a>
                            <hr />
                            <!-- Success and Error Alerts -->
                            {include file='includes/alerts.tpl'}
                            {if count($CATAGORY_LIST)}
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <tbody>
                                            <tr>
                                                <td><strong>{$RULES_CATAGORY_NAME}</strong></td>
                                                <td><strong>
                                                        <div class="float-md-right">{$RULES_ACTION}</div>
                                                    </strong></td>
                                            </tr>
                                            {foreach from=$CATAGORY_LIST item=catagory}
                                                <tr>
                                                    <td>
                                                        <strong>{$catagory.name}</strong>
                                                    </td>
                                                    <td>
                                                        <div class="float-md-right">
                                                            <a class="btn btn-warning btn-sm" href="{$catagory.edit_link}"><i
                                                                    class="fas fa-edit fa-fw"></i></a>
                                                            <button class="btn btn-danger btn-sm" type="button"
                                                                onclick="showDeleteModal('{$catagory.delete_link}')"><i
                                                                    class="fas fa-trash fa-fw"></i></button>
                                                        </div>
                                                    </td>
                                                </tr>
                                            {/foreach}
                                        </tbody>
                                    </table>
                                </div>
                            {else} {$NO_RULES_CATAGORIES} 
                            {/if}
                            <hr>
                            <a href="{$NEW_BUTTON_LINK}" class="btn btn-primary">{$NEW_BUTTON}</a>
                            <hr />
                            {if count($BUTTON_LIST)}
                                <div class="table-responsive">
                                    <table class="table table-striped">
                                        <tbody>
                                            <tr>
                                                <td><strong>{$RULES_BUTTON_NAME}</strong></td>
                                                <td><strong>
                                                        <div class="float-md-right">{$RULES_ACTION}</div>
                                                    </strong></td>
                                            </tr>
                                            {foreach from=$BUTTON_LIST item=button}
                                                <tr>
                                                    <td>
                                                        <strong>{$button.name}</strong>
                                                    </td>
                                                    <td>
                                                        <div class="float-md-right">
                                                            <a class="btn btn-warning btn-sm" href="{$button.edit_link}"><i
                                                                    class="fas fa-edit fa-fw"></i></a>
                                                            <button class="btn btn-danger btn-sm" type="button"
                                                                onclick="showDeleteButtonModal('{$button.delete_link}')"><i
                                                                    class="fas fa-trash fa-fw"></i></button>
                                                        </div>
                                                    </td>
                                                </tr>
                                            {/foreach}
                                        </tbody>
                                    </table>
                                </div>
                            {else} {$NO_RULES_BUTTONS} 
                            {/if}
                            <hr>
                            <form action="" method="post">
                                <div class="form-group">
                                    <label for="link_location">{$LINK_LOCATION}</label>
                                    <select class="form-control" id="link_location" name="link_location">
                                        <option value="1" {if $LINK_LOCATION_VALUE eq 1} selected{/if}>{$LINK_NAVBAR}
                                        </option>
                                        <option value="2" {if $LINK_LOCATION_VALUE eq 2} selected{/if}>{$LINK_MORE}
                                        </option>
                                        <option value="3" {if $LINK_LOCATION_VALUE eq 3} selected{/if}>{$LINK_FOOTER}
                                        </option>
                                        <option value="4" {if $LINK_LOCATION_VALUE eq 4} selected{/if}>{$LINK_NONE}
                                        </option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="inputIcon">{$ICON}</label>
                                    <input type="text" class="form-control" name="icon" id="inputIcon"
                                        placeholder="{$ICON_EXAMPLE}" value="{$ICON_VALUE}">
                                </div>
                                <div class="form-group">
                                    <label for="InputMessage">{$MESSAGE}</label><br />
                                    <textarea name="message" rows="3" id="InputMessage"
                                        class="form-control">{$MESSAGE_VALUE}</textarea>
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

        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">{$ARE_YOU_SURE}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        {$CONFIRM_DELETE_CATAGORY}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                        <a href="#" id="deleteLink" class="btn btn-primary">{$YES}</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="deleteButtonModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">{$ARE_YOU_SURE}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        {$CONFIRM_DELETE_BUTTON}
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                        <a href="#" id="deleteButtonLink" class="btn btn-primary">{$YES}</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- End Wrapper -->
    </div>

    {include file='scripts.tpl'}

    <script type="text/javascript">
        function showDeleteModal(id) {
            $('#deleteLink').attr('href', id);
            $('#deleteModal').modal().show();
        }

        function showDeleteButtonModal(id) {
            $('#deleteButtonLink').attr('href', id);
            $('#deleteButtonModal').modal().show();
        }
    </script>

</body>

</html>