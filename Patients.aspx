<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Patients.aspx.cs" Inherits="Patients" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/1.10.4/css/jquery.dataTables.min.css" />
    <style>
        #opciones .form-group {
            margin-bottom: 32px;
        }

            #opciones .form-group > label {
                margin-top: 6px;
            }

        #DataTables_Table_0_filter 
        {
            display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-list"></i>Pacientes
            </div>
            <div class="tools">
                <a href="javascript:;" class="collapse" data-original-title="" title=""></a>
                <a href="#portlet-config" data-toggle="modal" class="config" data-original-title="" title=""></a>
                <a href="javascript:;" class="reload" data-original-title="" title=""></a>
                <a href="javascript:;" class="remove" data-original-title="" title=""></a>
            </div>
        </div>
        <div class="portlet-body">

            <!-- tabla de Pacientes -->

            <div class="table-toolbar">
                <div class="row">
                    <div class="col-md-6">
                        <div class="btn-group">
                            <button id="sample_editable_1_new" class="btn green">
                                Agregar nuevo Paciente <i class="fa fa-plus"></i>
                            </button>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="btn-group pull-right">
                            <button class="btn dropdown-toggle" data-toggle="dropdown">
                                Tools <i class="fa fa-angle-down"></i>
                            </button>
                            <ul class="dropdown-menu pull-right">
                                <li>
                                    <a href="#">Print </a>
                                </li>
                                <li>
                                    <a href="#">Save as PDF </a>
                                </li>
                                <li>
                                    <a href="#">Export to Excel </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table patientsTable">
                    <thead>
                        <tr>
                            <th>#
                            </th>
                            <th>Nombre
                            </th>
                            <th>Edad
                            </th>
                            <th>Table heading
                            </th>
                            <th>Table heading
                            </th>
                            <th>Ultima consulta
                            </th>
                            <th>Acciones
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1
                            </td>
                            <td>German Pereyra
                            </td>
                            <td>31
                            </td>
                            <td>Table cell
                            </td>
                            <td>Table cell
                            </td>
                            <td>11/12/1999
                            </td>
                            <td>
                                <a class="btn btn-sm blue" data-toggle="modal" href="#opciones">Opciones
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>2
                            </td>
                            <td>Mirian Rodriguez
                            </td>
                            <td>51
                            </td>
                            <td>Table cell
                            </td>
                            <td>Table cell
                            </td>
                            <td>01/04/2014
                            </td>
                            <td>
                                <a class="btn btn-sm blue" data-toggle="modal" href="#opciones">Opciones
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>3
                            </td>
                            <td>Federico Pereyra
                            </td>
                            <td>36
                            </td>
                            <td>Table cell
                            </td>
                            <td>Table cell
                            </td>
                            <td>10/12/2009
                            </td>
                            <td>
                                <a class="btn btn-sm blue" data-toggle="modal" href="#opciones">Opciones
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>3
                            </td>
                            <td>Federico Pereyra
                            </td>
                            <td>36
                            </td>
                            <td>Table cell
                            </td>
                            <td>Table cell
                            </td>
                            <td>10/12/2009
                            </td>
                            <td>
                                <a class="btn btn-sm blue" data-toggle="modal" href="#opciones">Opciones
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>3
                            </td>
                            <td>Federico Pereyra
                            </td>
                            <td>36
                            </td>
                            <td>Table cell
                            </td>
                            <td>Table cell
                            </td>
                            <td>10/12/2009
                            </td>
                            <td>
                                <a class="btn btn-sm blue" data-toggle="modal" href="#opciones">Opciones
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>3
                            </td>
                            <td>Federico Pereyra
                            </td>
                            <td>36
                            </td>
                            <td>Table cell
                            </td>
                            <td>Table cell
                            </td>
                            <td>10/12/2009
                            </td>
                            <td>
                                <a class="btn btn-sm blue" data-toggle="modal" href="#opciones">Opciones
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>3
                            </td>
                            <td>Federico Pereyra
                            </td>
                            <td>36
                            </td>
                            <td>Table cell
                            </td>
                            <td>Table cell
                            </td>
                            <td>10/12/2009
                            </td>
                            <td>
                                <a class="btn btn-sm blue" data-toggle="modal" href="#opciones">Opciones
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>3
                            </td>
                            <td>Federico Pereyra
                            </td>
                            <td>36
                            </td>
                            <td>Table cell
                            </td>
                            <td>Table cell
                            </td>
                            <td>10/12/2009
                            </td>
                            <td>
                                <a class="btn btn-sm blue" data-toggle="modal" href="#opciones">Opciones
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>3
                            </td>
                            <td>Federico Pereyra
                            </td>
                            <td>36
                            </td>
                            <td>Table cell
                            </td>
                            <td>Table cell
                            </td>
                            <td>10/12/2009
                            </td>
                            <td>
                                <a class="btn btn-sm blue" data-toggle="modal" href="#opciones">Opciones
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>3
                            </td>
                            <td>Federico Pereyra
                            </td>
                            <td>36
                            </td>
                            <td>Table cell
                            </td>
                            <td>Table cell
                            </td>
                            <td>10/12/2009
                            </td>
                            <td>
                                <a class="btn btn-sm blue" data-toggle="modal" href="#opciones">Opciones
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>3
                            </td>
                            <td>Federico Pereyra
                            </td>
                            <td>36
                            </td>
                            <td>Table cell
                            </td>
                            <td>Table cell
                            </td>
                            <td>10/12/2009
                            </td>
                            <td>
                                <a class="btn btn-sm blue" data-toggle="modal" href="#opciones">Opciones
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- fin de tabla de pacientes -->

        </div>
    </div>

    <div class="modal fade bs-modal-sm" id="opciones" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">Selecciona una opci&oacute;n</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="control-label col-md-3">Opci&oacute;n</label>
                        <div class="col-md-9">
                            <select class="bs-select form-control selectedOption">
                                <option>Agendar consulta</option>
                                <option>Editar</option>
                                <option>Eliminar</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn default" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn blue" onclick="doOptionAction()">Aceptar</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
</asp:Content>
<asp:Content ID="sss" ContentPlaceHolderID="scripts" runat="server">
    <<script src="./assets/global/plugins/jquery.dataTables.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(document).ready(function () {
                oTable = $('.patientsTable').DataTable({
                    "oLanguage": {
                        "oPaginate": {
                            "sFirst": "Primer página",
                            "sLast": "Última página",
                            "sNext": "Siguiente",
                            "sPrevious": "Anterior"
                        },
                        "sEmptyTable": "No hay información para mostrar",
                        "sInfo": " Del _START_ al _END_ de un total de _TOTAL_ entradas",
                        "sInfoEmpty": "No nada para mostrar",
                        "sInfoFiltered": "- (Filtro sobre un total de _MAX_ entradas)",
                        "sLengthMenu": "Mostrar de a _MENU_ entradas"
                    }
                });
                $('#txtSearchField').keyup(function () {
                    oTable.search($(this).val()).draw();
                })
            });
        });

        function doOptionAction() {
            var selectedOption = $(".selectedOption option:selected").html();
            if (selectedOption == "Eliminar") {
                var r = confirm("Confirme que desea eliminar");
                if (r == true) {
                    $('#opciones').modal('toggle');

                    Metronic.blockUI({
                        boxed: true
                    });

                    $.ajax({
                        type: "POST",
                        url: "./handlers/UserUpdateHandler.ashx",
                        data: { name: "John", time: "2pm" },
                        success: function (data) {
                            Metronic.unblockUI();
                        }
                    });
                } else {
                    txt = "You pressed Cancel!";
                }
            }
        }


    </script>
</asp:Content>

