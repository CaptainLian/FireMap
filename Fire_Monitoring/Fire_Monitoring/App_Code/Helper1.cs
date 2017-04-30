using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;


    public class Helper1
    {
        public static String Connect()
        {

            return ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString;
        }
    }
