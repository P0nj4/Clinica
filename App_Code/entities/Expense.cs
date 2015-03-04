using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Expense
/// </summary>
public class Expense
{

    public DateTime day { get; set; }
    public string name { get; set; }
    public int id { get; set; }
    public double amount { get; set; }
	
    public Expense()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}