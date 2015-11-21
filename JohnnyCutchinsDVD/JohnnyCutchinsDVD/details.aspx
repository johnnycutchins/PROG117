<%@ Page Title="Details" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="details.aspx.cs" Inherits="JohnnyCutchinsDVD.details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<br />
<h2 style="color:darkblue; margin: 2%;">The Details Of Your Selection</h2>
     <asp:Label ID="dbErrorLabel" runat="server" ForeColor="Red" ></asp:Label>
    <asp:Label ID="DVDIDlabel" runat="server" Visible="False"></asp:Label>
    <br />
    <div style="background-color: black; color: white; width:30%; padding:2%;">
    <h2 style="text-align:center; color: white; font-size:30px;">
        <%--title--%>
        <asp:Label ID="TitleLabel" runat="server"></asp:Label></h2>
    <br />
        <%--artist--%>
       <strong> Starring:</strong>
            <asp:Label ID="ArtistLabel" runat="server"></asp:Label>
            <br />
        <%--rating--%>
           <strong> Rating:</strong>
            <asp:Label ID="RatingLabel" runat="server"></asp:Label>
            <br />
        <%--description--%>
            <strong>Description:</strong>
          <u>  <asp:Label ID="DescriptionLabel" runat="server"></asp:Label></u>
            <br /><br /><br />
        <%--picture--%>
        <div style="text-align: center;">
            <asp:Image ID="PictureLabel" runat="server" Width="150" Height="200" BackColor="Black" BorderStyle="Inset" AlternateText="Movie Image" />
        </div>
            <br />
            <%--Price:
            <asp:Label ID="PriceLabel" runat="server"></asp:Label>--%>
        

   <div style="text-align: center;">
       <asp:Button ID="ButtonBack" runat="server" Text="Back To Movies" Height="36px" OnClick="ButtonBack_Click" Width="153px" />
   </div>
        </div> 











</asp:Content>
