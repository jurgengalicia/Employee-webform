<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<%--Home page for inserting an employee to the database--%>
<%--Uses labels, textboxes, validators and AJAX mask editor to assist with filling out the form--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Employee Registration</h1>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Last Name"></asp:Label>
            <asp:TextBox ID="lastNameBox" runat="server" placeholder="Smith"></asp:TextBox>
            <asp:RequiredFieldValidator ID="lastRequiredValidator" runat="server" ControlToValidate="lastNameBox" Display="Dynamic" ErrorMessage="Last name is required" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="Label2" runat="server" Text="First Name"></asp:Label>
            <asp:TextBox ID="firstNameBox" runat="server" placeholder="John"></asp:TextBox>
            <asp:RequiredFieldValidator ID="firstRequiredValidator" runat="server" ControlToValidate="firstNameBox" Display="Dynamic" ErrorMessage="First name is required" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Phone Number"></asp:Label>
            <asp:TextBox ID="phoneNumberBox" runat="server" placeholder="(XXX) XXX-XXXX" AutoPostBack="True"></asp:TextBox>
            <ajaxToolkit:MaskedEditExtender ID="phoneNumberBox_MaskedEditExtender" runat="server" TargetControlID="phoneNumberBox" Mask="(999) 999-9999" MessageValidatorTip="true" ErrorTooltipEnabled="True" ClearMaskOnLostFocus="False" AutoComplete="False" ValidateRequestMode="Enabled" ViewStateMode="Enabled" />
            &nbsp;<asp:RegularExpressionValidator ID="phoneRegexValidator" runat="server" Display="Dynamic" ErrorMessage="Enter valid phone number" ForeColor="Red" ControlToValidate="phoneNumberBox" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>

        </p>
        
        <p>
            <asp:Label ID="Label4" runat="server" Text="Zipcode"></asp:Label>
            <asp:TextBox ID="zipBox" runat="server" placeholder="00000" MaxLength="5"></asp:TextBox>
            <asp:RequiredFieldValidator ID="zipRequiredValidator" runat="server" ControlToValidate="zipBox" Display="Dynamic" ErrorMessage="Enter your zipcode" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="phoneRegexValidator0" runat="server" Display="Dynamic" ErrorMessage="Enter valid zip code" ForeColor="Red" ControlToValidate="zipBox" ValidationExpression="^[0-9]{5}"></asp:RegularExpressionValidator>

        </p>
        <p>
            <asp:Label ID="Label5" runat="server" Text="Date Hired"></asp:Label>
            <asp:TextBox ID="dateHiredBox" runat="server" placeholder="MM/DD/YYYY"></asp:TextBox>
            <ajaxToolkit:MaskedEditExtender ID="dateHiredBox_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False" Mask="99/99/9999" TargetControlID="dateHiredBox" />
            <asp:RegularExpressionValidator ID="phoneRegexValidator1" runat="server" Display="Dynamic" ErrorMessage="Enter valid hire date" ForeColor="Red" ControlToValidate="dateHiredBox" ValidationExpression="^(((0)[1-9])|((1)[0-2]))(\/)(((0)[1-9])|[1-2][0-9]|(3)[0-1])(\/)\d{4}$"></asp:RegularExpressionValidator>

        </p>
        <p>
            <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" style="height: 36px" />
        &nbsp;
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Reset" />
        </p>
    </div>
</asp:Content>
