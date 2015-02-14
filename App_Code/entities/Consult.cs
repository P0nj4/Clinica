using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Consult
/// </summary>
public class Consult
{
    public DateTime startDate { get; set; }
    public DateTime endDate { get; set; }
    public int id { get; set; }
    public int patientId { get; set; }
    public string patientName { get; set; }
    public int doctorId { get; set; }
    public string treatment { get; set; }

	public Consult()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public string convertToJson () {
        return "{\"start\":  \"" + startDate.ToString("yyyy-MM-ddThh:mm:ss") + "\", \"end\":  \"" + this.endDate.ToString("yyyy-MM-ddThh:mm:ss") + "\", \"title\":\"" + this.patientName + "\", \"id\":\""+ this.id +"\"}";
    }
}