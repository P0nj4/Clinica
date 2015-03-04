using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Expenses : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        List<Expense> list = BusinessLogic.getAllExpensesForMonth(this.loggedUser.clinicId);
        rptExpenses.DataSource = list;
        rptExpenses.DataBind();
    }

    protected void rptExpenses_OnItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Expense ex = (Expense)e.Item.DataItem;
            Literal litName = (Literal)e.Item.FindControl("litName");
            litName.Text = ex.name;
            Literal litDay = (Literal)e.Item.FindControl("litDay");
            litDay.Text = ex.day.ToString("dd/MM/yyyy");
            Literal litAmount = (Literal)e.Item.FindControl("litAmount");
            litAmount.Text = ex.amount.ToString();
        }
    }
}