using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Patients : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        rptPatients.DataSource = BusinessLogic.getAllPatients();
        rptPatients.DataBind();
    }

    protected void rptPatients_OnItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Patient patient = (Patient)e.Item.DataItem;
            Literal litId = (Literal)e.Item.FindControl("litId");
            litId.Text = patient.id.ToString();
            Literal litName = (Literal)e.Item.FindControl("litName");
            litName.Text = patient.name + " " + patient.lastName;
            Literal litAge = (Literal)e.Item.FindControl("litAge");
            DateTime today = DateTime.Today;
            int age = today.Year - patient.birthday.Year;
            if (patient.birthday > today.AddYears(-age)) age--;
            litAge.Text = age.ToString();

            Literal litPhone = (Literal)e.Item.FindControl("litPhone");
            litPhone.Text = patient.phone;
            Literal litLastConsult = (Literal)e.Item.FindControl("litLastConsult");
            litLastConsult.Text = (patient.lastConsult != null ? patient.lastConsult.ToString("dd/MM/yyyy") : "Nunca");
            Literal litButtonOptions = (Literal)e.Item.FindControl("litButtonOptions");
            litButtonOptions.Text = "<a class=\"btn btn-sm blue options\" data-toggle=\"modal\" href=\"#opciones\" userId=" + patient.id + " >Opciones</a>";

        }
    }
}