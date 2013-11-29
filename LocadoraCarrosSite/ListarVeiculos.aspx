<%@ Page Title="" Language="C#" MasterPageFile="~/Master/theMaster.Master" AutoEventWireup="true" CodeBehind="ListarVeiculos.aspx.cs" Inherits="LocadoraCarrosSite.ListarVeiculos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="server">
    <form id="form1" runat="server">
        <div class="page-header ">
            <h1>Veículos Disponíveis</h1>
        </div>
        <div class="table-responsive">
            <asp:GridView ID="GridView1" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="MysqlLocadora" AllowPaging="True" AllowSorting="True">
                <PagerSettings Mode="NumericFirstLast" FirstPageText="First" PreviousPageText="Previous" NextPageText="Next" LastPageText="Last" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
                    <asp:BoundField DataField="Marca" HeaderText="Marca" SortExpression="Marca" />
                    <asp:BoundField DataField="Placa" HeaderText="Placa" SortExpression="Placa" />
                    <asp:BoundField DataField="Chassi" HeaderText="Chassi" SortExpression="Chassi" />
                    <asp:BoundField DataField="Cor" HeaderText="Cor" SortExpression="Cor" />
                    <asp:BoundField DataField="Modelo" HeaderText="Modelo" SortExpression="Modelo" />
                    <asp:BoundField DataField="Ano" HeaderText="Ano" SortExpression="Ano" />
                    <asp:BoundField DataField="Kilometragem" HeaderText="Kilometragem" SortExpression="Kilometragem" />
                    <asp:BoundField DataField="Combustivel" HeaderText="Combustível" SortExpression="Combustivel" />
                    <asp:TemplateField HeaderText="Deletar">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Você realmente deseja deletar este item?')"/>
                        </ItemTemplate>
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="MysqlLocadora" runat="server" ConnectionString="<%$ ConnectionStrings:locadoraConnectionString %>" ProviderName="<%$ ConnectionStrings:locadoraConnectionString.ProviderName %>" SelectCommand="SELECT veiculos.id as ID, veiculos.nome as Nome, veiculo_marcas.nome as Marca,placa as Placa, chassi as Chassi, cor as Cor, modelo as Modelo, ano as Ano, km as Kilometragem, combustivel.nome as Combustivel FROM veiculos JOIN veiculo_marcas ON (veiculos.marca_id = veiculo_marcas.id) JOIN combustivel ON (combustivel.id = veiculos.tipo_combustivel)" DeleteCommand="DELETE FROM veiculos WHERE id=@ID" UpdateCommand="UPDATE veiculos SET nome = @Nome, placa = @Placa, chassi = @Chassi, cor = @Cor, modelo = @Modelo, km = @Kilometragem, tipo_combustivel = @Combustivel, ano = @Ano WHERE id = @ID"></asp:SqlDataSource>
        </div>
    </form>

</asp:Content>
