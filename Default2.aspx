<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link type="text/css" href="assets/global/plugins/bootstrap/css/bootstrap.min.css" />
        <link type="text/css" href="assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.css" />
        <script type="text/javascript" src="assets/global/plugins/jquery.min.js"></script>
        <script type="text/javascript" src="assets/global/plugins/bootstrap/js/bootstrap.js"></script>
        <script type="text/javascript" src="assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
    </head>
    <body>
        <div class="input-append bootstrap-timepicker">
            <input id="timepicker1" type="text" class="input-small">
            <span class="add-on"><i class="icon-time"></i></span>
        </div>
 
        <script type="text/javascript">
            $('#timepicker1').timepicker();
        </script>
    </body>
</html>