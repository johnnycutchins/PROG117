<%@ Page Title="Add DVD" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddDVD.aspx.cs" Inherits="JohnnyCutchinsDVD.Admin.AddDVD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="dbErrorLabel" runat="server" ForeColor="Red" />
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="ButtonAddAnother" runat="server" Text="Add Another DVD" OnClick="ButtonAddAnother_Click" BackColor="#000066" BorderColor="White" BorderStyle="Solid" ForeColor="White" Height="65px" Width="219px" />
    <asp:Label ID="textBlock" runat="server">
    <h2 style="color:darkblue;">
    Here you can add a DVD to the store
</h2>
    <br />
    
    <div>

        <span class="widelabel">DVD Title:</span>
        <asp:TextBox ID="title" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="titelDVD" runat="server"
            ControlToValidate="title" SetFocusOnError="true"
            ErrorMessage="<br />You must enter a movie title!" ForeColor="Red"
            Display="Dynamic" ValidationGroup="First" />

        <br />


        <span class="widelabel">DVD Artist:</span>
        <asp:TextBox ID="artist" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="artistDVD" runat="server"
            ControlToValidate="artist" SetFocusOnError="true"
            ErrorMessage="<br />You must enter an artist!" ForeColor="Red"
            Display="Dynamic" ValidationGroup="First" />
        <br />


        <span class="widelabel">DVD Rating:</span>
        <asp:TextBox ID="rating" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="ratingDVD" runat="server"
            ControlToValidate="rating" SetFocusOnError="true"
            ErrorMessage="<br />You must enter a rating!" ForeColor="Red"
            Display="Dynamic" ValidationGroup="First" />
        <asp:RangeValidator ID="ratingValidator" runat="server"
            ControlToValidate="rating" SetFocusOnError="true"
            ErrorMessage="<br />The valid Ratings are 1, 2, 3, 4, and 5" ForeColor="Red"
            MinimumValue="1" MaximumValue="5" Type="Integer"
            Display="Dynamic" ValidationGroup="First" />

        <br />


        <span class="widelabel">DVD Price:</span>
        <asp:TextBox ID="price" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="priceDVD" runat="server"
            ControlToValidate="price" SetFocusOnError="true"
            ErrorMessage="<br />You must enter a price!" ForeColor="Red"
            Display="Dynamic" ValidationGroup="First" />
        <asp:CompareValidator ID="priceCompare" runat="server"
            ControlToValidate="price" SetFocusOnError="true"
            ErrorMessage="<br />You must enter a valid price!"
            Type="Currency" Display="Dynamic" ForeColor="Red"
            Operator="DataTypeCheck" ValidationGroup="First" />

        <br />
        <span class="widelabel">(Optional) Description:</span>
        <asp:TextBox ID="description" runat="server" TextMode="MultiLine" Height="71px" Width="196px"></asp:TextBox>

        <span class="widelabel">(Optional) Image URL:</span>
        <asp:TextBox ID="imageURL" runat="server"></asp:TextBox>


        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="addMovie" runat="server" Text="Add DVD" Width="260px" BorderStyle="Solid" ForeColor="#000099" OnClick="addMovie_Click" ValidationGroup="First" Height="29px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonLogoff" runat="server" Height="25px" OnClick="ButtonLogoff_Click" Text="Log Off" Width="80px" ValidationGroup="Second" />
        <br />

    </div>
        </asp:Label></asp:Content>