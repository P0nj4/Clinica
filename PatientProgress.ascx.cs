using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PatientProgress : System.Web.UI.UserControl
{
    public List<Consult> allConsults;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        //Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "MyFunction("")", true);
        string labels = "";
        string data = "";
        bool isTheFist = true;
        foreach (Consult c in allConsults) {
            if (c.state == Consult.ConsultState.Confirmed) { 
                if (isTheFist) {
                    isTheFist = false;
                    labels += "\"" + c.startDate.ToString("dd/MM/yyyy")  + "\"" ;
                    data += c.rating.ToString();
                } else {
                    labels += ", " + "\"" + c.startDate.ToString("dd/MM/yyyy") + "\"";
                    data += ", " + c.rating.ToString();
                }
                
            }
        }
        litData.Text = "<script>" +
       "var lineChartData = {" +
        "labels: ["+ labels +"], " +
        "datasets: [ " +
            "{ " +
                "label: \"My First dataset\" ," +
                "fillColor: \"rgba(220,220,220,0.2)\"," +
                "strokeColor: \"rgba(220,220,220,1)\"," +
                "pointColor: \"rgba(220,220,220,1)\"," +
                "pointStrokeColor: \"#fff\"," +
                "pointHighlightFill: \"#fff\"," +
                "pointHighlightStroke: \"rgba(220,220,220,1)\"," +
                "data: ["+data+"]" +
            "}" +
        "] " +

    "} </script>";
    }
}