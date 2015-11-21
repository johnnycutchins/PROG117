<%@ Page Title="The DVD Store" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="JohnnyCutchinsDVD._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<br />
<h2 style="color:darkblue;">Please browse the list of DVD’s. </h2>

    <div style="background-color: rgba(255, 255, 255, 0.5); width: 30%;">
        <asp:DataList ID="moviesRepeater" runat="server" OnItemCommand="moviesRepeater_ItemCommand">
            <ItemTemplate>
                DVDID: <strong><%#Eval("DVDID")%></strong><br />
                Movie Title: <strong><%#Eval("DVDtitle")%></strong><br />
                Artist: <strong><%#Eval("DVDartist")%></strong><br />
                Rating: <strong><%#Eval("DVDrating")%></strong><br />
                Price: <strong><%#Eval("DVDprice","{0:C}")%></strong>
                <br />
                <asp:LinkButton ID="DetailsButton" runat="server"
                    Text="Details"
                    CommandName="details"
                    CommandArgument='<%# Eval("DVDID")%>' />
                |
       <asp:LinkButton ID="BuyButton" runat="server"
           Text="Buy"
           CommandName="buy"
           CommandArgument='<%# Eval("DVDID")%>' />

            </ItemTemplate>

            <AlternatingItemTemplate>
                DVDID: <strong style="color: darkblue;"><%#Eval("DVDID")%></strong><br />
                Movie Title: <strong style="color: darkblue;"><%#Eval("DVDtitle")%></strong><br />
                Artist: <strong style="color: darkblue;"><%#Eval("DVDartist")%></strong><br />
                Rating: <strong style="color: darkblue;"><%#Eval("DVDrating")%></strong><br />
                Price: <strong style="color: darkblue;"><%#Eval("DVDprice","{0:C}")%></strong>

                <br />
                <asp:LinkButton ID="DetailsButton" runat="server"
                    Text="Details"
                    CommandName="details"
                    CommandArgument='<%# Eval("DVDID")%>' />
                |
       <asp:LinkButton ID="BuyButton" runat="server"
           Text="Buy"
           CommandName="buy"
           CommandArgument='<%# Eval("DVDID")%>' />
            </AlternatingItemTemplate>

            <SeparatorTemplate>
                <p>
                    ================================
                </p>

            </SeparatorTemplate>
        </asp:DataList>
    </div>







</asp:Content>
