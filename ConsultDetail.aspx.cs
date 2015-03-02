using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConsultDetail : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["tempPatient"] = null;
            Session["tempConsult"] = null;

            Consult c = null;
            Patient p = null;
            if (Request.Params["consultId"] != null)
            {
                int id = int.Parse(Request.Params["consultId"]);
                c = BusinessLogic.getConsult(id);
                if (c != null)
                {
                    lblPatientName.Text = c.patient.fullName;
                    txtDate.Text = c.startDate.ToString("dd/MM/yyyy");
                    txtClinicAnalysis.Text = (c.clinicalAnalysis != null ? c.clinicalAnalysis : "");
                    this.txtDiagnostic.Text = (c.diagnostic != null ? c.diagnostic : "");
                    this.txtPropusal.Text = (c.propousal != null ? c.propousal : "");
                    this.txtPrice.Text = c.price.ToString();
                    this.txtTreatment.Text = (c.treatment != null ? c.treatment : "");
                    this.txtStartTime.Text = c.startDate.ToString("HH:mm");
                    this.txtEndTime.Text = c.endDate.ToString("HH:mm");
                    btnSeeMore.Attributes["href"] = "PatientDetail.aspx?patientId=" + c.patient.id;
                    Session["tempConsult"] = c;
                }
            }
            if (Request.Params["patientId"] != null)
            {
                int id = int.Parse(Request.Params["patientId"]);
                p = BusinessLogic.getPatient(id);
                btnSeeMore.Attributes["href"] = "PatientDetail.aspx?patientId=" + id;
                if (p != null)
                {
                    lblPatientName.Text = p.fullName;
                    Session["tempPatient"] = c;
                }
            }
            if (c == null && p == null)
            {
                this.litError.Text = Message.getMessage("Ocurrio un error, por favor vuelva a intentarlo", Message.KindOfMessage.error);
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Session["tempConsult"] == null && Session["tempPatient"] == null && Request.Params["consultId"] == null && Request.Params["patientId"] == null) {
            this.litError.Text = Message.getMessage("Ocurrio un error, refresque la pagina por favor vuelva a intentarlo", Message.KindOfMessage.error);
        }
        else
        {
            Consult c = null;
            if (Session["tempConsult"] != null)
            {
                c = (Consult)Session["tempConsult"];
                this.makeConsult(c);
                BusinessLogic.updateConsult(c);
                this.litError.Text = Message.getMessage("Los cambios se guardaron correctamente", Message.KindOfMessage.success);
            }
            else if (Request.Params["consultId"] != null)
            {
                int id = int.Parse(Request.Params["consultId"]);
                if (id > 0)
                {
                    c = BusinessLogic.getConsult(id);
                    this.makeConsult(c);
                    BusinessLogic.updateConsult(c);
                    this.litError.Text = Message.getMessage("Los cambios se guardaron correctamente", Message.KindOfMessage.success);
                }
            }

            if (c == null)
            {
                Patient p = null;
                if (Session["tempPatient"] != null)
                {
                    p = (Patient)Session["tempPatient"];
                    c = new Consult();
                    c.patient = p;
                    this.makeConsult(c);
                    BusinessLogic.insertConsult(c);
                    this.litError.Text = Message.getMessage("Los cambios se guardaron correctamente", Message.KindOfMessage.success);
                }
                else
                {
                    int id = int.Parse(Request.Params["patientId"]);
                    if (id > 0)
                    {
                        c = new Consult();
                        c.patient = new Patient();
                        c.patient.id = id;
                        this.makeConsult(c);
                        BusinessLogic.insertConsult(c);
                        this.litError.Text = Message.getMessage("Los cambios se guardaron correctamente", Message.KindOfMessage.success);
                    }
                }
            }
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    private Consult makeConsult(Consult c)
    {
        c.startDate = this.getDateFromStrings(this.txtDate.Text.Trim(), this.txtStartTime.Text);
        c.endDate = this.getDateFromStrings(this.txtDate.Text.Trim(), this.txtEndTime.Text);
        if (c.endDate < c.startDate)
        {
            c.endDate.AddDays(1);
        }
        c.price = double.Parse(this.txtPrice.Text);
        c.diagnostic = this.txtDiagnostic.Text;
        c.assignedTo = this.loggedUser;
        c.scheduler = this.loggedUser;
        c.propousal = txtPropusal.Text;
        c.rating = int.Parse(txtRating.Text);
        c.treatment = txtTreatment.Text;
        c.clinicalAnalysis = txtClinicAnalysis.Text;
        
        return c;
    }
    private DateTime getDateFromStrings(string strDate, string strTime)
    {
        strDate = strDate.Replace("/", "-");
        DateTime startDate = DateTime.ParseExact(strDate.Trim(), "dd-MM-yyyy",
                                       System.Globalization.CultureInfo.InvariantCulture);

        if (strTime.Contains(":"))
        {
            Array timeAux = strTime.Split(':');
            string strMinutes = "";
            int minutes = 0;
            int hours = 0;
            string strHours;

            if (strTime.Contains("AM"))
            {
                strMinutes = timeAux.GetValue(1).ToString().Replace("AM", "");
                minutes = int.Parse(strMinutes);
                strHours = timeAux.GetValue(0).ToString();
                hours = int.Parse(strHours);

            }
            else
            {
                if (strTime.Contains("PM"))
                {
                    strMinutes = timeAux.GetValue(1).ToString().Replace("PM", "");
                    minutes = int.Parse(strMinutes);
                    strHours = timeAux.GetValue(0).ToString();
                    hours = int.Parse(strHours) + 12;
                }
                else
                {
                    strMinutes = timeAux.GetValue(1).ToString();
                    minutes = int.Parse(strMinutes);
                    strHours = timeAux.GetValue(0).ToString();
                    hours = int.Parse(strHours);
                }
            }

            startDate = startDate.AddHours(hours);
            startDate = startDate.AddMinutes(minutes);
        }
        return startDate;
    }
}