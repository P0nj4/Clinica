using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BasePage
/// </summary>
public class BasePage : System.Web.UI.Page
{
    public User loggedUser { 
        get {
            return (User)this.Session["loggedUser"];
        }
        set {
            this.Session["loggedUser"] = value;
        }
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        if (loggedUser == null && this.Page.ToString().ToLower() != "asp.login_aspx")
        {
            Response.Redirect("Login.aspx");
        }
    }
	public BasePage()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}