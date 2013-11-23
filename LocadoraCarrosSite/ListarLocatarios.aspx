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
                    <asp:BoundField DataField="rg" HeaderText="rg" SortExpression="rg" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="cidade" HeaderText="cidade" SortExpression="cidade" />
                    <asp:BoundField DataField="estado" HeaderText="estado" SortExpression="estado" />
                    <asp:BoundField DataField="logradouro" HeaderText="logradouro" SortExpression="logradouro" />
                    <asp:BoundField DataField="bairro" HeaderText="bairro" SortExpression="bairro" />
                    <asp:BoundField DataField="cep" HeaderText="cep" SortExpression="cep" />
                    <asp:BoundField DataField="complemento" HeaderText="complemento" SortExpression="complemento" />
                    <asp:BoundField DataField="cnpj" HeaderText="cnpj" SortExpression="cnpj" />
                    <asp:BoundField DataField="nome_fantasia" HeaderText="nome_fantasia" SortExpression="nome_fantasia" />
                    <asp:CheckBoxField DataField="tipo" HeaderText="tipo" SortExpression="tipo" />
                    <asp:CommandField ButtonType="Button" HeaderText="Editar" ShowCancelButton="False" ShowEditButton="True">
                        <ControlStyle CssClass="btn btn-info" />
                    </asp:CommandField>
                    <asp:CommandField ButtonType="Button" HeaderText="Deletar" ShowDeleteButton="True">
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:locadoraConnectionString %>" ProviderName="<%$ ConnectionStrings:locadoraConnectionString.ProviderName %>" SelectCommand="SELECT * FROM locatarios"></asp:SqlDataSource>
    </form>

</asp:Content>
