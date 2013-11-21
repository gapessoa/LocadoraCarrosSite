<%@ Page Title="" Language="C#" MasterPageFile="~/Master/theMaster.Master" AutoEventWireup="true" CodeBehind="CadastrarMarca.aspx.cs" Inherits="LocadoraCarrosSite.CadastrarMarca" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="server">
    <div class="page-header ">
        <h1>Cadastrar Marca</h1>
    </div>
    
    <form id="form1" runat="server" class="form-horizontal col-md-8" role="form">
        <asp:Panel class ="alert alert-success" runat="server" ID="txtResp" Visible="False"></asp:Panel>
        <div class="form-group">
            <div class="col-sm-8">
                <asp:Label ID="Label1" runat="server" Text="Digite o nome da Marca"></asp:Label>
                <asp:TextBox ID="txtNome" runat="server"  class="form-control"></asp:TextBox>
            </div>
        </div>
        
        <asp:Button ID="Button1" runat="server" Text="Cadastrar" class="btn btn-lg btn-primary" OnClick="Button1_Click" />
    </form>

</asp:Content>
