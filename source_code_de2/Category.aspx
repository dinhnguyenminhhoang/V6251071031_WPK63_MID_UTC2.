<%@ Page Title="" Language="C#" MasterPageFile="~/DefaultPageMaster.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="de1.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/BeverageStyles.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Beverages in Category</h2>
    <asp:ListView ID="BeverageListView" runat="server">
        <ItemTemplate>
            <div class="beverage-item">
                <h3><%# Eval("Name") %></h3>
                <img src='/iamges/Beverages/<%# Eval("ImageFilePath") %>' alt='<%# Eval("Name") %>' />
                <p><%# Eval("Description") %></p>
                <p>Price: <%# Eval("Price", "{0:C}") %></p>
                <p>Likes: <%# Eval("NumsLike") %></p>
            </div>
        </ItemTemplate>
        <LayoutTemplate>
            <div class="beverage-list-container">
                <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
            </div>
          <div class="pagination-container">
          <asp:DataPager ID="BeverageDataPager" runat="server" PageSize="2" PagedControlID="BeverageListView" CssClass="beverage-pager" OnPagePropertiesChanged="BeverageDataPager_PagePropertiesChanged">
                <Fields>
                    <asp:NumericPagerField />
                </Fields>
    </asp:DataPager>
</div>

        </LayoutTemplate>
    </asp:ListView>
</asp:Content>
