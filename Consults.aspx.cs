using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Consults : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        rptConsults.DataSource = BusinessLogic.getAllConsults();
        rptConsults.DataBind();
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