<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultPageMaster.Master" AutoEventWireup="true" CodeBehind="SearchBeverage.aspx.cs" Inherits="de1.SearchBeverage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/BeverageStyles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="txtName" runat="server" placeholder="Enter beverage name" />
    <asp:TextBox ID="txtMinPrice" runat="server" placeholder="Min Price" />
    <asp:TextBox ID="txtMaxPrice" runat="server" placeholder="Max Price" />
    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
    
    <div id="results">
        <asp:ListView ID="BeverageListView" runat="server">
            <ItemTemplate>
                <div class="beverage-item">
                    <img src='/iamges/Beverages/<%# Eval("ImageFilePath") %>' alt='<%# Eval("Name") %>' />
                    <h3><%# Eval("Name") %></h3>
                    <p><%# Eval("Description") %></p>
                    <p>Price: <%# Eval("Price", "{0:C}") %></p>
                    <p>Likes: <%# Eval("NumsLike") %></p>
                </div>
            </ItemTemplate>
        </asp:ListView>
        
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
    </div>
</asp:Content>
