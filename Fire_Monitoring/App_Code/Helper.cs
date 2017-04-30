using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;

/// <summary>
/// Summary description for Helper
/// </summary>
public class Helper
{
    public static String Connect()
    {

        return ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString;
    }
}