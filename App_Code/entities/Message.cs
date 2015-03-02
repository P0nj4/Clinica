using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Message
/// </summary>
public class Message
{
    public enum KindOfMessage { error, warning, info, success };
	public Message()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string getMessage (string text, KindOfMessage kind) {
        string css = "";
        switch (kind) {
            case KindOfMessage.error: {
                css = "alert-danger";
                break;
            }
            case KindOfMessage.info:
                {
                    css = "alert-info";
                    break;
                }
            case KindOfMessage.success:
                {
                    css = "alert-success";
                    break;
                }
            case KindOfMessage.warning:
                {
                    css = "alert-warning";
                    break;
                }
            default:
                break;
        }
        return "<div class=\"alert " + css +"\"> <strong>Error!</strong> " + text + ".</div>";
    }

   
}