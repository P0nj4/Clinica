using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for BusinessLogic
/// </summary>
public class BusinessLogic
{
    private static SqlConnection _myConnection;
    private static List<Patient> patients;
    private static DateTime lastPatientsUpdate;

    private static SqlConnection myConnection
    {
        //set the person name
        set { _myConnection = value; }
        //get the person name 
        get
        {
            if (_myConnection == null)
                _myConnection = new SqlConnection("Data Source=SQL5014.Smarterasp.net;Initial Catalog=DB_9BBA1B_Clinic;User Id=DB_9BBA1B_Clinic_admin;Password=polv0r1t4;");
            return _myConnection;
        }
    }

    public static List<Patient> getAllPatients()
    {
        TimeSpan span = (DateTime.Now - lastPatientsUpdate);
        bool needsUpdate = (patients == null || span.Minutes > 3);
        if (!needsUpdate)
            return patients;
        try
        {
            patients = new List<Patient>();
            myConnection.Open();
            SqlDataReader myReader = null;
            SqlCommand myCommand = new SqlCommand("select * from Patients", myConnection);
            myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                Patient aux = new Patient(myReader["name"].ToString(), myReader["lastName"].ToString(), myReader["email"].ToString(), myReader["phone"].ToString(), myReader["description"].ToString(), (DateTime)myReader["birthDate"], myReader["birthPlace"].ToString(), myReader["referred"].ToString());
                aux.id = (int)myReader["id"];
                patients.Add(aux);
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        finally {
            myConnection.Close();
        }
        return patients;
    }

    public static List<User> dummyGetAllUsers()
    {
        List<User> users = new List<User>();
        User aux = new User();
        aux.name = "Mirian";
        aux.lastName = "Rodríguez";
        aux.id = 1;
        users.Add(aux);
        return users;
    }

    public static List<Consult> getTodayConsults() {
        List<Consult> consults = new List<Consult>();
        List<Patient> patients = BusinessLogic.getAllPatients();
        User user = dummyGetAllUsers()[0];
        for (int i = 0; i < 10; i++) {
            Consult aux = new Consult();
            aux.patient = patients[i];
            aux.price = 2500;
            aux.id = i;
            aux.assignedTo = user;
            aux.startDate = DateTime.Now.AddHours(i);
            aux.startDate = DateTime.Now.AddHours(i+1);
            consults.Add(aux);
        }
        return consults;
    }
    public BusinessLogic()
    {

    }
}