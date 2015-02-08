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

</asp:Content>

<asp:Content ID="scriptsContent" ContentPlaceHolderID="scripts" runat="server">

    <script src="assets/global/plugins/fullcalendar/lib/moment.min.js"></script>
    <script src="assets/global/plugins/fullcalendar/fullcalendar.js"></script>
    <script type="text/javascript" src="assets/global/plugins/fullcalendar/lang-all.js" ></script>

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

                    alert('Clicked on: ' + date.format());

                    alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

                    alert('Current view: ' + view.name);

                    // change the day's background color just for fun
                    $(this).css('background-color', 'red');

                }
            })


        });

    </script>

</asp:Content>
