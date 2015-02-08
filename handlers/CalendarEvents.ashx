<%@ WebHandler Language="C#" Class="CalendarEvents" %>

using System;
using System.Web;

public class CalendarEvents : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "application/json";
        context.Response.Write("[{\"start\":  \"2014-11-06\", \"end\":  \"2014-11-08\", \"title\":\"GERMAN\" }, {\"start\":  \"2014-11-01\", \"end\":  \"2014-11-02\", \"title\":\"PEPE\" }]");
        System.Diagnostics.Debug.WriteLine(context.Request["start"] + " " + context.Request["end"]);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}