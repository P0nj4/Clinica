using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SideBar : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string pageName = this.Page.ToString().ToLower();
        pageName = pageName.Split('.')[1];
        pageName = pageName.Split('_')[0];

        switch (pageName) { 
            case "default":
                liDashboard.Attributes["class"] = "start active open";
                break;
            case "addpatient":
                liPatients.Attributes["class"] = "active open";
                break;
            case "patients":
                liPatients.Attributes["class"] = "active open";
                break;
        }
    }
}