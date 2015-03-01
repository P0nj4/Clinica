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
        
        DateTime startDate = DateTime.ParseExact(this.hidSelectedDate.Value.Trim(), "yyyy-MM-dd",
                                       System.Globalization.CultureInfo.InvariantCulture);

        if (this.timepickerFrom.Value.Contains(":"))
        {
            Array timeAux = this.timepickerFrom.Value.Split(':');
            string strMinutes = "";
            int minutes = 0;
            int hours = 0;
            string strHours;

            if (this.timepickerFrom.Value.Contains("AM"))
            {
                strMinutes = timeAux.GetValue(1).ToString().Replace("AM", "");
                minutes = int.Parse(strMinutes);
                strHours = timeAux.GetValue(0).ToString();
                hours = int.Parse(strHours);

            }
            else {
                if (this.timepickerFrom.Value.Contains("PM"))
                {
                    strMinutes = timeAux.GetValue(1).ToString().Replace("PM", "");
                    minutes = int.Parse(strMinutes);
                    strHours = timeAux.GetValue(0).ToString();
                    hours = int.Parse(strHours) + 12;
                }
                else {
                    strMinutes = timeAux.GetValue(1).ToString();
                    minutes = int.Parse(strMinutes);
                    strHours = timeAux.GetValue(0).ToString();
                    hours = int.Parse(strHours);
                }
            }
            
            startDate = startDate.AddHours(hours);
            startDate = startDate.AddMinutes(minutes);
        }
    }
}