<%@ Page Title="Manage Beverage" Language="C#" MasterPageFile="~/DefaultPageMaster.Master" AutoEventWireup="true" CodeBehind="ManageBeverage.aspx.cs" Inherits="de1.ManageBeverage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" type="text/css" href="Styles/BeverageStyles.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="lblName" runat="server" Text="Name:" />
        <asp:TextBox ID="txtName" runat="server" />
        
        <asp:Label ID="lblDescription" runat="server" Text="Description:" />
        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="3" />
        
        <asp:Label ID="lblImage" runat="server" Text="Image File Path:" />
        <asp:TextBox ID="txtImage" runat="server" />
        
        <asp:Label ID="lblPrice" runat="server" Text="Price:" />
        <asp:TextBox ID="txtPrice" runat="server" />
        
        <asp:Label ID="lblLikes" runat="server" Text="Likes:" />
        <asp:TextBox ID="txtLikes" runat="server" />
        
        <asp:Button ID="btnAdd" runat="server" Text="Add Beverage" OnClick="btnAdd_Click" />
    </div>

    <hr />

    <asp:GridView ID="BeverageGridView" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:ImageField DataImageUrlField="ImageFilePath" HeaderText="Image" ControlStyle-Width="100px" ControlStyle-Height="100px" />
            <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:C}" />
            <asp:BoundField DataField="NumsLike" HeaderText="Likes" />
            <asp:ButtonField ButtonType="Button" CommandName="Edit" Text="Edit" />
            <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Delete" />
        </Columns>
    </asp:GridView>
</asp:Content>
