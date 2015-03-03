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
            ddlState.Items.Add("Pendiente");
            ddlState.Items.Add("Concurrida");
            ddlState.Items.Add("Cancelada");
            ddlState.Items.Add("No asistió");
        }
    }
}