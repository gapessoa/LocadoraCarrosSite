<%@ Page Title="" Language="C#" MasterPageFile="~/Master/theMaster.Master" AutoEventWireup="true" CodeBehind="VerCondutor.aspx.cs" Inherits="LocadoraCarrosSite.VerCondutor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="server">
    <form id="form1" runat="server">
        <div class="page-header ">
            <h1>Dados do Condutor
            </h1>
        </div>
        <asp:DetailsView ID="DetailsView1" CssClass="table table-striped table-bordered table-hover" runat="server" DataSourceID="SqlDataSource1" Height="50px" Width="400px" AutoGenerateRows="False" DataKeyNames="id">
            <Fields>
                <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                <asp:BoundField DataField="cpf" HeaderText="CPF" SortExpression="cpf" />
                <asp:BoundField DataField="rg" HeaderText="RG" SortExpression="rg" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:BoundField DataField="cnh_registro" HeaderText="CNH Registro" SortExpression="cnh_registro" />
                <asp:BoundField DataField="cnh_data_expedicao" HeaderText="CNH Data Expedição" SortExpression="cnh_data_expedicao" />
                <asp:BoundField DataField="cnh_data_primeira_habilitacao" HeaderText="CNH Data Primeira Habilitação" SortExpression="cnh_data_primeira_habilitacao" />
                <asp:BoundField DataField="cnh_vencimento" HeaderText="CNH Vencimento" SortExpression="cnh_vencimento" />
                <asp:BoundField DataField="estado" HeaderText="Estado" SortExpression="estado" />
                <asp:BoundField DataField="cidade" HeaderText="Cidade" SortExpression="cidade" />
                <asp:BoundField DataField="bairro" HeaderText="Bairro" SortExpression="bairro" />
                <asp:BoundField DataField="cep" HeaderText="CEP" SortExpression="cep" />
                <asp:BoundField DataField="logradouro" HeaderText="Logradouro" SortExpression="logradouro" />
                <asp:BoundField DataField="complemento" HeaderText="Complemento" SortExpression="complemento" />
                <asp:CommandField ButtonType="Button" ShowEditButton="True">
                    <ControlStyle CssClass="btn btn-info" />
                </asp:CommandField>
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True">
                    <ControlStyle CssClass="btn btn-danger" />
                </asp:CommandField>
            </Fields>
        </asp:DetailsView>
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
condutores WHERE id = @ID">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" Type="Int32" DefaultValue="5" QueryStringField="id" />
            </SelectParameters>
        </asp:SqlDataSource>

    </form>

</asp:Content>
