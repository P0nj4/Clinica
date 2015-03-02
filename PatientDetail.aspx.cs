using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PatientDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Params["patientId"] == null)
            {
                litError.Text = Message.getMessage("Lamentablemente, ocurrio un error", Message.KindOfMessage.error);
                btnSubmit.Visible = false;
            }
            else {
                int id = int.Parse(Request.Params["patientId"]);
                this.rptConsults.DataSource = BusinessLogic.getConsultsOfPatient(id);
                this.rptConsults.DataBind();

                Patient p = BusinessLogic.getPatient(id);
                Session["tempPatient"] = p;
                this.txtBirhPlace.Text = p.birthPlace;
                this.txtBirthTime.Text = p.birthday.ToString("HH:mm");
                this.txtDate.Text = p.birthday.ToString("dd/MM/yyyy");
                this.txtDescription.Text = p.description;
                this.txtEmail.Text = p.email;
                this.txtLastName.Text = p.lastName;
                this.txtName.Text = p.name;
                this.txtPhone.Text = p.phone;
                this.txtRefered.Text = p.referred;
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Patient p = null;
        if (Session["tempPatient"] != null)
        {
            p = (Patient)Session["tempPatient"];
        }
        else {
            int id = int.Parse(Request.Params["patientId"]);
            p = BusinessLogic.getPatient(id);
        }

        DateTime MyDateTime = new DateTime();
        MyDateTime = DateTime.ParseExact(txtDate.Text.Trim(), "dd/MM/yyyy",
                                         null);
        if (this.txtBirthTime.Text.Contains(":"))
        {
            Array timeAux = this.txtBirthTime.Text.Split(':');
            MyDateTime = MyDateTime.AddHours(int.Parse(timeAux.GetValue(0).ToString()));
            MyDateTime = MyDateTime.AddMinutes(int.Parse(timeAux.GetValue(1).ToString()));
        }
        p.birthday = MyDateTime;
        p.birthPlace = this.txtBirhPlace.Text;
        p.description = this.txtDescription.Text;
        p.email = this.txtEmail.Text;
        p.lastName = this.txtLastName.Text;
        p.name = this.txtName.Text;
        p.phone = this.txtPhone.Text ;
        p.referred = this.txtRefered.Text;

        BusinessLogic.updatePatient(p);
    }

    protected void rptConsults_OnItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Consult consult = (Consult)e.Item.DataItem;
            Literal litId = (Literal)e.Item.FindControl("litId");
            litId.Text = consult.id.ToString();
            Literal litHour = (Literal)e.Item.FindControl("litHour");
            litHour.Text = consult.startDate.ToString("dd/MM/yyyy HH:mm");
            Literal litName = (Literal)e.Item.FindControl("litName");
            litName.Text = consult.patient.fullName;
            Literal litPhone = (Literal)e.Item.FindControl("litPhone");
            litPhone.Text = consult.patient.phone;
            Literal litAction = (Literal)e.Item.FindControl("litAction");
            litAction.Text = "<a href='ConsultDetail.aspx?consultId=" + consult.patient.id.ToString() + "'>Ver más</a>";
        }
    }
}