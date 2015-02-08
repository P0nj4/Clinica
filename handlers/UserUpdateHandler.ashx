<%@ WebHandler Language="C#" Class="UserUpdateHandler" %>

using System;
using System.Web;

public class UserUpdateHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "application/json";
        string result = "{\"error\":false, \"errorMessage\":\"Oups! Ocurrió un error. vuelva a intentarlo en unos minutos o llame al administrador del sistema\"}";

        context.Response.Write(result);
        System.Threading.Thread.Sleep(2000);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}