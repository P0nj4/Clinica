<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddEditConsult.aspx.cs" Inherits="AddEditConsult" MasterPageFile="~/MasterPage.master" %>

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

<asp:Content ID="content" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div id="calendar" class="has-toolbar">
    </div>
</asp:Content>


<asp:Content ID="scriptsContent" ContentPlaceHolderID="scripts" runat="server">

    <script src="assets/global/plugins/fullcalendar/lib/moment.min.js"></script>
    <script src="assets/global/plugins/fullcalendar/fullcalendar.js"></script>
    <script type="text/javascript" src="assets/global/plugins/fullcalendar/lang-all.js"></script>

    <script type="text/javascript">

        function addEvent() {
            var calendar = $('#calendar');
            calendar.fullCalendar('addEventSource', [
                     {
                         title: 'Germán',
                         start: '2014-11-01'
                     }]);
        }
        var dateEventAdded = false;
        jQuery(document).ready(function () {

            var calendar = $('#calendar').fullCalendar({
                lang: 'es',
                defaultDate: $.fullCalendar.moment(gup('selectedDate')),
                editable: true,
                droppable: false, // this allows things to be dropped onto the calendar
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
                    d2 = new Date(date);
                    d2.setHours(d2.getHours() + 3);
                    var dateString = d2.format("yyyy-mm-dd\'T\'HH:MM:ss");
                    if (dateEventAdded) {
                        //calendar.fullCalendar('removeEvents'["9999"]);
                        calendar.fullCalendar('removeEvents', "9999");
                    }
                    dateEventAdded = true;
                    var evt = calendar.fullCalendar('renderEvent',{
                          id: 9999,
                          title: decodeURI(gup('userName')),
                          start: date.format(),
                          end: dateString
                      },
                      true);
                    //alert(evt[0]._id);
                },
                defaultView: 'agendaDay'
            });
        });

    </script>

</asp:Content>

