<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Calendar.aspx.cs" Inherits="Calendar" %>

<asp:Content ID="bodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="portlet box green-meadow calendar">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-gift"></i>Calendar
								</div>
							</div>
							<div class="portlet-body">
								<div class="row">
									<div class="col-md-3 col-sm-12">
										<!-- BEGIN DRAGGABLE EVENTS PORTLET-->
										<h3 class="event-form-title">Draggable Events</h3>
										<div id="external-events">
											<form class="inline-form">
												<input type="text" value="" class="form-control" placeholder="Event Title..." id="event_title"/><br/>
												<a href="javascript:;" id="event_add" class="btn default">
												Add Event </a>
											</form>
											<hr/>
											<div id="event_box">
											</div>
											<label for="drop-remove">
											<input type="checkbox" id="drop-remove"/>remove after drop </label>
											<hr class="visible-xs"/>
										</div>
										<!-- END DRAGGABLE EVENTS PORTLET-->
									</div>
									<div class="col-md-9 col-sm-12">
										<div id="calendar" class="has-toolbar">
										</div>
									</div>
								</div>
								<!-- END CALENDAR PORTLET-->
							</div>
						</div>

</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="scripts" runat="server">

    <script src="./assets/admin/layout2/scripts/demo.js" type="text/javascript"></script>
<script src="./assets/admin/pages/scripts/calendar.js"></script>

</asp:Content>