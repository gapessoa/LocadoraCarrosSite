<%@ Page Title="" Language="C#" MasterPageFile="~/Master/theMaster.Master" AutoEventWireup="true" CodeBehind="ListarLocacoes.aspx.cs" Inherits="LocadoraCarrosSite.ListarLocacoes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="server">

    <form id="form1" runat="server">
                <div class="page-header ">
            <h1>Locações Disponíveis</h1>
        </div>
        <div class="table-responsive">
        <asp:GridView ID="GridView1" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="data_saida" HeaderText="Data de Saída" SortExpression="data_saida" />
                <asp:BoundField DataField="tipo_locacao" HeaderText="Tipo de Locação" SortExpression="tipo_locacao" />
                <asp:BoundField DataField="km_saida" HeaderText="KM de Saída" SortExpression="km_saida" />
                <asp:BoundField DataField="condutor_nome" HeaderText="Condutor" SortExpression="condutor_nome" />
                <asp:BoundField DataField="locatario_nome" HeaderText="Locatário" SortExpression="locatario_nome" />
                <asp:BoundField DataField="veiculo_nome" HeaderText="Veículo" SortExpression="veiculo_nome" />
                <asp:BoundField DataField="data_devolucao" HeaderText="Data de Devolução" SortExpression="data_devolucao" />
                <asp:BoundField DataField="valor_pago" HeaderText="Valor Pago" SortExpression="valor_pago" />
                <asp:HyperLinkField DataNavigateUrlFields="id" DataNavigateUrlFormatString="CadastrarDevolucao.aspx?id={0}" HeaderText="Devolução" Text="Devolução">
                <ControlStyle CssClass="btn btn-info" />
                </asp:HyperLinkField>
            </Columns>
        </asp:GridView>
            </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:locadoraConnectionString %>" ProviderName="<%$ ConnectionStrings:locadoraConnectionString.ProviderName %>" SelectCommand="SELECT
locacoes.id,
DATE_FORMAT(locacoes.data_reserva, '%d/%c/%Y') as data_reserva,
tipo_locacao.nome as tipo_locacao,
locacoes.franquia_dia,
locacoes.diarias_previstas,
locacoes.destino,
DATE_FORMAT(locacoes.data_saida, '%d/%c/%Y') as data_saida, 
locacoes.km_saida,
DATE_FORMAT(locacoes.data_contrato, '%d/%c/%Y') as data_contrato, 
condutores.nome as condutor_nome,
locatarios.nome as locatario_nome,
veiculos.nome as veiculo_nome,
DATE_FORMAT(locacoes.dt_devolucao, '%d/%c/%Y') as data_devolucao,
locacoes.km_devolucao,
locacoes.valor_pago
FROM
locacoes
LEFT JOIN
locatarios 
ON (locatarios.id = locacoes.locatario_id)
LEFT JOIN
veiculos 
ON (veiculos.id = locacoes.veiculo_id)
LEFT JOIN 
condutores
ON (condutores.id = locacoes.condutor_id)
LEFT JOIN
tipo_locacao
ON (locacoes.tipo_locacao = tipo_locacao.id)"></asp:SqlDataSource>
    </form>
</asp:Content>
