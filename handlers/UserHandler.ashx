<%@ WebHandler Language="C#" Class="UserHandler" %>

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
                string[] names = new string[] {"Gonzalo Gahan","Zackary Zygmont","Gerri Gibbon","Joana Jeanpierre","Ana Aguinaldo","Lorenzo Leider","Luz Lust","Wava Winningham","Latosha Lakin","Doug Demmer","Sallie Siddiqui","Asia Alegria","Torrie Tsang","Augustina Arispe","Sheree Searles","Ezra Earhart","Erma Epling","Julissa Judah","Sandra Stelter","Keri Kingsland","Dominque Derouin","Shakira Segalla","Bennett Barbaro","Donnette Devane","Emerson Ertle","Freddie Ferra","Zandra Zamor","Randa Repass","Augustus Alcock","Sharla Solis","Quiana Qualls","Rhea Riddles","Yukiko Yoo","Hannelore Heaton","Lala Labelle","Margarette Mclellan","Dallas Dimattia","Leana Larrison","Janiece Joubert","Magali Marquart","Marjory Mixon","Farah Farrelly","Galina Greenburg","Elvera Everett","Elroy Esterline","Demetrice Dressler","Lashandra Lent","Ling Leavell","Micheline Morace","Rudy Riccio"};
                //{"results":[{"id":"h1","text":"h"},{"id":"h2","text":"hh"},{"id":"h3","text":"hhh"},{"id":"h4","text":"hhhh"}]}
                List<String> matches = new List<string>();
                foreach (string name in names) {
                    if (name.ToLower().Contains(query)) {
                        matches.Add(name);
                    }
                }
                
                result = "{\"results\":[";
                bool isTheFirst = true;
                int i = 1;
                foreach (string match in matches) {
                    if (!isTheFirst) {
                        result += ",";
                    }
                    isTheFirst = false;
                    result += "{\"id\":\"" + i + "\",\"text\":\"" + match +"\"}";
                    i++;
                }
                result += "]}";
                break;
        }

        context.Response.Write(result);
        System.Threading.Thread.Sleep(1000);
    }
    
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }


}