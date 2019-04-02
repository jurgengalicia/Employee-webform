using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //on button click, uses gateway to receive a list of employee rows.
    //and replaces the placeholder in the page with a table of the employees that came up with a match in the query.
    protected void Button1_Click(object sender, EventArgs e)
    {
        Employee employee = new Employee();
        StringBuilder table = new StringBuilder();

        employee.lastName = lastNameBox.Text;
        String str = phoneNumberBox.Text;

        if (str[str.Length - 1] == '_')
            employee.phoneNumber = null;
        else
            employee.phoneNumber = str;

        Gateway gate = new Gateway();
        List<Employee> empList = gate.Load(employee);

        if (!empList.Any())
        {
            PlaceHolder1.Controls.Add(new Literal { Text = "<p>no results found</p>" });
            return;
        }

        table.Append("<table class='table table - striped' border=1>");
        table.Append("<tr><th>Id</th><th>Last Name</th><th>First Name</th><th>Phone No.</th><th>ZipCode</th><th>Hire Date</th><tr>");
        foreach(Employee emp in empList)
        {
            table.Append("<tr>");
            table.Append("<td>" + emp.empID + "</td>");
            table.Append("<td>" + emp.lastName + "</td>");
            table.Append("<td>" + emp.firstName + "</td>");
            table.Append("<td>" + emp.phoneNumber + "</td>");
            table.Append("<td>" + emp.zipCode+ "</td>");
            table.Append("<td>" + emp.hireDate+ "</td>");
            table.Append("</tr>");
        }
        table.Append("</table>");
        PlaceHolder1.Controls.Add(new Literal { Text = table.ToString() });
    }

    //resets all fields and dynamic tables
    protected void Button2_Click(object sender, EventArgs e)
    {
        lastNameBox.Text = "";
        phoneNumberBox.Text = "";
    }
}