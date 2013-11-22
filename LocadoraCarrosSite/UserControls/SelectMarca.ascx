<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SelectMarca.ascx.cs" Inherits="LocadoraCarrosSite.UserControls.SelectMarca" %>

<asp:DropDownList ID="cpMarcas" runat="server" DataSourceID="SqlDataSource1" DataTextField="nome" DataValueField="id" CssClass="form-control">
</asp:DropDownList>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:locadoraConnectionString %>" ProviderName="<%$ ConnectionStrings:locadoraConnectionString.ProviderName %>" SelectCommand="SELECT * FROM veiculo_marcas"></asp:SqlDataSource>


