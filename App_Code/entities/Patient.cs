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
        if (Utilities.HasColumn(myReader, "patientId"))
        {
            this.name = myReader["name"].ToString();
            this.lastName = myReader["lastName"].ToString();
            this.email = myReader["email"].ToString(); this.phone = myReader["phone"].ToString();
            this.description = myReader["description"].ToString();
            this.birthday = (DateTime)myReader["birthDate"];
            this.birthPlace = myReader["birthPlace"].ToString();
            this.referred = myReader["referred"].ToString();

            this.id = (int)myReader["patientId"];
            if (myReader["lastConsultDate"] != DBNull.Value)
            {
                this.lastConsult = (DateTime)myReader["lastConsultDate"];
            }
        }
    }
    public Patient() { 
    
    }

    public static void addDBParametersFromPatient(Patient p, SqlCommand myCommand) {
        SqlParameter pName = new SqlParameter("@name", System.Data.SqlDbType.NVarChar);
        pName.Value = p.name;
        myCommand.Parameters.Add(pName);

        SqlParameter pLastName = new SqlParameter("@lastName", System.Data.SqlDbType.NVarChar);
        pLastName.Value = p.lastName;
        myCommand.Parameters.Add(pLastName);

        SqlParameter pPhone = new SqlParameter("@phone", System.Data.SqlDbType.NVarChar);
        pPhone.Value = p.phone;
        myCommand.Parameters.Add(pPhone);

        SqlParameter pEmail = new SqlParameter("@email", System.Data.SqlDbType.NVarChar);
        pEmail.Value = p.email;
        myCommand.Parameters.Add(pEmail);

        SqlParameter pdescription = new SqlParameter("@description", System.Data.SqlDbType.NVarChar);
        pdescription.Value = p.description;
        myCommand.Parameters.Add(pdescription);

        SqlParameter birthplace = new SqlParameter("@birthplace", System.Data.SqlDbType.NVarChar);
        birthplace.Value = p.birthPlace;
        myCommand.Parameters.Add(birthplace);

        SqlParameter pbirthday = new SqlParameter("@birthDate", System.Data.SqlDbType.DateTime);
        pbirthday.Value = p.birthday;
        myCommand.Parameters.Add(pbirthday);

        SqlParameter refered = new SqlParameter("@referred", System.Data.SqlDbType.NVarChar);
        refered.Value = p.referred;
        myCommand.Parameters.Add(refered);
    }
}