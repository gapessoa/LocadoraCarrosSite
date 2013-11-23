<%@ Page Title="" Language="C#" MasterPageFile="~/Master/theMaster.Master" AutoEventWireup="true" CodeBehind="ListarCondutores.aspx.cs" Inherits="LocadoraCarrosSite.ListarCondutores" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="server">
    <form id="form1" runat="server">
        <div class="page-header ">
            <h1>
            Listar Condutores
        </div>
        <div class="table-responsive">
            <asp:GridView ID="GridView1" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome" />
                    <asp:BoundField DataField="cpf" HeaderText="CPF" SortExpression="cpf" />
                    <asp:BoundField DataField="rg" HeaderText="RG" SortExpression="rg" />
                    <asp:BoundField DataField="email" HeaderText="E-Mail" SortExpression="email" />
                    <asp:BoundField DataField="estado" HeaderText="UF" SortExpression="estado" />
                    <asp:BoundField DataField="cidade" HeaderText="Cidade" SortExpression="cidade" />
                    <asp:BoundField DataField="bairro" HeaderText="Bairro" SortExpression="bairro" />
                    <asp:BoundField DataField="logradouro" HeaderText="Logradouro" SortExpression="logradouro" />
                    <asp:BoundField DataField="complemento" HeaderText="Complemento" SortExpression="complemento" />
                    <asp:BoundField DataField="cep" HeaderText="CEP" SortExpression="cep" />
                    <asp:BoundField DataField="cnh_registro" HeaderText="CNH Registro" SortExpression="cnh_registro" />
                    <asp:BoundField DataField="cnh_vencimento" HeaderText="CNH Venc." SortExpression="cnh_vencimento" />
                    <asp:BoundField DataField="cnh_data_primeira_habilitacao" HeaderText="1ª Hab." SortExpression="cnh_data_primeira_habilitacao" />
                    <asp:BoundField DataField="cnh_data_expedicao" HeaderText="CNH Dat. Exp." SortExpression="cnh_data_expedicao" />
                    <asp:CommandField ButtonType="Button" HeaderText="Editar" ShowCancelButton="False" ShowEditButton="True" ShowHeader="True">
                        <ControlStyle CssClass="btn btn-info" />
                    </asp:CommandField>
                    <asp:CommandField ButtonType="Button" HeaderText="Deletar" ShowDeleteButton="True" ShowHeader="True">
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:CommandField>
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
"></asp:SqlDataSource>
        </h1>

    </form>
</asp:Content>
