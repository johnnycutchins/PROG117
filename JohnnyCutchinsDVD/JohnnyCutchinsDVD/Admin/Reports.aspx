<%@ Page Title="Reports" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="JohnnyCutchinsDVD.Admin.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2 style="color:darkblue;">
        <u>The Reports Page</u>
    </h2>
    <asp:Label ID="dbErrorLabel" runat="server" ForeColor="Red"></asp:Label>

    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="ButtonLogout" runat="server" OnClick="ButtonLogout_Click" Text="Log Off" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="ButtonCustomers" runat="server" OnClick="ButtonCustomers_Click" Text="List Customers" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Button ID="OrdersButton" runat="server" OnClick="OrdersButton_Click" Text="Get Orders For Customer #" />
&nbsp;
<asp:TextBox ID="CustNumTextbox" runat="server" Height="21px" Width="74px"></asp:TextBox>
    <br />
    <br />
<hr />
    <div style="background-color: rgba(255, 255, 255, 0.5); width: 50%;">
    <asp:DataList ID="GetCustomer" runat="server">
        <HeaderTemplate><strong style="color: darkblue;"><u>Report of Customers</u></strong></HeaderTemplate>
        <ItemTemplate>
            Customer ID: <strong style="color: darkblue;"><%#Eval("CustomerID")%></strong> &nbsp;&nbsp;|&nbsp;&nbsp;
            First Name: <strong style="color: darkblue;"><%#Eval("FirstName")%></strong> &nbsp;&nbsp;|&nbsp;&nbsp;
            Last Name: <strong style="color: darkblue;"><%#Eval("LastName")%></strong><br />
        </ItemTemplate>
        <%--<AlternatingItemTemplate>
            Customer ID: <strong style="color: darkgoldenrod;"><%#Eval("CustomerID")%></strong> &nbsp;&nbsp;|&nbsp;&nbsp;
            First Name: <strong style="color: darkgoldenrod;"><%#Eval("FirstName")%></strong> &nbsp;&nbsp;|&nbsp;&nbsp;
            Last Name: <strong style="color: darkgoldenrod;"><%#Eval("LastName")%></strong><br />
        </AlternatingItemTemplate>--%>
        <FooterTemplate>
            =======================================================================
        </FooterTemplate>
    </asp:DataList>
    <br />
    <br />
    <asp:DataList ID="GetOrders" runat="server">
        <HeaderTemplate><strong style="color: darkred;"><u>Report of Orders</u></strong></HeaderTemplate>
        <ItemTemplate>
            Order Number: <strong style="color: darkred;"><%#Eval("OrderID")%></strong> &nbsp;&nbsp;|&nbsp;&nbsp;
            Customer ID: <strong style="color: darkred;"><%#Eval("CustomerID")%></strong> &nbsp;&nbsp;|&nbsp;&nbsp;
            DVDID: <strong style="color: darkred;"><%#Eval("DVDID")%></strong> &nbsp;&nbsp;|&nbsp;&nbsp;
            Title: <strong style="color: darkred;"><%#Eval("DVDtitle")%></strong><br />
        </ItemTemplate>
        <%--<AlternatingItemTemplate>
            Order Number: <strong style="color: darkolivegreen;"><%#Eval("OrderID")%></strong> &nbsp;&nbsp;|&nbsp;&nbsp;
            Customer ID: <strong style="color: darkolivegreen;"><%#Eval("CustomerID")%></strong> &nbsp;&nbsp;|&nbsp;&nbsp;
            DVDID: <strong style="color: darkolivegreen;"><%#Eval("DVDID")%></strong> &nbsp;&nbsp;|&nbsp;&nbsp;
             Title: <strong style="color: darkolivegreen;"><%#Eval("DVDtitle")%></strong><br />
        </AlternatingItemTemplate>--%>
    </asp:DataList>
    </div>












    <br />
    













</asp:Content>
