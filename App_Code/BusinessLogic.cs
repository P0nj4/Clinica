using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for BusinessLogic
/// </summary>
public class BusinessLogic
{
    public static List<Patient> dummyGetAllPatients()
    {
        List<Patient> patients = new List<Patient>();
        for (int i = 0; i < 10; i++)
        {
            Patient aux = new Patient("Nombre" + i, "Apellido" + i, "Email" + i, "Tel" + i, "Descripcion" + i, new DateTime(), "Montevideo, Uruguay", "Facebook");
            patients.Add(aux);
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

    public static List<Consult> dummyGetTodayConsults() {
        List<Consult> consults = new List<Consult>();
        List<Patient> patients = BusinessLogic.dummyGetAllPatients();
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