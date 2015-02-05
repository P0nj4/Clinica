<%@ WebHandler Language="C#" Class="UserUpdateHandler" %>

using System;
using System.Web;

public class UserUpdateHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
        System.Threading.Thread.Sleep(2000);
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}