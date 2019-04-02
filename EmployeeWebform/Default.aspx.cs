using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //on button click, uses gateway register an employee.
    protected void Button1_Click(object sender, EventArgs e)
    {
        Employee employee = new Employee();

        employee.firstName = firstNameBox.Text;
        employee.lastName = lastNameBox.Text;
        employee.phoneNumber = phoneNumberBox.Text;
        employee.zipCode = zipBox.Text;
        employee.hireDate = dateHiredBox.Text;

        Gateway gate = new Gateway();
        gate.Save(employee);

        Response.Write("Registration Complete!");

    }

    //resets all fields and dynamic tables
    protected void Button2_Click(object sender, EventArgs e)
    {
        firstNameBox.Text = "";
        lastNameBox.Text = "";
        phoneNumberBox.Text = "";
        zipBox.Text = "";
        dateHiredBox.Text = "";
    }
}