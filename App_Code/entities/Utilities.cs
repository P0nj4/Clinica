using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Utilities
/// </summary>
public class Utilities
{
	public Utilities()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static bool HasColumn(SqlDataReader Reader, string ColumnName)
    {
        foreach (System.Data.DataColumn row in Reader.GetSchemaTable().Columns)
        {
            if (row.ColumnName == ColumnName)
                return true;
        } //Still here? Column not found. 
        return false;
    }
}