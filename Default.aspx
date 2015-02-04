<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Balloons" ContentPlaceHolderID="Balloons" runat="server">
    <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <a class="dashboard-stat dashboard-stat-light blue-soft" href="#">
                <div class="visual">
                    <i class="fa fa-globe"></i>
                </div>
                <div class="details">
                    <div class="number">
                        15
                    </div>
                    <div class="desc">
                        Consultas
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <a class="dashboard-stat dashboard-stat-light red-soft" href="#">
                <div class="visual">
                    <i class="fa fa-globe"></i>
                </div>
                <div class="details">
                    <div class="number">
                        100%
                    </div>
                    <div class="desc">
                        Asistencia
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <a class="dashboard-stat dashboard-stat-light green-soft" href="#">
                <div class="visual">
                    <i class="fa fa-globe"></i>
                </div>
                <div class="details">
                    <div class="number">
                        $54900
                    </div>
                    <div class="desc">
                        Ganancias
                    </div>
                </div>
            </a>
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <a class="dashboard-stat dashboard-stat-light purple-soft" href="#">
                <div class="visual">
                    <i class="fa fa-globe"></i>
                </div>
                <div class="details">
                    <div class="number">
                        0
                    </div>
                    <div class="desc">
                        Cancelaciones
                    </div>
                </div>
            </a>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-list"></i>Proximas consultas
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
                <table class="table">
                    <thead>
                        <tr>
                            <th>Paciente
                            </th>
                            <th>Hora de la consulta
                            </th>
                            <th>Minutos faltantes
                            </th>
                            <th>Acción
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>German Pereyra
                            </td>
                            <td>12:00
                            </td>
                            <td>
                                <span class="badge badge-danger">22</span>
                            </td>
                            <td>
                                <a href="#">Cancelar consulta</a>
                            </td>
                        </tr>
                        <tr>
                            <td>Maite Pereyra
                            </td>
                            <td>13:00
                            </td>
                            <td><span class="badge badge-warning">45</span>
                            </td>
                            <td>
                                <a href="#">Cancelar consulta</a>
                            </td>
                        </tr>
                        <tr>
                            <td>Leandro Pereyra
                            </td>
                            <td>13:05
                            </td>
                            <td>
                                <span class="badge badge-primary">120+ </span>
                            </td>
                            <td>
                                <a href="#">Cancelar consulta</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>



     <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-list"></i>Consultas sujetas a cambio de estado
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
                <table class="table">
                    <thead>
                        <tr>
                            <th>Paciente
                            </th>
                            <th>Hora de la consulta
                            </th>
                            <th>Minutos faltantes
                            </th>
                            <th>Acción
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>German Pereyra
                            </td>
                            <td>12:00
                            </td>
                            <td>
                                <span class="badge badge-danger">22</span>
                            </td>
                            <td>
                                <a href="#">Cancelar consulta</a>
                            </td>
                        </tr>
                        <tr>
                            <td>Maite Pereyra
                            </td>
                            <td>13:00
                            </td>
                            <td><span class="badge badge-warning">45</span>
                            </td>
                            <td>
                                <a href="#">Cancelar consulta</a>
                            </td>
                        </tr>
                        <tr>
                            <td>Leandro Pereyra
                            </td>
                            <td>13:05
                            </td>
                            <td>
                                <span class="badge badge-primary">120+ </span>
                            </td>
                            <td>
                                <a href="#">Cancelar consulta</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

