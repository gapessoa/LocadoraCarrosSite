<%@ Page Title="" Language="C#" MasterPageFile="~/Master/theMaster.Master" AutoEventWireup="true" CodeBehind="CadastrarVeiculo.aspx.cs" Inherits="LocadoraCarrosSite.CadastrarVeiculo" %>

<%@ Register Src="~/UserControls/SelectMarca.ascx" TagPrefix="listMarcas" TagName="ListarMarcas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="server">
    <div class="page-header ">
        <h1>Cadastrar Veículo</h1>
    </div>
    <form id="form1" runat="server" class="form-horizontal col-md-8" role="form">
        <asp:Panel class="alert alert-success" runat="server" ID="txtResp" Visible="False"></asp:Panel>


        <div class="form-group">
            <div class="col-sm-4">
                <img src="img/333f4ba8afe56af2.png" class="img-rounded" id="theImage" runat="server" width="217" height="248" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-8">
                <asp:Label ID="lblFileUploadControl" runat="server" Text="Escolha uma imagem"></asp:Label>
                <asp:FileUpload ID="FileUploadControl" runat="server" CssClass="form-control" />
                <asp:HiddenField ID="hiddenFilename" runat="server" Value="" />
                <hr />
                <asp:Button ID="Button2" runat="server" Text="Efetuar Upload" CssClass="btn btn-lg btn-warning" OnClick="Button2_Click" CausesValidation="False" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-8">
                <asp:Label ID="lblNome" runat="server" Text="Nome"></asp:Label>
                <asp:TextBox ID="txtNome" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Este campo é obrigatório." ControlToValidate="txtNome"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-8">
                <asp:Label ID="lblMarca" runat="server" Text="Marca"></asp:Label>
                <listMarcas:ListarMarcas ID="txtMarca" runat="server" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-8">
                <asp:Label ID="lblAno" runat="server" Text="Ano"></asp:Label>
                <asp:TextBox ID="txtAno" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Este campo é obrigatório." ControlToValidate="txtAno"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-8">
                <asp:Label ID="lblPlaca" runat="server" Text="Placa"></asp:Label>
                <asp:TextBox ID="txtPlaca" runat="server" CssClass="form-control" MaxLength="8"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Este campo é obrigatório." ControlToValidate="txtPlaca"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-8">
                <asp:Label ID="lblChassi" runat="server" Text="Chassi"></asp:Label>
                <asp:TextBox ID="txtChassi" runat="server" CssClass="form-control" MaxLength="17"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Este campo é obrigatório." ControlToValidate="txtChassi"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-8">
                <asp:Label ID="lblCor" runat="server" Text="Cor"></asp:Label>
                <asp:TextBox ID="txtCor" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Este campo é obrigatório." ControlToValidate="txtCor"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-8">
                <asp:Label ID="lblKm" runat="server" Text="Kilometragem"></asp:Label>
                <asp:TextBox ID="txtKm" runat="server" CssClass="form-control" MaxLength="10"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Este campo é obrigatório." ControlToValidate="txtKm"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-8">
                <asp:Label ID="lblModelo" runat="server" Text="Modelo"></asp:Label>
                <asp:TextBox ID="txtModelo" runat="server" CssClass="form-control" MaxLength="100"></asp:TextBox>
                <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Este campo é obrigatório." ControlToValidate="txtModelo"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-4">
                <asp:Label ID="lblCombustivel" runat="server" Text="Combustível"></asp:Label>
                <asp:DropDownList ID="txtCombustivel" runat="server" CssClass="form-control">
                    <asp:ListItem Value="1">Gasolina</asp:ListItem>
                    <asp:ListItem Value="2">Álcool</asp:ListItem>
                    <asp:ListItem Value="3">Flex</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <asp:Button ID="Button1" runat="server" Text="Cadastrar" CssClass="btn btn-lg btn-primary" OnClick="Button1_Click" />
    </form>
</asp:Content>
