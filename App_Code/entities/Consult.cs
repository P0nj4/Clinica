using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;


/// <summary>
/// Summary description for Consult
/// </summary>
public class Consult
{
    enum ConsultState { Pending, Confirmed, Canceled, AutoCanceled };

    public DateTime startDate { get; set; }
    public DateTime endDate { get; set; }
    public int id { get; set; }
    public double price { get; set; }
    public User assignedTo { get; set; }
    public string treatment { get; set; }
    public Patient patient { get; set; }
    public string diagnostic { get; set; }
    public string propousal { get; set; }
    public User scheduler { get; set; }
    public string clinicalAnalysis { get; set; }
    public int rating { get; set; }

	public Consult()
	{
	}

    public Consult(SqlDataReader r)
    {
        this.id = (int)r["id"];
        this.startDate = (DateTime)r["startDate"];
        this.endDate = (DateTime)r["endDate"];
        this.price = (double)r["price"];
        this.patient = new Patient(r);
        this.treatment = (string)r["treatment"];
        this.diagnostic = (string)r["diagnostic"];
        this.propousal = (string)r["propousal"];
        this.clinicalAnalysis = (string)r["clinicalAnalysis"];
        this.rating = (int)r["rating"];
        this.assignedTo = new User(r);
    }

    public string convertToJson () {
        return "{\"start\":  \"" + startDate.ToString("yyyy-MM-ddTHH:mm:ss") + "\", \"end\":  \"" + this.endDate.ToString("yyyy-MM-ddTHH:mm:ss") + "\", \"title\":\"" + this.patient.name + "\", \"id\":\"" + this.id + "\"}";
    }
}