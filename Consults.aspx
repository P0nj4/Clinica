<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Consults.aspx.cs" Inherits="Consults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Balloons" ContentPlaceHolderID="Balloons" runat="server">
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-list"></i>Listado de consultas
            </div>
            <div class="tools">
                <a href="javascript:;" class="collapse" data-original-title="" title=""></a>
                <a href="#portlet-config" data-toggle="modal" class="config" data-original-title="" title=""></a>
                <a href="javascript:;" class="reload" data-original-title="" title=""></a>
                <a href="javascript:;" class="remove" data-original-title="" title=""></a>
            </div>
        </div>
        <div class="portlet-body">
            <div class="table-responsive">
                <table class="table turnDataTable">
                    <thead>
                        <tr>
                            <th>Paciente
                            </th>
                            <th>Fecha de la consulta
                            </th>
                            <th>Estado
                            </th>
                            <th>Acción
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>German Pereyra
                            </td>
                            <td>25/07/2014 12:00
                            </td>
                            <td>
                                <span class="label label-danger tooltips" data-original-title="El cliente no concurrió">Cancelada</span>
                            </td>
                            <td>
                                <a href="#change-status" data-toggle="modal" class="config" data-original-title="" title="">Cambiar estado</a>
                            </td>
                        </tr>
                        <tr>
                            <td>Maite Pereyra
                            </td>
                            <td>12/12/2012 13:00
                            </td>
                            <td><span class="label label-info">Pendiente</span>
                            </td>
                            <td>
                                <a href="#change-status" data-toggle="modal" class="config" data-original-title="" title="">Cambiar estado</a>
                            </td>
                        </tr>
                        <tr>
                            <td>Leandro Pereyra
                            </td>
                            <td>12/01/2015 13:05
                            </td>
                            <td>
                                <span class="label label-success">Concurrió</span>
                            </td>
                            <td>
                                <a href="#change-status" data-toggle="modal" class="config" data-original-title="" title="">Cambiar estado</a>
                            </td>
                        </tr>
                        <tr>
                            <td>Natalia Costa
                            </td>
                            <td>12/01/2015 13:05
                            </td>
                            <td>
                                <span class="label label-success">Concurrió</span>
                            </td>
                            <td>
                                <a href="#change-status" data-toggle="modal" class="config" data-original-title="" title="">Cambiar estado</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
   

    <div class="modal fade bs-modal-sm" id="change-status" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="" class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                        <h4 class="modal-title">Cambiar estado de la consulta a:</h4>
                    </div>
                    <div class="modal-body">
                        <div class="btn-group" data-toggle="buttons">
                            <label class="btn btn-default">
                                <input type="radio" class="toggle">
                                Consulta confirmada
                            </label>
                            <label class="btn btn-default">
                                <input type="radio" class="toggle">
                                Conculta cancelada
                            </label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn blue">Save changes</button>
                        <button type="button" class="btn default" data-dismiss="modal">Close</button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
        </div>
        <!-- /.modal-dialog -->
    </div>
</asp:Content>
<asp:Content ID="scripts" runat="server" ContentPlaceHolderID="scripts">
    
</asp:Content>


