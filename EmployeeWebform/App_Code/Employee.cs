using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// Simple Employee class consisting of ID, first and last name, phone number, zipcode and hire date
/// represents one row of the database.
/// </summary>
public class Employee
{
    public Employee() { }

    public int empID { get; set; }

    public String firstName { get; set; }

    public String lastName { get; set; }

    public String phoneNumber { get; set; }

    public String zipCode { get; set; }

    public String hireDate { get; set; }
}