<%@ Page Title="" Language="C#" MasterPageFile="~/Master/theMaster.Master" AutoEventWireup="true" CodeBehind="VerLocatario.aspx.cs" Inherits="LocadoraCarrosSite.VerLocatario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="server">
    <form id="form1" runat="server">
        <div class="page-header ">
            <h1>Dados do Locatario
            </h1>
        </div>
        <asp:DetailsView ID="DetailsView1" CssClass="table table-striped table-bordered table-hover" runat="server" DataSourceID="SqlDataSource1" Height="50px" Width="400px" AutoGenerateRows="False" DataKeyNames="id">
            <Fields>
                <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                <asp:BoundField DataField="cpf" HeaderText="CPF" SortExpression="cpf" />
                <asp:BoundField DataField="rg" HeaderText="RG" SortExpression="rg" />
                <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
                <asp:BoundField DataField="cidade" HeaderText="Cidade" SortExpression="cidade" />
                <asp:BoundField DataField="estado" HeaderText="Estado" SortExpression="estado" />
                <asp:BoundField DataField="logradouro" HeaderText="Logradouro" SortExpression="logradouro" />
                <asp:BoundField DataField="bairro" HeaderText="Bairro" SortExpression="bairro" />
                <asp:BoundField DataField="cep" HeaderText="CEP" SortExpression="cep" />
                <asp:BoundField DataField="complemento" HeaderText="Complemento" SortExpression="complemento" />
                <asp:BoundField DataField="cnpj" HeaderText="CNPJ" SortExpression="cnpj" />
                <asp:BoundField DataField="nome_fantasia" HeaderText="Nome Fantasia" SortExpression="nome_fantasia" />
                <asp:BoundField DataField="tipo" HeaderText="Tipo" SortExpression="tipo" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:locadoraConnectionString %>" ProviderName="<%$ ConnectionStrings:locadoraConnectionString.ProviderName %>" SelectCommand="SELECT locatarios.id as id, locatarios.nome as nome, cpf, rg, email, cidade, estado, logradouro, bairro, cep, complemento, cnpj, nome_fantasia, tipo_pessoa.nome as tipo FROM locatarios LEFT JOIN tipo_pessoa ON (tipo_pessoa.id = locatarios.tipo) WHERE locatarios.id = @id">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" Type="Int32" DefaultValue="1" QueryStringField="id" />
            </SelectParameters>
        </asp:SqlDataSource>

        </asp:SqlDataSource>
    </form>
</asp:Content>
