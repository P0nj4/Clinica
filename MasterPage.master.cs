using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string pageName = this.Page.ToString().ToLower();
        pageName = pageName.Split('.')[1];
        pageName = pageName.Split('_')[0];
        //body.Attributes.Add("class", pageName);
        
        litPageTitle.Text = Resources.Resource.ResourceManager.GetString("page_" + pageName);
    }


}
