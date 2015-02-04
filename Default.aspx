<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
                <table class="table">
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
                                <a href="#">Editar</a> &nbsp; <a href="#">Eliminar</a>
                            </td>
                        </tr>
                        <tr>
                            <td>1
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
                                <a href="#">Editar</a> &nbsp; <a href="#">Eliminar</a>
                            </td>
                        </tr>
                        <tr>
                            <td>1
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
                                <a href="#">Editar</a> &nbsp; <a href="#">Eliminar</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- fin de tabla de pacientes -->

        </div>
    </div>
</asp:Content>

