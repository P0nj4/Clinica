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
        DateTime oDate = DateTime.ParseExact(txtDate.Text, "dd/MM/yyyy HH:mm P",System.Globalization.CultureInfo.InvariantCulture);
        p.birthday = oDate;
        p.birthPlace = txtBirhPlace.Text;
        p.description = txtDescription.Text;
        p.email = txtDescription.Text;
        p.lastName = txtLastName.Text;
        p.name = txtName.Text;
        p.phone = txtPhone.Text;
        p.referred = txtRefered.Text;

        BusinessLogic.insertPatient(p);
    }
}