<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Calendar.aspx.cs" Inherits="Calendar" %>
<asp:Content ID="headContent" ContentPlaceHolderID="head" runat="server">
    <link href="assets/global/plugins/fullcalendar/fullcalendar.min.css" rel='stylesheet' />
    <link href="assets/global/plugins/fullcalendar/fullcalendar.print.css" rel='stylesheet' media='print' />

<link href="./assets/global/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet"/>
    
</asp:Content>
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
												<input type="text" value="" class="form-control" placeholder="Event Title..." id="event_title"/><br/>
												<a href="javascript:;" id="event_add" class="btn default">
												Add Event </a>
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
    
<script src="assets/global/plugins/fullcalendar/lib/moment.min.js"></script>
<script src="assets/global/plugins/fullcalendar/fullcalendar.js"></script>
    <script type="text/javascript">

        function addEvent() {

            var calendar = $('#calendar');
           calendar.fullCalendar('addEventSource', [
                    {
                        title: 'Germán',
                        start: '2014-11-01'
                    }]);
            return false;


        }

        jQuery(document).ready(function () {
            
            $('#event_add').click(addEvent);

            $('#external-events #event_box .fc-event').each(function () {
                // store data so the calendar knows to render an event upon drop
                $(this).data('event', {
                    title: $.trim($(this).text()), // use the element's text as the event title
                    stick: true // maintain when user navigates (see docs on the renderEvent method)
                });

                // make the event draggable using jQuery UI
                $(this).draggable({
                    zIndex: 999,
                    revert: true,      // will cause the event to go back to its
                    revertDuration: 0  //  original position after the drag
                });

            });

            // initiate layout and plugins
            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                defaultDate: '2014-11-12',
                editable: true,
                droppable: false, // this allows things to be dropped onto the calendar
                drop: function() {
                    // is the "remove after drop" checkbox checked?
                    //if ($('#drop-remove').is(':checked')) {
                        // if so, remove the element from the "Draggable Events" list
                        $(this).remove();
                    //}
                },
                eventSources: {
                    url: '/handlers/CalendarEvents.ashx',
                    error: function(data) {
                        if (data) {
                            alert('error ' + data);
                        } else {
                            alert('error');
                        }
                    },
                    success: function (replyObject) {
                        return replyObject;
                    }
                }
            })
        });

    </script>

</asp:Content>