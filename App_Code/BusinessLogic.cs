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


    #region Patients
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

    public static Patient getPatient(int id)
    {
        Patient result = null;
        try
        {
            myConnection.Open();
            SqlDataReader myReader = null;
            SqlCommand myCommand = new SqlCommand("select * from Patients where patientId = @id", myConnection);
            SqlParameter param = new SqlParameter("@id", System.Data.SqlDbType.Int);
            param.Value = id;
            myCommand.Parameters.Add(param);

            myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                result = new Patient(myReader);
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
        return result;
    }

    public static void updatePatient(Patient p)
    {
        SqlCommand myCommand = new SqlCommand("Update Patients set name = @name, lastName = @lastName, phone = @phone, email = @email, description = @description, birthDate = @birthDate, birthPlace = @birthPlace, referred = @referred Where id = @id" , myConnection);

        Patient.addDBParametersFromPatient(p, myCommand);

        SqlParameter pid = new SqlParameter("@id", System.Data.SqlDbType.NVarChar);
        pid.Value = p.id;
        myCommand.Parameters.Add(pid);

        try
        {
            myConnection.Open();
            int i = myCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            myConnection.Close();
        }
    }

    public static void insertPatient(Patient p, int clinicId)
    {
        SqlCommand myCommand = new SqlCommand("INSERT INTO Patients (name, lastName, phone, email, description, birthDate, birthPlace, referred, clinicId) " +
                                     "Values (@name, @lastName, @phone, @email, @description, @birthDate, @birthPlace, @referred, @clinicId)", myConnection);

        Patient.addDBParametersFromPatient(p, myCommand);

        SqlParameter pclinicId = new SqlParameter("@clinicId", System.Data.SqlDbType.NVarChar);
        pclinicId.Value = clinicId;
        myCommand.Parameters.Add(pclinicId);

        try
        {
            myConnection.Open();
            myCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            myConnection.Close();
        }
    }

    #endregion

    #region Consult
    public static List<Consult> getTodayConsults() {
        List<Consult> consults = new List<Consult>();
        try
        {
            myConnection.Open();
            SqlDataReader r = null;
            SqlCommand myCommand = new SqlCommand("select * from Consults c inner join Patients p on (p.patientId = c.patientId) inner join Users u on (u.userId = c.assignedTo) where c.startDate >= '" + DateTime.Now.ToString("yyyy-MM-dd") + "' and c.startDate <= '" + DateTime.Now.AddDays(1).ToString("yyyy-MM-dd") +"'" , myConnection);
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

    public static List<Consult> getConsultsBetweenDates(DateTime start, DateTime end)
    {
        List<Consult> consults = new List<Consult>();
        try
        {
            myConnection.Open();
            SqlDataReader r = null;
            SqlCommand myCommand = new SqlCommand("select * from Consults c inner join Patients p on (p.patientId = c.patientId) inner join Users u on (u.userId = c.assignedTo) where c.startDate >= '" + start.ToString("yyyy-MM-dd") + "' and c.startDate <= '" + end.AddDays(1).ToString("yyyy-MM-dd") + "'", myConnection);
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

    public static List<Consult> getConsultsOfPatient(int patientid)
    {
        List<Consult> consults = new List<Consult>();
        try
        {
            myConnection.Open();
            SqlDataReader r = null;
            SqlCommand myCommand = new SqlCommand("select * from Consults c inner join Patients p on (p.patientId = c.patientId) inner join Users u on (u.userId = c.assignedTo) where c.patientId = @id", myConnection);

            SqlParameter pid = new SqlParameter("@id", System.Data.SqlDbType.Int);
            pid.Value = patientid;
            myCommand.Parameters.Add(pid);
            
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

    public static List<Consult> getAllConsults()
    {
        List<Consult> consults = new List<Consult>();
        try
        {
            myConnection.Open();
            SqlDataReader r = null;
            SqlCommand myCommand = new SqlCommand("select * from Consults c inner join Patients p on (p.patientId = c.patientId) inner join Users u on (u.userId = c.assignedTo) ", myConnection);

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

    public static Consult getConsult(int id)
    {
        Consult response = null;
        try
        {
            myConnection.Open();
            SqlDataReader r = null;
            SqlCommand myCommand = new SqlCommand("select * from Consults c inner join Patients p on (p.patientId = c.patientId) where c.consultId = @id", myConnection);

            SqlParameter pid = new SqlParameter("@id", System.Data.SqlDbType.Int);
            pid.Value = id;
            myCommand.Parameters.Add(pid);

            r = myCommand.ExecuteReader();

            if (r.Read())
            {
                response = new Consult(r);
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
        return response;
    }

    public static void insertConsult(Consult c)
    {
        SqlCommand myCommand = new SqlCommand("INSERT INTO Consults (startDate, endDate, price, diagnostic, scheduler, patientId, assignedTo) " +
                                     "Values (@startDate, @endDate, @price, @diagnostic, @scheduler, @patientId, @assignedTo)", myConnection);

        Consult.addDBParametersFromConsult(c, myCommand);
        
        try
        {
            myConnection.Open();
            myCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            myConnection.Close();
        }
    }

    public static void updateConsult(Consult c)
    {
        SqlCommand myCommand = new SqlCommand("Update Consults set state = @state, startDate = @startDate , endDate = @endDate, price = @price, diagnostic = @diagnostic, " + (c.scheduler != null ? "scheduler = @scheduler," : "") + " patientId = @patientId, " + (c.scheduler != null ? "assignedTo = @assignedTo," : "") + 
                                     " treatment = @treatment, propousal = @propousal, rating = @rating, clinicalAnalysis = @clinicalAnalysis where consultId = @id", myConnection);

        Consult.addDBParametersFromConsult(c, myCommand);

        SqlParameter pid = new SqlParameter("@id", System.Data.SqlDbType.Int);
        pid.Value = c.id;
        myCommand.Parameters.Add(pid);
        try
        {
            myConnection.Open();
            myCommand.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            myConnection.Close();
        }
    }

    public static Consult getConsultByPatientId(int id)
    {
        Consult response = null;
        try
        {
            myConnection.Open();
            SqlDataReader r = null;
            SqlCommand myCommand = new SqlCommand("select top(1) consultId, startDate, endDate, price, rating, state from Consults c where c.patientId = @id order by 2 desc", myConnection);

            SqlParameter pid = new SqlParameter("@id", System.Data.SqlDbType.Int);
            pid.Value = id;
            myCommand.Parameters.Add(pid);

            r = myCommand.ExecuteReader();

            if (r.Read())
            {
                response = new Consult();
                response.id = (int)r["consultId"];
                response.startDate = (DateTime)r["startDate"];
                response.endDate = (DateTime)r["endDate"];
                response.price = double.Parse(r["price"].ToString());
                response.rating = (int)r["rating"];
                response.loadStateFromInt((int)r["state"]);
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
        return response;
    }

    
    #endregion

    #region user
    public static User login(string email, string password) {
        User response = null;
        try
        {
            myConnection.Open();
            SqlDataReader r = null;
            SqlCommand myCommand = new SqlCommand("select * from Users where email like @email and password like @password", myConnection);

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
                response.id = (int)r["userId"];
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

    #endregion

    #region Expenses
    public static List<Expense> getAllExpensesForMonth(int clinicId)
    {
        List<Expense> result = new List<Expense>();
        try
        {
            myConnection.Open();
            SqlDataReader r = null;
            SqlCommand myCommand = new SqlCommand("select * from Expenses where clinicId = @clinicId ", myConnection);

            SqlParameter pclinicId = new SqlParameter("@clinicId", System.Data.SqlDbType.Int);
            pclinicId.Value = clinicId;
            myCommand.Parameters.Add(pclinicId);
            
            r = myCommand.ExecuteReader();
            Expense ex;
            
            while (r.Read())
            {
                ex = new Expense();
                ex.id = (int)r["id"];
                ex.day = (DateTime)r["day"];
                ex.name = r["name"].ToString();
                ex.amount = double.Parse(r["amount"].ToString());
                result.Add(ex);
            }
        }
        catch (Exception ex)
        {
            throw ex;
            Debug.WriteLine(ex.ToString());
        }
        finally
        {
            myConnection.Close();
        }
        return result;
    }

    #endregion

}