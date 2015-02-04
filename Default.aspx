<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                            <td>12>00
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
                            <td>13>00
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
                            <td>13>05
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

