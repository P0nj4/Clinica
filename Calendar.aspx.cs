using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Calendar : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmitConsult_Click(object sender, EventArgs e)
    {
        Consult c = new Consult();
        c.startDate = this.getDateFromStrings(this.hidSelectedDate.Value.Trim(), this.timepickerFrom.Value);
        c.endDate = this.getDateFromStrings(this.hidSelectedDate.Value.Trim(), this.timepickerTo.Value);
        if (c.endDate < c.startDate) {
            c.endDate.AddDays(1);
        }
        c.patient = new Patient();
        c.patient.id = int.Parse(this.hidSelectedUserId.Value);
        c.price = double.Parse(this.txtPrice.Text);
        c.diagnostic = this.txtDiagnostic.Text;
        c.assignedTo = this.loggedUser;
        c.scheduler = this.loggedUser;
        BusinessLogic.insertConsult(c);
    }

    private DateTime getDateFromStrings(string strDate, string strTime) {
        DateTime startDate = DateTime.ParseExact(strDate.Trim(), "yyyy-MM-dd",
                                       System.Globalization.CultureInfo.InvariantCulture);

        if (strTime.Contains(":"))
        {
            Array timeAux = strTime.Split(':');
            string strMinutes = "";
            int minutes = 0;
            int hours = 0;
            string strHours;

            if (strTime.Contains("AM"))
            {
                strMinutes = timeAux.GetValue(1).ToString().Replace("AM", "");
                minutes = int.Parse(strMinutes);
                strHours = timeAux.GetValue(0).ToString();
                hours = int.Parse(strHours);

            }
            else
            {
                if (strTime.Contains("PM"))
                {
                    strMinutes = timeAux.GetValue(1).ToString().Replace("PM", "");
                    minutes = int.Parse(strMinutes);
                    strHours = timeAux.GetValue(0).ToString();
                    hours = int.Parse(strHours) + 12;
                }
                else
                {
                    strMinutes = timeAux.GetValue(1).ToString();
                    minutes = int.Parse(strMinutes);
                    strHours = timeAux.GetValue(0).ToString();
                    hours = int.Parse(strHours);
                }
            }

            startDate = startDate.AddHours(hours);
            startDate = startDate.AddMinutes(minutes);
        }
        return startDate;
    }
}