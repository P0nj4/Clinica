<%@ WebHandler Language="C#" Class="CalendarEvents" %>

using System;
using System.Web;
using System.Collections.Generic;

public class CalendarEvents : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "application/json";
        //context.Response.Write("[{\"start\":  \"" + DateTime.Now.ToString("yyyy-MM-ddThh:mm:ss") + "\", \"end\":  \"" + DateTime.Now.AddHours(1).ToString("yyyy-MM-ddThh:mm:ss") + "\", \"title\":\"GERMAN\" }, {\"start\":  \"2014-11-01\", \"end\":  \"2014-11-02\", \"title\":\"PEPE\" }]");
        //System.Diagnostics.Debug.WriteLine(context.Request["start"] + " " + context.Request["end"]);
        List<Consult> allConsults = new List<Consult>();
        
        Consult consult1 = new Consult();
        consult1.startDate = DateTime.Now;
        consult1.endDate = DateTime.Now.AddHours(1);
        consult1.patientName = "Germán Pereyra";
            
        Consult consult2 = new Consult();
        DateTime con2 = DateTime.Now.AddDays(2).AddHours(5);
        consult2.startDate = con2;
        consult2.endDate = con2.AddHours(1);
        consult2.patientName = "Maite Pereyra";

        Consult consult3 = new Consult();
        DateTime con3 = DateTime.Now.AddDays(2).AddHours(2);
        consult3.startDate = con3;
        consult3.endDate = con3.AddHours(1);
        consult3.patientName = "Natalia Costa";

        Consult consult4 = new Consult();
        DateTime con4 = DateTime.Now.AddDays(-2).AddHours(2);
        consult4.startDate = con4;
        consult4.endDate = con4.AddHours(1);
        consult4.patientName = "Jorge Gomez";

        Consult consult5 = new Consult();
        DateTime con5 = DateTime.Now.AddDays(7).AddHours(5);
        consult5.startDate = con5;
        consult5.endDate = con5.AddHours(1);
        consult5.patientName = "Jorge Fernandez";

        allConsults.Add(consult1);
        allConsults.Add(consult2);
        allConsults.Add(consult3);
        allConsults.Add(consult4);
        allConsults.Add(consult5);

        string result = "";
        bool isTheFirstOne = true;
        int idAux = 1;
        foreach (Consult aux in allConsults) {
            aux.id = idAux;
            idAux++;
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