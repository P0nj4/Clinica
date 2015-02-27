﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Doctor
/// </summary>
public class User
{
    public int id { get; set; }
    public string email { get; set; }
    public string name { get; set; }
    public string lastName { get; set; }

    public string fullName { 
        get {
            return this.name + " " + this.lastName;
        } 
    }
    public int clinicId { get; set; }
    public User() { }
	
    public User(SqlDataReader r)
	{
        if (Utilities.HasColumn(r, "patientId"))
        {
            this.id = (int)r["patientId"];
        }
        else {
            this.id = (int)r["id"];
        }
        this.name = (string)r["name"];
        this.lastName = (string)r["lastName"];
        this.email = (string)r["email"];
        this.clinicId = (int)r["clinicId"];
	    
    }
}