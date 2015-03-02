<%@ WebHandler Language="C#" Class="CalendarEvents" %>

using System;
using System.Web;
using System.Collections.Generic;

public class CalendarEvents : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "application/json";
        //context.Response.Write("[{\"start\":  \"" + DateTime.Now.ToString("yyyy-MM-ddThh:mm:ss") + "\", \"end\":  \"" + DateTime.Now.AddHours(1).ToString("yyyy-MM-ddThh:mm:ss") + "\", \"title\":\"GERMAN\" }, {\"start\":  \"2014-11-01\", \"end\":  \"2014-11-02\", \"title\":\"PEPE\" }]");
        //System.Diagnostics.Debug.WriteLine(context.Request["start"] + " " + context.Request["end"]);
        
        DateTime start = DateTime.ParseExact(context.Request.Params["start"].Trim(), "yyyy-MM-dd",
                                       System.Globalization.CultureInfo.InvariantCulture);
        DateTime end = DateTime.ParseExact(context.Request.Params["end"].Trim(), "yyyy-MM-dd",
                                       System.Globalization.CultureInfo.InvariantCulture);

        List<Consult> allConsults = BusinessLogic.getConsultsBetweenDates(start, end);
            
        string result = "";
        bool isTheFirstOne = true;
        
        foreach (Consult aux in allConsults) {
            if (isTheFirstOne)
            {
                isTheFirstOne = false;
            }
            else {
                result += ",";
            }
            result += aux.convertToJson();
        }
        context.Response.Write("["+ result +"]");
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}