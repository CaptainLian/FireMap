using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlTypes;

/// <summary>
/// Summary description for Location
/// </summary>
public class Location
{
    public SqlDecimal lat;
    public SqlDecimal lng;
    public Location(SqlDecimal lat, SqlDecimal lng)
    {
        this.lat = lat;
        this.lng = lng;
        //
        // TODO: Add constructor logic here
        //
    }
}