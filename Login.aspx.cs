using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmitLogin_Click(object sender, EventArgs e)
    {
        User u = BusinessLogic.login(txtEmail.Value, txtPassword.Value);
        if (u != null)
        {
            this.loggedUser = u;
            Response.Redirect("Default.aspx");
        }
        else {
            Response.Redirect("Login.aspx?error=1");
        }
    }
}