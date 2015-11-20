<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="JohnnyCutchinsCapitals._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="LabelError" runat="server" ForeColor="Red"/>
  <asp:Repeater ID="CountriesList" runat="server">
      <ItemTemplate> 
      Country ID: <strong><%#Eval("CountryID")%></strong><br />
      Country: <strong><%#Eval("Country")%></strong><br />
      Capital: <strong><%#Eval("Capital")%></strong>     
   </ItemTemplate>
      <SeparatorTemplate>
          <hr />
          <hr />
      </SeparatorTemplate>
  </asp:Repeater>

    <br />
    <br />
    Enter Country ID to Delete:&nbsp; <asp:DropDownList ID="CapitalsList" runat="server"></asp:DropDownList>
    
    <br />
    <br />
    <asp:Button ID="ButtonDelete" runat="server" Text="Delete" Height="34px" OnClick="ButtonDelete_Click" Width="167px" />









</asp:Content>
