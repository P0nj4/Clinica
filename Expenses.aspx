<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Expenses.aspx.cs" Inherits="Expenses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Balloons" Runat="Server">
    <!--
    <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <a class="dashboard-stat dashboard-stat-light blue-soft" href="#">
                <div class="visual">
                    <i class="fa fa-users"></i>
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
                    <i class="fa fa-pie-chart"></i>
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
                    <i class="fa fa-usd"></i>
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
                    <i class="fa fa-user-times"></i>
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
    -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-list"></i>Listado de gastos
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
                            <th>Nombre
                            </th>
                            <th>Fecha de pago
                            </th>
                            <th>Monto
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptExpenses" runat="server" OnItemDataBound="rptExpenses_OnItemDataBound">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Literal ID="litName" runat="server" />
                                    </td>
                                    <td>
                                        <asp:Literal ID="litDay" runat="server" />
                                    </td>
                                    <td>
                                        <asp:Literal ID="litAmount" runat="server" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- fin Proximas consultas -->


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scripts" Runat="Server">
</asp:Content>

