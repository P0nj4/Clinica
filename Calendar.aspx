﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Calendar.aspx.cs" Inherits="Calendar" %>

<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">
    <link href="assets/global/plugins/fullcalendar/fullcalendar.min.css" rel='stylesheet' />
    <link href="assets/global/plugins/fullcalendar/fullcalendar.print.css" rel='stylesheet' media='print' />

    <!-- Picker styles -->
    <link rel="stylesheet" type="text/css" href="./assets/global/plugins/bootstrap-select/bootstrap-select.min.css">
    <link rel="stylesheet" type="text/css" href="./assets/global/plugins/select2/select2.css">
    <link rel="stylesheet" type="text/css" href="./assets/global/plugins/jquery-multi-select/css/multi-select.css">
    <!-- End picker styles -->
    <style>
        .fc-left {
            left: 250px;
            position: absolute;
        }

        #addConsult .row .last {
            margin-bottom: 17px;
        }

        td {
            -webkit-animation: myfirst 5s; /* Chrome, Safari, Opera */
            animation: myfirst 5s;
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
                        <div class="col-md-12">
                            <label class="control-label col-md-3">Fecha</label>
                            <div class="col-md-9">
                                <label id="lblSelectedDate">asdasd</label>
                            </div>
                        </div>
                        <div class="col-md-12 last">
                            <label class="control-label col-md-3">Paciente</label>
                            <div class="col-md-9">
                                <input type="hidden" id="select2_sample3" class="form-control select2">
                            </div>
                        </div>
                    </div>
                    <div class="clearfix" />

                    <!--<div class="form-body">
                        <div class="form-group">
                            <label class="control-label col-md-3">Fecha</label>
                            <div class="col-md-9">
                                <label id="lblSelectedDate"></label>
                            </div>
                        </div>
                        <div class="form-group last">
                            <label class="control-label col-md-3">Paciente</label>
                            <div class="col-md-9">
                                <input type="hidden" id="select2_sample3" class="form-control select2">
                            </div>
                        </div> 
                    </div> -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn default" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn blue" onclick="doOptionAction()">Aceptar</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <input type="hidden" id="hidSelectedDate" />
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
            calendar.fullCalendar('addEventSource',
            [{
                title: 'Germán',
                start: '2014-11-01'
            }]);
        }

        function makeCallToGetUserNames(query) {
            $.ajax({
                type: "POST",
                url: "/handlers/UserHandler.ashx",
                data: { method: "getusernames", "query": query.term },
                success: function (data) {
                    query.callback(data);
                }, error: function (xhr, status, error) {
                    var err = eval("(" + xhr.responseText + ")");
                    alert(err.Message);
                }
            });
        }

        jQuery(document).ready(function () {

            $("#select2_sample3").select2({
                placeholder: "Seleccionar...",
                formatSearching: function () { return "Buscando..."; },
                formatNoMatches: function () { return "No hay resultados"; },
                formatInputTooShort: function (input, min) { return "Introduzca un caracter o mas para poder iniciar la búsqueda"; },
                allowClear: true,
                minimumInputLength: 1,
                query: function (query) {
                    makeCallToGetUserNames(query);
                }
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
                    $('#hidSelectedDate').val(date.format('YYYY-MM-DD'));
                    $('#lblSelectedDate').html(date.format('DD/MM/YYYY'));
                    //$(this).css('background-color', 'red');
                    $(this).stop().animate({ backgroundColor: '#1BBC9B' }, 300, function () {
                        // Animation complete.
                        $(this).stop().animate({ backgroundColor: 'white' }, 500);
                    });
                    $('#addConsult').modal('show');
                }
            });
        });

    </script>

</asp:Content>
