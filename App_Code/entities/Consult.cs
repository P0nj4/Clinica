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
    public enum ConsultState { Pending = 1, Confirmed = 2, Canceled = 3, AutoCanceled = 4 };

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
    public ConsultState state { get; set; }

	public Consult()
	{
	}

    private enum DateComparisonResult
    {
        Earlier = -1,
        Later = 1,
        TheSame = 0
    };

    public Consult(SqlDataReader r)
    {
        if (Utilities.HasColumn(r, "consultId"))
        {
            this.id = (int)r["consultId"];
            this.startDate = (DateTime)r["startDate"];
            this.endDate = (DateTime)r["endDate"];
            this.price = (double)r["price"];
            this.patient = new Patient(r);
            if (r["treatment"] != DBNull.Value)
                this.treatment = (string)r["treatment"];
            if (r["diagnostic"] != DBNull.Value)
                this.diagnostic = (string)r["diagnostic"];
            if (r["propousal"] != DBNull.Value)
                this.propousal = (string)r["propousal"];
            if (r["clinicalAnalysis"] != DBNull.Value)
                this.clinicalAnalysis = (string)r["clinicalAnalysis"];
            if (r["rating"] != DBNull.Value)
                this.rating = (int)r["rating"];
            this.assignedTo = new User(r);

            int state = (int)r["state"];
            this.loadStateFromInt(state);
        }
    }

    public string getStateString() {
        switch (this.state) { 
            case ConsultState.AutoCanceled:
                return "No asistió";
            case ConsultState.Canceled:
                return "Cancelada";
            case ConsultState.Confirmed:
                return "Concurrida";
            case ConsultState.Pending:
                return "Pendiente";
            default:
                return "";

        }
    }

    public void loadStateFromInt(int state) {
        switch (state) {
                case 1:
                    DateComparisonResult compare = (DateComparisonResult)this.endDate.CompareTo(DateTime.Now.AddDays(-1));
                    if (compare == DateComparisonResult.Earlier)
                    {
                        this.state = ConsultState.AutoCanceled;
                    }
                    else {
                        this.state = ConsultState.Pending;
                    }
                    break;
                case 2:
                    this.state = ConsultState.Confirmed;
                    break;
                case 3:
                    this.state = ConsultState.Canceled;
                    break;
                default:
                    this.state = ConsultState.Pending;
                    break;
            }
    }

    public string convertToCalendarJson () {
        return "{\"start\":  \"" + startDate.ToString("yyyy-MM-ddTHH:mm:ss") + "\", \"end\":  \"" + this.endDate.ToString("yyyy-MM-ddTHH:mm:ss") + "\", \"title\":\"" + this.patient.name + "\", \"id\":\"" + this.id + "\", \"color\":\"" + getColorNameByState() + "\"}";
    }

    public string convertToObjectJson()
    {
        return "{\"startDate\":  \"" + startDate.ToString("dd/MM/yyyy HH:mm") + "\", \"endDate\":  \"" + this.endDate.ToString("dd/MM/yyyy HH:mm") + "\", \"id\":\"" + this.id + "\", \"price\":\""+ this.price +"\", \"state\":\"" + this.state.ToString() + "\"}";
    }
    public string convertToObjectDetailsJson()
    {
        return "{\"state\":\"" + this.state.ToString() + "\", \"diagnostic\":\""+diagnostic+"\", \"clinicalAnalysis\":\""+clinicalAnalysis+"\", \"treatment\":\""+treatment+"\", \"propousal\":\""+propousal+"\", \"rating\":\""+rating+"\"}";
    }

    private string getColorNameByState() {
        switch (this.state)
        {
            case ConsultState.AutoCanceled:
                return "red";
            case ConsultState.Canceled:
                return "pink";
            case ConsultState.Confirmed:
                return "green";
            case ConsultState.Pending:
                return "#000000";
            default:
                return "";

        }
    }

    public static void addDBParametersFromConsult(Consult c, SqlCommand comm)
    {
        SqlParameter state = new SqlParameter("@state", System.Data.SqlDbType.Int);
        state.Value = c.state.GetHashCode();
        comm.Parameters.Add(state);

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
        patient.Value = c.patient.id;
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
        if (c.scheduler != null)
        {
            SqlParameter scheduler = new SqlParameter("@scheduler", System.Data.SqlDbType.Int);
            scheduler.Value = c.scheduler.id;
            comm.Parameters.Add(scheduler);
        }
        


    }
    
}