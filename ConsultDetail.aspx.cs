using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConsultDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            Consult c = null;
            if (Request.Params["consultId"] != null) { 
                int id = int.Parse(Request.Params["consultId"]);
                c = BusinessLogic.getConsult(id);
                if (c != null) {
                    lblPatientName.Text = c.patient.fullName;
                    txtDate.Text = c.startDate.ToString("dd/MM/yyyy");
                    txtClinicAnalysis.Text = (c.clinicalAnalysis != null ? c.clinicalAnalysis : "");
                    this.txtDiagnostic.Text = (c.diagnostic != null ? c.diagnostic : "");
                    this.txtPropusal.Text = (c.propousal != null ? c.propousal : "");
                    this.txtPrice.Text = c.price.ToString();
                    this.txtTreatment.Text = (c.treatment != null ? c.treatment : "");
                    this.txtStartTime.Text = c.startDate.ToString("hh:mm");
                    this.txtEndTime.Text = c.endDate.ToString("hh:mm");
                }
            }
            if (c == null) {
                this.litError.Text = Message.getMessage("Ocurrio un error, por favor vuelva a intentarlo", Message.KindOfMessage.error);
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }
    
}