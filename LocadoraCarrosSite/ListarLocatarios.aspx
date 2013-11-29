<%@ Page Title="" Language="C#" MasterPageFile="~/Master/theMaster.Master" AutoEventWireup="true" CodeBehind="ListarLocatarios.aspx.cs" Inherits="LocadoraCarrosSite.ListarLocatarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="server">

    <form id="form1" runat="server">
        <div class="page-header ">
            <h1>Listar Locatários</h1>
        </div>
        <div class="table-responsive">
            <asp:GridView ID="GridView1" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome" />
                    <asp:BoundField DataField="cpf" HeaderText="cpf" SortExpression="cpf" />
                    <asp:BoundField DataField="cnpj" HeaderText="cnpj" SortExpression="cnpj" />
                    <asp:BoundField DataField="cidade" HeaderText="cidade" SortExpression="cidade" />
                    <asp:BoundField DataField="estado" HeaderText="estado" SortExpression="estado" />
                    <asp:BoundField DataField="Tipo" HeaderText="Tipo" SortExpression="Tipo" />
                    <asp:TemplateField HeaderText="Deletar">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Você realmente deseja deletar este item?')" />
                        </ItemTemplate>
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:locadoraConnectionString %>" ProviderName="<%$ ConnectionStrings:locadoraConnectionString.ProviderName %>" SelectCommand="SELECT locatarios.id as id,locatarios.nome as nome, cpf, cnpj, cidade, estado, tipo_pessoa.nome as Tipo FROM locatarios LEFT JOIN tipo_pessoa ON (locatarios.tipo = tipo_pessoa.id)" DeleteCommand="DELETE FROM locatarios WHERE id = @id"></asp:SqlDataSource>
    </form>

</asp:Content>
