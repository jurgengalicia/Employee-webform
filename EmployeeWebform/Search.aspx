<%@ Page Title="Search" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="About" %><%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<%--Search page for searching for an employee/s in the database--%>
<%--Uses labels, textboxes, validators and AJAX mask editor to assist with filling out the search form--%>
<%--Uses a placeholder to dynamically display results from the search--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
        <h1>Search Employee</h1>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Employee last name"></asp:Label>
            <asp:TextBox ID="lastNameBox" runat="server" placeholder="Smith"></asp:TextBox>
        </p>
        <p>
            or
        </p>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Phone number"></asp:Label>
            <asp:TextBox ID="phoneNumberBox" runat="server" placeholder="(XXX) XXX-XXXX" AutoPostBack="True"></asp:TextBox>
            <asp:RegularExpressionValidator ID="phoneRegexValidator" runat="server" Display="Dynamic" ErrorMessage="Leave empty or enter valid phone number" ForeColor="Red" ControlToValidate="phoneNumberBox" ValidationExpression="(((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}|\(___\) ___-____)"></asp:RegularExpressionValidator>
            <ajaxToolkit:MaskedEditExtender ID="phoneNumberBox_MaskedEditExtender" runat="server" ClearMaskOnLostFocus="False" Mask="(999) 999-9999" TargetControlID="phoneNumberBox" ClearTextOnInvalid="True" />
            
            &nbsp;</p>
        <p>
            <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Reset" />
            
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            &nbsp;</p>

        
    </div>
</asp:Content>
