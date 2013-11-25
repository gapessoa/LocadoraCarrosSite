<%@ Page Title="" Language="C#" MasterPageFile="~/Master/theMaster.Master" AutoEventWireup="true" CodeBehind="ListarCondutores.aspx.cs" Inherits="LocadoraCarrosSite.ListarCondutores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="server">
    <form id="form1" runat="server">
        <div class="page-header ">
            <h1>Listar Condutores
            </h1>
        </div>
        <div class="table-responsive">
            <asp:GridView ID="GridView1" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                    <asp:BoundField DataField="cpf" HeaderText="CPF" SortExpression="cpf" />
                    <asp:BoundField DataField="email" HeaderText="E-Mail" SortExpression="email" />
                    <asp:BoundField DataField="estado" HeaderText="UF" SortExpression="estado" />
                    <asp:BoundField DataField="cidade" HeaderText="Cidade" SortExpression="cidade" />
                    <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="VerCondutor.aspx?id={0}" Text="Info" HeaderText="Info">
                    <ControlStyle CssClass="btn btn-info" />
                    </asp:HyperLinkField>
                    <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Você realmente deseja deletar este item?')" />
                        </ItemTemplate>
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:locadoraConnectionString %>" ProviderName="<%$ ConnectionStrings:locadoraConnectionString.ProviderName %>" SelectCommand="SELECT
condutores.id,
condutores.nome,
condutores.cpf,
condutores.rg,
condutores.email,
condutores.cnh_registro,
DATE_FORMAT(condutores.cnh_data_expedicao, '%d/%c/%Y') as cnh_data_expedicao,
DATE_FORMAT(condutores.cnh_data_primeira_habilitacao, '%d/%c/%Y') as cnh_data_primeira_habilitacao,
DATE_FORMAT(condutores.cnh_vencimento, '%d/%c/%Y') as cnh_vencimento,
condutores.cidade,
condutores.estado,
condutores.logradouro,
condutores.bairro,
condutores.cep,
condutores.complemento
FROM
condutores
" DeleteCommand="DELETE FROM condutores WHERE id = @ID"></asp:SqlDataSource>

    </form>
</asp:Content>
