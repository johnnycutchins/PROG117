<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Thanks.aspx.cs" Inherits="JohnnyCutchinsDVD.Thanks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br />
    <div style="background-color: black; color: white; width:30%; padding:2%;">
        <h1 style="color: white;">Thank you for your order </h1>
        <br />
        Your Customer Number is: <strong>
            <asp:Label ID="custNum" runat="server" Text="Label"></asp:Label></strong>
        <br />
        Your movie is: <strong>
            <asp:Label ID="LabelTitle" runat="server" Text="Label"></asp:Label></strong>
        <br />
        You paid: <strong>
            <asp:Label ID="LabelPaid" runat="server" Text="Label"></asp:Label></strong>
        <br />
        <br />
        <asp:Label ID="statusLabel" runat="server"></asp:Label>
    </div>
    














</asp:Content>
