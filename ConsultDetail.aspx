<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ConsultDetail.aspx.cs" Inherits="ConsultDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Balloons" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                        <label class="control-label col-md-3">Paciente</label>
                        <div class="col-md-4">
                            <asp:Label ID="lblPatientName" runat="server" CssClass="control-label col-md-3" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Fecha</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtDate" CssClass="form-control datePicker" runat="server" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Hora de comienzo</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtStartTime" CssClass="form-control timePicker" runat="server" required />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-md-3">Hora de fin</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtEndTime" CssClass="form-control timePicker" runat="server" required />
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Precio</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtPrice" CssClass="form-control txtPrice" runat="server" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Diagnostico</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtDiagnostic" CssClass="form-control" TextMode="MultiLine" runat="server" required />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">An&aacute;lisis cl&iacute;nico</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtClinicAnalysis" CssClass="form-control" TextMode="MultiLine" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Tratamiento</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtTreatment" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Rating de estado del paciente</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtRating" TextMode="MultiLine" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                    <div class="form-group last">
                        <label class="control-label col-md-3">Propuesta para la pr&oacute;xima consulta</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtPropusal" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                   
                </div>
                <div class="form-actions">
                    <div class="row">
                        <div class="col-md-offset-3 col-md-9">
                            <asp:Button CssClass="btn red" ID="btnCancel" runat="server" Text="Cancelar Consulta" OnClick="btnCancel_Click" />
                            <asp:Button CssClass="btn green" ID="btnSubmit" runat="server" Text="Guardar Cambios" OnClick="btnSubmit_Click" >
                            </asp:Button>
                             <asp:Button CssClass="btn default" ID="btnDiscard" runat="server" Text="Volver" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="scripts" Runat="Server">
    <script src="assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js" type="text/javascript" ></script>
    <script src="assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
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
            $('.datePicker').datepicker({ 'format': 'dd/mm/yyyy' });
            $('.timePicker').timepicker({ 'showMeridian': false, 'minuteStep': 5 });

            //Validation
            $("#form1").validate();

            $.validator.addMethod("myDate", function (value, element) {
                return this.optional(element) || /(((0[1-9]|[12][0-9]|3[01])([/])(0[13578]|10|12)([/])(\d{4}))|(([0][1-9]|[12][0-9]|30)([/])(0[469]|11)([/])(\d{4}))|((0[1-9]|1[0-9]|2[0-8])([/])(02)([/])(\d{4}))|((29)(\.|-|\/)(02)([/])([02468][048]00))|((29)([/])(02)([/])([13579][26]00))|((29)([/])(02)([/])([0-9][0-9][0][48]))|((29)([/])(02)([/])([0-9][0-9][2468][048]))|((29)([/])(02)([/])([0-9][0-9][13579][26])))/i.test(value);
            }, "Ingrese una fecha válida.");

            $.validator.addMethod("time", function (value, element) {
                return this.optional(element) || /^([0-1]?[0-9]|[2][0-3]):([0-5][0-9])$$/i.test(value);
            }, "Ingrese una hora válida.");

            $(".datePicker").rules("add", {
                myDate: true
            });

            $(".timePicker").rules("add", {
                time: true
            });

            $(".txtPrice").rules("add", {
                time: true
            });
        });


    </script>
</asp:Content>

