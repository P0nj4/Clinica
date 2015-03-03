using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConsultModalOptions : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlState.Items.Add(new ListItem("Pendiente", Consult.ConsultState.Pending.ToString()));
            ddlState.Items.Add(new ListItem("Concurrida", Consult.ConsultState.Confirmed.ToString()));
            ddlState.Items.Add(new ListItem("Cancelada", Consult.ConsultState.Canceled.ToString()));
            ddlState.Items.Add(new ListItem("No asistió", Consult.ConsultState.AutoCanceled.ToString()));
        }
    }
}