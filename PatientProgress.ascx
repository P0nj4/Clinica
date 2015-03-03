<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PatientProgress.ascx.cs" Inherits="PatientProgress" %>
<script src="assets/Chart.js"></script>

<div style="width:40%">
			<div>
				<canvas id="canvas" height="450" width="600"></canvas>
			</div>
		</div>
<asp:Literal ID="litData" runat="server" />
<script>
    /*
    var lineChartData = {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [
            {
                label: "My First dataset",
                fillColor: "rgba(220,220,220,0.2)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: [10, 20, 40, 20, 10, 100, 0]
            }
        ]

    }
    */

    window.onload = function () {
        var ctx = document.getElementById("canvas").getContext("2d");
        window.myLine = new Chart(ctx).Line(lineChartData, {
            responsive: true
        });
    }


	</script>