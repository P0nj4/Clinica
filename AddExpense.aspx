<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddExpense.aspx.cs" Inherits="AddExpense" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Balloons" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="portlet box blue">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-user-plus"></i>Ingreso de gasto
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
                        <label class="control-label col-md-3">Nombre o entidad</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtName" CssClass="form-control" runat="server" required />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3">Monto</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtAmount" CssClass="form-control" runat="server" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Fecha de pago</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtDate" CssClass="form-control birthDay" runat="server" required />
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
<asp:Content ID="Content4" ContentPlaceHolderID="scripts" Runat="Server">
    <script src="./assets/admin/pages/scripts/components-form-tools.js"></script>
    <script src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript" ></script>
    <script src="assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery-validation/js/localization/messages_es.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //Time picker
        $.fn.datepicker.dates['en'] = {
            days: ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"],
            daysShort: ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb", "Dom"],
            daysMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa", "Do"],
            months: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
            monthsShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
            today: "Hoy",
            suffix: [],
            meridiem: []
        };
        $('.birthDay').datepicker({ 'format': 'dd/mm/yyyy' });

        $("#form1").validate();

        $.validator.addMethod("myDate", function (value, element) {
            return this.optional(element) || /(((0[1-9]|[12][0-9]|3[01])([/])(0[13578]|10|12)([/])(\d{4}))|(([0][1-9]|[12][0-9]|30)([/])(0[469]|11)([/])(\d{4}))|((0[1-9]|1[0-9]|2[0-8])([/])(02)([/])(\d{4}))|((29)(\.|-|\/)(02)([/])([02468][048]00))|((29)([/])(02)([/])([13579][26]00))|((29)([/])(02)([/])([0-9][0-9][0][48]))|((29)([/])(02)([/])([0-9][0-9][2468][048]))|((29)([/])(02)([/])([0-9][0-9][13579][26])))/i.test(value);
        }, "Ingrese una fecha válida.");

        $(".birthDay").rules("add", {
            myDate: true
        });

    });


</script>
</asp:Content>

