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

    public static void addDBParametersFromConsult(Consult c, SqlCommand comm)
    {
        SqlParameter startDate = new SqlParameter("@startDate", System.Data.SqlDbType.DateTime);
        startDate.Value = c.startDate;
        comm.Parameters.Add(startDate);

        SqlParameter endDate = new SqlParameter("@endDate", System.Data.SqlDbType.DateTime);
        endDate.Value = c.endDate;
        comm.Parameters.Add(endDate);

        SqlParameter price = new SqlParameter("@price", System.Data.SqlDbType.Int);
        price.Value = c.price;
        comm.Parameters.Add(price);

        SqlParameter patient = new SqlParameter("@patientId", System.Data.SqlDbType.Int);
        patient.Value = c.patient;
        comm.Parameters.Add(patient);

        SqlParameter diagnostic = new SqlParameter("@diagnostic", System.Data.SqlDbType.Text);
        diagnostic.Value = c.diagnostic;
        comm.Parameters.Add(diagnostic);

        if (c.treatment != null)
        {
            SqlParameter treatment = new SqlParameter("@treatment", System.Data.SqlDbType.Text);
            treatment.Value = c.treatment;
            comm.Parameters.Add(treatment);
        }

        if (c.propousal != null)
        {
            SqlParameter propousal = new SqlParameter("@propousal", System.Data.SqlDbType.Text);
            propousal.Value = c.propousal;
            comm.Parameters.Add(propousal);
        }

        if (c.clinicalAnalysis != null)
        {
            SqlParameter clinicalAnalysis = new SqlParameter("@clinicalAnalysis", System.Data.SqlDbType.Text);
            clinicalAnalysis.Value = c.clinicalAnalysis;
            comm.Parameters.Add(clinicalAnalysis);
        }

        if (c.rating > 0)
        {
            SqlParameter rating = new SqlParameter("@rating", System.Data.SqlDbType.Int);
            rating.Value = c.rating;
            comm.Parameters.Add(rating);
        }
        if (c.assignedTo != null)
        {
            SqlParameter assignedTo = new SqlParameter("@assignedTo", System.Data.SqlDbType.Int);
            assignedTo.Value = c.assignedTo.id;
            comm.Parameters.Add(assignedTo);
        }


    }
    
}