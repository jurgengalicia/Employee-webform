using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;

/// <summary>
/// Gateway class that communicates with the database.
/// uses connection strings and query strings to send and retrieve data to and from the database
/// Database name and table name is Employee, while the database is stored locally.
/// </summary>
public class Gateway
{
    public Gateway() { }

    //function receives employee class to insert into the database
    public void Save(Employee emp)
    {
        String connectionString = @"Data Source=JURGEN-HP;Initial Catalog=Employee;Integrated Security=True";
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
        String query = @"INSERT INTO Employee Values('"
                            + emp.lastName + "','"
                            + emp.firstName + "','"
                            + emp.phoneNumber + "','"
                            + emp.zipCode + "','"
                            + emp.hireDate + "'"
                            + ")";

        SqlCommand command = new SqlCommand(query, connection);
        command = new SqlCommand(query, connection);
        command.ExecuteNonQuery();
        connection.Close();

    }

    //function receives employee class, containing either last name, phone number or both
    //to search the database, and returns a list of Employee classes
    public List<Employee> Load(Employee emp)
    {
        List<Employee> empList = new List<Employee>();
        String connectionString = @"Data Source=JURGEN-HP;Initial Catalog=Employee;Integrated Security=True";
        SqlConnection connection = new SqlConnection(connectionString);
        connection.Open();
        String query = @"SELECT * FROM Employee WHERE ";

        if (!string.IsNullOrEmpty(emp.lastName) && !string.IsNullOrEmpty(emp.phoneNumber))
            query = query + "EmployeeLastName = '" + emp.lastName + "' AND EmployeePhone = '" + emp.phoneNumber + "'";
        else if (string.IsNullOrEmpty(emp.lastName))
            query = query + "EmployeePhone = '" + emp.phoneNumber + "'";
        else if (string.IsNullOrEmpty(emp.phoneNumber))
            query = query + "EmployeeLastName = '" + emp.lastName + "'";
        else
        {
            connection.Close();
            return empList;
        }
        query = query + "ORDER BY HireDate ASC";

        SqlCommand command = new SqlCommand(query, connection);
        SqlDataReader reader = command.ExecuteReader();
        
        for (int i = 0; reader.Read(); i++)
        {
            empList.Add(new Employee());
            empList[i].empID = (int) reader["EmployeeID"];
            empList[i].lastName = reader["EmployeeLastName"].ToString();
            empList[i].firstName = reader["EmployeeFirstName"].ToString();
            empList[i].phoneNumber = reader["EmployeePhone"].ToString();
            empList[i].zipCode = reader["EmployeeZip"].ToString();

            DateTime dateAndTime = (DateTime)reader["HireDate"];
            empList[i].hireDate = dateAndTime.ToString("MM/dd/yyyy");
        }

        connection.Close();

        return empList;

    }
}