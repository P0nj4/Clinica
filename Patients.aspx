<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Patients.aspx.cs" Inherits="Patients" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
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
                <table class="table patientsTable turnDataTable">
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
                            <th>Consultas
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
                            <td>30
                            </td>
                            <td>Table cell
                            </td>
                            <td>1
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
                            <td>7
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
                            <td>12
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
                            <td>Mauricio Lopez
                            </td>
                            <td>44
                            </td>
                            <td>Table cell
                            </td>
                            <td>2
                            </td>
                            <td>10/10/2007
                            </td>
                            <td>
                                <a class="btn btn-sm blue" data-toggle="modal" href="#opciones">Opciones
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>3
                            </td>
                            <td>Rodrígo Gómez
                            </td>
                            <td>33
                            </td>
                            <td>Table cell
                            </td>
                            <td>2
                            </td>
                            <td>10/12/2012
                            </td>
                            <td>
                                <a class="btn btn-sm blue" data-toggle="modal" href="#opciones">Opciones
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>3
                            </td>
                            <td>Florencia Ferrón
                            </td>
                            <td>18
                            </td>
                            <td>Table cell
                            </td>
                            <td>5
                            </td>
                            <td>05/01/2014
                            </td>
                            <td>
                                <a class="btn btn-sm blue" data-toggle="modal" href="#opciones">Opciones
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>3
                            </td>
                            <td>Zuima Delgado
                            </td>
                            <td>81
                            </td>
                            <td>Table cell
                            </td>
                            <td>1
                            </td>
                            <td>07/05/2008
                            </td>
                            <td>
                                <a class="btn btn-sm blue" data-toggle="modal" href="#opciones">Opciones
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>3
                            </td>
                            <td>Cecilia Boccio
                            </td>
                            <td>36
                            </td>
                            <td>Table cell
                            </td>
                            <td>1
                            </td>
                            <td>10/04/2009
                            </td>
                            <td>
                                <a class="btn btn-sm blue" data-toggle="modal" href="#opciones">Opciones
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>3
                            </td>
                            <td>Natalia Costa
                            </td>
                            <td>36
                            </td>
                            <td>Table cell
                            </td>
                            <td>999999
                            </td>
                            <td>07/02/2015
                            </td>
                            <td>
                                <a class="btn btn-sm blue" data-toggle="modal" href="#opciones">Opciones
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>3
                            </td>
                            <td>Ulises Pereyra
                            </td>
                            <td>36
                            </td>
                            <td>Table cell
                            </td>
                            <td>8
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
                            <td>Roberto Rodríguez
                            </td>
                            <td>46
                            </td>
                            <td>Table cell
                            </td>
                            <td>4
                            </td>
                            <td>10/01/2014
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
                                <option>Ver más información</option>
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
    

    <script type="text/javascript">
        

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
                        url: "./handlers/UserHandler.ashx",
                        data: { method: "updateuser", time: "2pm" },
                        success: function (data) {
                            Metronic.unblockUI();
                            if (data.error) {
                                alert(data.errorMessage);
                            }
                        }
                    });
                } 
            }
        }


    </script>
</asp:Content>

