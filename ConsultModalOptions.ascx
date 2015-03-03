<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ConsultModalOptions.ascx.cs" Inherits="ConsultModalOptions" %>
<div class="modal fade " id="opciones" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
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
                            <option>Cambiar estado</option>
                            <option>Editar</option>
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
<input type="hidden" id="selectedConsultId" value="0" />
<div class="modal fade" id="Estados" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="loadingConsultData" style="display:none"></div>
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h4 class="modal-title">Selecciona una opci&oacute;n</h4>
            </div>
            <div class="modal-body">
                <div class="form-horizontal form-bordered">
                    <div class="form-body">
                        <div class="form-group">
                            <label class="control-label col-md-3">Estado</label>
                            <div class="col-md-9">
                                <asp:DropDownList ID="ddlState" CssClass="ddlState" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">An&aacute;lisis cl&iacute;nico</label>
                            <div class="col-md-9">
                                <asp:TextBox ID="txtClinicAnalysis" CssClass="form-control" TextMode="MultiLine" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Tratamiento</label>
                            <div class="col-md-9">
                                <asp:TextBox ID="txtTreatment" CssClass="form-control" TextMode="MultiLine" runat="server" />
                            </div>
                        </div>
                        <div class="form-group last">
                            <label class="control-label col-md-3">Propuesta para la pr&oacute;xima consulta</label>
                            <div class="col-md-9">
                                <asp:TextBox ID="txtPropusal" CssClass="form-control" TextMode="MultiLine" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-md-3">Rating de estado del paciente</label>
                            <div class="col-md-9 noEdit">
                                <asp:TextBox ID="txtRating" CssClass="form-control rating" runat="server" />
                            </div>
                        </div>
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
<style>
    .loadingConsultData {
        display: block;
height: 100%;
width: 100%;
background-color: gray;
float: left;
position: absolute;
z-index: 1000;
opacity: 0.5;
    }

</style>

    <script src="assets/global/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script>
<script type="text/javascript">

    $(document).ready(function () {
        $(".options").click(function () {
            consultId = $(this).attr('consultid');
            $("#selectedConsultId").val(consultId);
        });

        $(".rating").TouchSpin({
            initval: 1,
            max: 10,
            min: 1
        });
    });

    function doOptionAction() {
        var selectedOption = $(".selectedOption option:selected").html();
        if (selectedOption == "Ver más información") {
            window.location.href = "ConsultDetail.aspx?consultId=" + $("#selectedConsultId").val();
        }
        if (selectedOption == "Editar") {
            window.location.href = "ConsultDetail.aspx?consultId=" + $("#selectedConsultId").val() + "&edit=1";
        }
        if (selectedOption == "Cambiar estado") {
            // window.location.href = "ConsultDetail.aspx?consultId=" + $("#selectedConsultId").val() + "&edit=1";
            modal = $('#Estados').modal('show');
            modal.on('show.bs.modal', function (e) {
                //if (!data) return e.preventDefault() // stops modal from being shown
                getConsultDetails();
            });
        }
    }

    function getConsultDetails() {
        $(".loadingConsultData").show();
        $.ajax({
        type: "POST",
        url: "handlers/UserHandler.ashx",
        data: { method: "getconsult", consultId: $("#selectedConsultId").val() }
        }).done(function (msg) {
            $(".loadingConsultData").hide();
            alert( "Data Saved: " + msg );
        }).fail(function( jqXHR, textStatus ) {
            $(".loadingConsultData").hide();
            alert( "Request failed: " + textStatus );
        });
    }
</script>
