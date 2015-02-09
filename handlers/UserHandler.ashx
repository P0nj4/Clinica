<%@ WebHandler Language="C#" Class="UserHandler" %>

using System;
using System.Web;

public class UserHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "application/json";
        string result = "";

        switch (context.Request.Params["method"].ToLower())
        {
            case "updateuser":
                result = "{\"error\":false, \"errorMessage\":\"Oups! Ocurrió un error. vuelva a intentarlo en unos minutos o llame al administrador del sistema\"}";
                break;
            case "getusernames":
                result = "{\"error\":false, \"errorMessage\":\"Oups! Ocurrió un error. vuelva a intentarlo en unos minutos o llame al administrador del sistema\"}";
                break;
        }

        context.Response.Write(result);
        System.Threading.Thread.Sleep(2000);
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}