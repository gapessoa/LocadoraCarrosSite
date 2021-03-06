﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master/theMaster.Master" AutoEventWireup="true" CodeBehind="ListarMarcas.aspx.cs" Inherits="LocadoraCarrosSite.ListarMarcas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="server">
    <form id="form1" runat="server">
        <div class="page-header ">
            <h1>Marcas Disponíveis</h1>
        </div>
        <div class="table-responsive">
            <asp:GridView ID="GridView1" class="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="MysqlLocadora" AllowPaging="True" AllowSorting="True">
                <PagerSettings Mode="NumericFirstLast" FirstPageText="First" PreviousPageText="Previous" NextPageText="Next" LastPageText="Last" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                    <asp:TemplateField HeaderText="Marca" SortExpression="Marca">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Marca") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Marca") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" HeaderText="Editar" ShowCancelButton="False" ShowEditButton="True" ShowHeader="True" ControlStyle-CssClass="btn btn-info" EditText="Editar" UpdateText="Registrar">
                        <ControlStyle CssClass="btn btn-info"></ControlStyle>
                    </asp:CommandField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Você realmente deseja deletar este item?')"/>
                        </ItemTemplate>
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <asp:SqlDataSource ID="MysqlLocadora" runat="server" ConnectionString="<%$ ConnectionStrings:locadoraConnectionString %>" ProviderName="<%$ ConnectionStrings:locadoraConnectionString.ProviderName %>" SelectCommand="SELECT id as ID, nome as Marca FROM veiculo_marcas" DeleteCommand="DELETE FROM veiculo_marcas WHERE id=@ID" UpdateCommand="UPDATE veiculo_marcas SET nome = @Marca WHERE id=@ID"></asp:SqlDataSource>
    </form>
</asp:Content>
