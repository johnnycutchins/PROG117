<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="JohnnyCutchinsDVD.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <h2>Please Login Here</h2>
<p> 
   Username:<br /> 
   <asp:TextBox id ="usernameTextBox" runat ="server" />
   <asp:RequiredFieldValidator id ="usernameReq" runat ="server" 
        ControlToValidate ="usernameTextBox"  SetFocusOnError = "true"
        ErrorMessage ="Username is required!"  /> 
</p> 

<p> 
   Password:<br />
   <asp:TextBox id ="passwordTextBox" runat ="server" TextMode ="Password" />
   <asp:RequiredFieldValidator id ="passwordReq" runat ="server" 
        ControlToValidate ="passwordTextBox" SetFocusOnError = "true"
        ErrorMessage ="Password is required!"  />
</p> 
<p>
<asp:Button id ="submitButton" runat ="server" Text ="Login" Height="29px" OnClick="submitButton_Click" Width="126px" />
</p>















</asp:Content>
