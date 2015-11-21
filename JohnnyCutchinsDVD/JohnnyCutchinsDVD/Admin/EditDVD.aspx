<%@ Page Title="Edit DVD" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditDVD.aspx.cs" Inherits="JohnnyCutchinsDVD.Admin.EditDVE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h2 style="color:darkblue;">
    Here you can edit an existing DVD
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="dbErrorLabel" runat="server" ForeColor="Red" />
</h2>
    <p>
        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Select a DVD to Edit</strong><br />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DVDlist" runat="server" Height="28px" Width="213px" OnSelectedIndexChanged="SelectDVD_Click" />
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <asp:Button ID="SelectDVD" runat="server" Text="Select" Height="36px" Width="202px" OnClick="SelectDVD_Click" />
    </p>
     <p>
    <span class="widelabel">DVD Title:</span>
         <asp:TextBox ID="movieTitle" runat="server" />
    <br />
    <span class="widelabel">Artist:</span>
         <asp:TextBox ID="movieArtist" runat="server" />
    <br />
    <span class="widelabel">DVD Rating:</span>
         <asp:TextBox ID="movieRating" runat="server" />
    <br />
    <span class="widelabel">Price:</span>
         <asp:TextBox ID="moviePrice" runat="server" />
    <br />
    <span class="widelabel">Description:</span>
         <asp:TextBox ID="description" runat="server" TextMode="MultiLine" Height="79px" Width="295px" />
    <br />
    <span class="widelabel">Picture URL:</span>
         <asp:TextBox ID="picURL" runat="server" />
    <br />
  </p>
<p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="editDVD" runat="server" Text="Edit DVD" OnClick="editDVD_Click" Width="213px" Height="37px" />

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="ButtonLogoff" runat="server" Height="30px" OnClick="ButtonLogoff_Click" Text="Log Off" Width="80px" />

</p>
    <p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <asp:Button ID="DeleteDVD" runat="server" Text="Delete DVD" Width="213px" Height="37px"  OnClick="DeleteDVD_Click"/>
</p>








</asp:Content>
