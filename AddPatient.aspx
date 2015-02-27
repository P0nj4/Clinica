﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddPatient.aspx.cs" Inherits="AddPatient" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="../../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css">
    <link rel="stylesheet" type="text/css" href="assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-user-plus"></i>Nuevo paciente
            </div>
            <div class="tools">
                <a href="javascript:;" class="collapse" data-original-title="" title=""></a>
                <a href="#portlet-config" data-toggle="modal" class="config" data-original-title="" title=""></a>
                <a href="javascript:;" class="reload" data-original-title="" title=""></a>
                <a href="javascript:;" class="remove" data-original-title="" title=""></a>
            </div>
        </div>
        <div class="portlet-body form">
            <div class="form-horizontal form-bordered">
                <div class="form-body">
                    <div class="form-group">
                        <label class="control-label col-md-3">Nombre</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtName" CssClass="form-control" runat="server" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3">Apellido</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtLastName" CssClass="form-control" runat="server" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3">E-Mail</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" />
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Telefono de contacto</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Fecha de nacimiento</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtDate" CssClass="form-control birthDay" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Lugar de nacimiento</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtBirhPlace" CssClass="form-control" runat="server" />
                        </div>
                    
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Descripci&oacute;n</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtDescription" TextMode="MultiLine" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                    <div class="form-group last">
                        <label class="control-label col-md-3">Referido</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtRefered" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                   
                </div>
                <div class="form-actions">
                    <div class="row">
                        <div class="col-md-offset-3 col-md-9">
                            <asp:Button CssClass="btn green" ID="btnSubmit" runat="server" Text="Guardar" OnClick="btnSubmit_Click" >
                              
                            </asp:Button>
                            <button type="button" class="btn default">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="place3" ContentPlaceHolderID="scripts" runat="server">

    <script src="./assets/admin/pages/scripts/components-form-tools.js"></script>
    <script src="assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript" ></script>
    <script type="text/javascript">
        $.fn.datetimepicker.dates['en'] = {
            days: ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"],
            daysShort: ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb", "Dom"],
            daysMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa", "Do"],
            months: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
            monthsShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
            today: "Hoy",
            suffix: [],
            meridiem: []
        };
        $('.birthDay').datetimepicker({ 'format': 'mm/dd/yyyy hh:ii P' });
    </script>

</asp:Content>


