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

    protected void SaveChanges(object sender, EventArgs e) {
        Consult c = BusinessLogic.getConsult(int.Parse(this.selectedConsultId.Value));
        if (c != null) {
            c.propousal = txtPropusal.Text;
            c.treatment = txtTreatment.Text;
            c.state = (Consult.ConsultState)Enum.Parse(typeof(Consult.ConsultState), ddlState.SelectedValue);
            if (c.state == Consult.ConsultState.Confirmed)
            {
                c.rating = int.Parse(txtRating.Text);
            }
            else {
                c.rating = 1;
            }
            c.clinicalAnalysis = txtClinicAnalysis.Text;
            BusinessLogic.updateConsult(c);
            Response.Redirect(Request.RawUrl);
        }
    }
     
}