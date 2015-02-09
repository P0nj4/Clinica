<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Calendar.aspx.cs" Inherits="Calendar" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">
    <link href="assets/global/plugins/fullcalendar/fullcalendar.min.css" rel='stylesheet' />
    <link href="assets/global/plugins/fullcalendar/fullcalendar.print.css" rel='stylesheet' media='print' />

    <link type="text/css" href="assets/global/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" />
    <link href="./assets/global/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" />
    <style>
        .fc-left {
            left: 250px;
            position: absolute;
        }
    </style>
</asp:Content>
<asp:Content ID="bodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="portlet box green-meadow calendar">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-gift"></i>Calendario de consultas
            </div>
        </div>
        <div class="portlet-body">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div id="calendar" class="has-toolbar">
                    </div>
                </div>
            </div>
            <!-- END CALENDAR PORTLET-->
        </div>
    </div>

    <div class="modal fade" id="addConsult" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                    <h4 class="modal-title">Agendar consulta</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group">
                                <label class="control-label col-md-3">Extra Large</label>
                                <div class="col-md-9">
                                    <select id="ddlUsers" class="form-control select2me" data-placeholder="Select...">
                                        <option value=""></option>
                                        <option value="AL">Alabama</option>
                                        <option value="WY">Wyoming</option>
                                    </select>
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


</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="scripts" runat="server">

    <script src="assets/global/plugins/fullcalendar/lib/moment.min.js"></script>
    <script src="assets/global/plugins/fullcalendar/fullcalendar.js"></script>
    <script type="text/javascript" src="assets/global/plugins/fullcalendar/lang-all.js"></script>

    <script type="text/javascript" src="./assets/global/plugins/bootstrap-select/bootstrap-select.min.js"></script>
<script type="text/javascript" src="./assets/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="./assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>

    <script type="text/javascript">

        

        function addEvent() {
            var calendar = $('#calendar');
            calendar.fullCalendar('addEventSource', [
                     {
                         title: 'Germán',
                         start: '2014-11-01'
                     }]);
        }

        jQuery(document).ready(function () {
            $('#ddlUsers').select2({
                placeholder: "Select an option",
                allowClear: true
            });

            // initiate layout and plugins
            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                lang: 'es',
                editable: true,
                droppable: false, // this allows things to be dropped onto the calendar
                drop: function () {
                    // is the "remove after drop" checkbox checked?
                    //if ($('#drop-remove').is(':checked')) {
                    // if so, remove the element from the "Draggable Events" list
                    $(this).remove();
                    //}
                },
                eventSources: {
                    url: '/handlers/CalendarEvents.ashx',
                    error: function (data) {
                        if (data) {
                            alert('error ' + data);
                        } else {
                            alert('error');
                        }
                    },
                    success: function (replyObject) {
                        return replyObject;
                    }
                },
                dayClick: function (date, jsEvent, view) {
                    alert('Clicked on: ' + date.format('YYYY-MM-DD'));
                    alert('Current view: ' + view.name);
                    $(this).css('background-color', 'red');
                    $('#addConsult').modal('show');
                }
            });
        });

    </script>

</asp:Content>
