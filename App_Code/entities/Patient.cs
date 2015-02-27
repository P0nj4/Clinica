using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Patient
/// </summary>
public class Patient
{
    public int id { get; set; }
    public string name { get; set; }
    public string lastName { get; set; }
    public string email { get; set; }
    public string phone { get; set; }
    public string description { get; set; }
    public DateTime birthday { get; set; }
    public string birthPlace { get; set; }
    public double lastPrice { get; set; }
    public string referred { get; set; }
    public DateTime lastConsult { get; set; }
    public string fullName
    {
        get
        {
            return this.name + " " + this.lastName;
        }
    }

	public Patient(string name, string lastName, string email, string phone, string description, DateTime birhday, string birthPlace, string referred) {
        this.name = name;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.description = description;
        this.birthday = birhday;
        this.birthPlace = birthPlace;
        this.referred = referred;
	}

    public Patient(SqlDataReader myReader)
    {
        this.name = myReader["name"].ToString();
        this.lastName = myReader["lastName"].ToString();
        this.email = myReader["email"].ToString(); this.phone = myReader["phone"].ToString();
        this.description = myReader["description"].ToString();
        this.birthday = (DateTime)myReader["birthDate"];
        this.birthPlace = myReader["birthPlace"].ToString();
        this.referred = myReader["referred"].ToString();
        if (myReader["patientId"] != DBNull.Value)
        {
            this.id = (int)myReader["patientId"];
        }
        else
        {
            this.id = (int)myReader["id"];
        }

        if (myReader["lastConsultDate"] != DBNull.Value)
        {
            this.lastConsult = (DateTime)myReader["lastConsultDate"];
        }
    }
    public Patient() { 
    
    }
}