<%@ Page Title="" Language="C#" MasterPageFile="~/Master/theMaster.Master" AutoEventWireup="true" CodeBehind="ListarMarcas.aspx.cs" Inherits="LocadoraCarrosSite.ListarMarcas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="server">
    <form id="form1" runat="server">
    <div class="page-header ">
        <h1>Marcas Disponíveis</h1>
    </div>
    <asp:GridView ID="GridView1" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="MysqlLocadora" AllowPaging="True" AllowSorting="True">
        <PagerSettings  Mode="NextPreviousFirstLast" FirstPageText="First" PreviousPageText="Previous" NextPageText="Next" LastPageText="Last" />
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID"/>
            <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
            <asp:CommandField ButtonType="Button" HeaderText="Update" ShowCancelButton="False" ShowEditButton="True" ShowHeader="True" ControlStyle-CssClass="btn btn-info" />
            <asp:ButtonField ButtonType="Button" CommandName="Delete" HeaderText="Delete" ShowHeader="True" Text="Delete" ControlStyle-CssClass="btn btn-danger" >
<ControlStyle CssClass="btn btn-danger"></ControlStyle>
            </asp:ButtonField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="MysqlLocadora" runat="server" ConnectionString="<%$ ConnectionStrings:locadoraConnectionString %>" ProviderName="<%$ ConnectionStrings:locadoraConnectionString.ProviderName %>" SelectCommand="SELECT id as ID, nome as Marca FROM veiculo_marcas" DeleteCommand="DELETE FROM veiculo_marcas WHERE id=@ID" UpdateCommand="UPDATE veiculo_marcas SET nome = @Marca WHERE id=@ID"></asp:SqlDataSource>
</form>
</asp:Content>
