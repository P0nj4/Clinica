<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddPatient.aspx.cs" Inherits="AddPatient" MasterPageFile="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" type="text/css" href="../../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css">
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
                        <label class="control-label col-md-3">Fecha de nacimiento</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtDate" CssClass="form-control birthDay" runat="server" />
                        </div>

                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3">Telefono de contacto</label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server" />
                        </div>
                    </div>
                    <div class="form-group ">
											<label class="control-label col-md-3">Image Upload #1</label>
											<div class="col-md-9">
												<div class="fileinput fileinput-new" data-provides="fileinput">
													<div class="fileinput-preview thumbnail" data-trigger="fileinput" style="width: 200px; height: 150px;">
													</div>
													<div>
														<span class="btn default btn-file">
														<span class="fileinput-new">
														Select image </span>
														<span class="fileinput-exists">
														Change </span>
														<input type="file" name="...">
														</span>
														<a href="#" class="btn red fileinput-exists" data-dismiss="fileinput">
														Remove </a>
													</div>
												</div>
												<div class="clearfix margin-top-10">
													<span class="label label-danger">
													NOTE! </span>
													Image preview only works in IE10+, FF3.6+, Safari6.0+, Chrome6.0+ and Opera11.1+. In older browsers the filename is shown instead.
												</div>
											</div>
										</div>
                </div>
                <div class="form-actions">
                    <div class="row">
                        <div class="col-md-offset-3 col-md-9">
                            <button type="submit" class="btn green"><i class="fa fa-check"></i>Submit</button>
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
    <script type="text/javascript">
       
    </script>

</asp:Content>


