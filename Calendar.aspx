<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Calendar.aspx.cs" Inherits="Calendar" %>

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
        .fc-time {
            margin-right:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="breadcram" runat="server" ContentPlaceHolderID="Balloons">
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
                            <div class="col-md-6">
                                <input type="hidden" id="select2_sample3" class="form-control select2">
                            </div>
                            <div class="col-md-3">
                                <button type="button" class="btn blue" onclick="goToAddConsult()">Nuevo paciente</button>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix" />

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn default" data-dismiss="modal">Cancelar</button>
                    <button type="button" class="btn blue" onclick="goToAddConsult()">Aceptar</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <input type="hidden" id="hidSelectedDate" />
    <input type="hidden" id="hidSelectedUserId" />
    <input type="hidden" id="hidSelectedUserName" />
</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="scripts" runat="server">

    <script src="assets/global/plugins/fullcalendar/lib/moment.min.js"></script>
    <script src="assets/global/plugins/fullcalendar/fullcalendar.js"></script>
    <script type="text/javascript" src="assets/global/plugins/fullcalendar/lang-all.js"></script>
    <script type="text/javascript" src="./assets/global/plugins/bootstrap-select/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="./assets/global/plugins/select2/select2.min.js"></script>
    <script type="text/javascript" src="./assets/global/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>

    <script type="text/javascript">

        var addConsultAvailable = true; // (gup('addConsultAvailable') == '1');

        //Obtiene los nombres de los pacientes para mostrarlos en un dropdown para el ingreso de una nueva consulta
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

        //redirecciona a la página de agregar consulta
        function goToAddConsult() {
            if (addConsultAvailable) { 
                 if ($('#hidSelectedDate').val().length == 0) {
                     alert('Seleccione una fecha para agendar la consulta');
                     return false;
                 }
                 if ($('#hidSelectedUserId').val().length == 0) {
                     alert('Seleccione un paciente para agendarle una consulta');
                     return false;
                 }
                 window.location = '/AddEditConsult.aspx?selectedDate=' + $('#hidSelectedDate').val() + '&userId=' + $('#hidSelectedUserId').val() + '&userName=' + ($('#hidSelectedUserName').val());
            }
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

            $('#select2_sample3').on("change", function (e) {
                $('#hidSelectedUserId').val(e.val);
                $('#hidSelectedUserName').val(e.added.text);
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
                    if (addConsultAvailable) {
                        $('#hidSelectedDate').val(date.format('YYYY-MM-DD'));
                        $('#lblSelectedDate').html(date.format('DD/MM/YYYY'));
                        //$(this).css('background-color', 'red');
                        $(this).stop().animate({ backgroundColor: '#1BBC9B' }, 300, function () {
                            // Animation complete.
                            $(this).stop().animate({ backgroundColor: 'white' }, 500);
                        });
                        $('#addConsult').modal('show');
                    }
                },
                eventClick: function (calEvent, jsEvent, view) {
                    alert('Event: ' + calEvent.title + calEvent._id);
                }
            });
        });

    </script>

</asp:Content>
