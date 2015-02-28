using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddPatient : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Request.Params["userId"] != null)
        {
            if (!this.IsPostBack)
            {
                int userId = int.Parse(this.Request.Params["userId"]);
                if (userId > 0)
                {
                    Patient pat = BusinessLogic.getPatient(userId);
                    this.txtBirhPlace.Text = pat.birthPlace;
                    this.txtBirthTime.Text = pat.birthday.ToString("hh:mm");
                    this.txtDate.Text = pat.birthday.ToString("dd/MM/yyyy");
                    this.txtDescription.Text = pat.description;
                    this.txtEmail.Text = pat.email;
                    this.txtLastName.Text = pat.lastName;
                    this.txtName.Text = pat.name;
                    this.txtPhone.Text = pat.phone;
                    this.txtRefered.Text = pat.referred;
                }
            }
        }
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Patient p = new Patient();
        //DateTime oDate = DateTime.ParseExact(txtDate.Text, "dd/MM/yyyy hh:mm",System.Globalization.CultureInfo.InvariantCulture);

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
        p.birthPlace = txtBirhPlace.Text;
        p.description = txtDescription.Text;
        p.email = txtEmail.Text;
        p.lastName = txtLastName.Text;
        p.name = txtName.Text;
        p.phone = txtPhone.Text;
        p.referred = txtRefered.Text;
        if (this.Request.Params["userId"] != null)
        {
            int userId = int.Parse(this.Request.Params["userId"]);
            if (userId > 0)
            {
                p.id = userId;
                BusinessLogic.updatePatient(p);
            }
            else
            {
                BusinessLogic.insertPatient(p, this.loggedUser.clinicId);
            }
        }
        else
        {
            BusinessLogic.insertPatient(p, this.loggedUser.clinicId);
        }

        Response.Redirect("Patients.aspx");
    }
}