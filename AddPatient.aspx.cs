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

        BusinessLogic.insertPatient(p, this.loggedUser.clinicId);

        Response.Redirect("Patients.aspx");
    }
}