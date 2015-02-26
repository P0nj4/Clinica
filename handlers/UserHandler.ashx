﻿<%@ WebHandler Language="C#" Class="UserHandler" %>

using System;
using System.Web;
using System.Collections.Generic;

public class UserHandler : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "application/json";
        string result = "";
        if (context.Request.Params["method"] == null) {
            result = "{\"error\":false, \"errorMessage\":\"Oups! Ocurrió un error. vuelva a intentarlo en unos minutos o llame al administrador del sistema\"}";
            context.Response.Write(result);
            return;
        }

        switch (context.Request.Params["method"].ToLower())
        {
            case "updateuser":
                result = "{\"error\":false, \"errorMessage\":\"Oups! Ocurrió un error. vuelva a intentarlo en unos minutos o llame al administrador del sistema\"}";
                break;
            case "getusernames":
                string query = context.Request.Params["query"].ToLower();
                
                List<Patient> matches = new List<Patient>();
                List<Patient> patients = BusinessLogic.getAllPatients();
                foreach (Patient pAux in patients)
                {
                    if (pAux.name.ToLower().Contains(query)) {
                        matches.Add(pAux);
                    }
                }
                
                result = "{\"results\":[";
                bool isTheFirst = true;
                int i = 1;
                foreach (Patient match in matches) {
                    if (!isTheFirst) {
                        result += ",";
                    }
                    isTheFirst = false;
                    result += "{\"id\":\"" + match.id + "\",\"text\":\"" + match.name + " " + match.lastName + "\"}";
                    i++;
                }
                result += "]}";
                break;
        }
        context.Response.Write(result);
    }
    
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }


}