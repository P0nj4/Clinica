<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Consults.aspx.cs" Inherits="Consults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Balloons" ContentPlaceHolderID="Balloons" runat="server">
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    
      <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-list"></i>Consultas del paciente
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
                            <th>ID
                            </th>
                            <th>Hora de la consulta
                            </th>
                            <th>Nombre
                            </th>
                            <th>Teléfono
                            </th>
                            <th>Estado
                            </th>
                            <th>Acción
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptConsults" runat="server" OnItemDataBound="rptConsults_OnItemDataBound">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Literal ID="litId" runat="server" />
                                    </td>
                                    <td>
                                        <asp:Literal ID="litHour" runat="server" />
                                    </td>
                                    <td>
                                        <asp:Literal ID="litName" runat="server" />
                                    </td>
                                    <td>
                                        <asp:Literal ID="litPhone" runat="server" />
                                    </td>
                                    <td>
                                        <asp:Literal ID="litEstado" runat="server" />
                                    </td>
                                    <td>
                                        <asp:Literal ID="litAction" runat="server" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
   

</asp:Content>
<asp:Content ID="scripts" runat="server" ContentPlaceHolderID="scripts">
    
</asp:Content>


