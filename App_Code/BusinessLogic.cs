using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Security.Cryptography;
using System.Text;

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
                Patient aux = new Patient(myReader);
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
        try
        {
            myConnection.Open();
            SqlDataReader r = null;
            SqlCommand myCommand = new SqlCommand("select * from Consults c inner join Patients p on (p.id = c.patientId) inner join Users u on (u.id = c.assignedTo) where c.startDate >= '" + DateTime.Now.ToString("yyyy-MM-dd") + "' and c.startDate <= '" + DateTime.Now.AddDays(1).ToString("yyyy-MM-dd") +"'" , myConnection);
            r = myCommand.ExecuteReader();
            while (r.Read())
            {
                Consult c = new Consult(r);
                consults.Add(c);
            }
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
          }
        finally
        {
            myConnection.Close();
        }
        return consults;
    }

    public static User login(string email, string password) {
        User response = null;
        try
        {
            myConnection.Open();
            SqlDataReader r = null;
            SqlCommand myCommand = new SqlCommand("select * from Users", myConnection);

            SqlParameter pEmail = new SqlParameter("@email", System.Data.SqlDbType.NVarChar);
            pEmail.Value = email;

            SqlParameter pPassword = new SqlParameter("@password", System.Data.SqlDbType.NVarChar);
            pPassword.Value = CalculateMD5Hash(password);
            Debug.WriteLine(pPassword.Value);

            myCommand.Parameters.Add(pEmail);
            myCommand.Parameters.Add(pPassword);

            r = myCommand.ExecuteReader();
            if (r.Read())
            {
                response = new User();
                response.id = (int)r["id"];
                response.lastName = r["lastName"].ToString();
                response.name = r["name"].ToString();
                response.clinicId = (int)r["clinicId"];
            }
        }
        catch (Exception ex)
        {
            Debug.WriteLine(ex.ToString());
        }
        finally {
            myConnection.Close();
        }
        return response;
    }

    public static string CalculateMD5Hash(string input)
    {
        // step 1, calculate MD5 hash from input
        MD5 md5 = System.Security.Cryptography.MD5.Create();
        byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
        byte[] hash = md5.ComputeHash(inputBytes);

        // step 2, convert byte array to hex string
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < hash.Length; i++)
        {
            sb.Append(hash[i].ToString("X2"));
        }
        return sb.ToString();
    }

    public static void insertPatient(Patient p) {
        SqlCommand myCommand = new SqlCommand("INSERT INTO Patient (name, lastName, phone, email, description, birthday, birthplace, refered) " +
                                     "Values (@name, @lastName, @phone, @email, @description, @birthDate, @birthPlace, @refered)", myConnection);
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

        SqlParameter pbirthday = new SqlParameter("@birthday", System.Data.SqlDbType.DateTime);
        pbirthday.Value = p.birthday;
        myCommand.Parameters.Add(pbirthday);

        SqlParameter refered = new SqlParameter("@refered", System.Data.SqlDbType.NVarChar);
        refered.Value = p.description;
        myCommand.Parameters.Add(refered);
    }
}