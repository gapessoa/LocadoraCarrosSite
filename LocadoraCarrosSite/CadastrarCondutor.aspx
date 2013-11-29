<%@ Page Title="" Language="C#" MasterPageFile="~/Master/theMaster.Master" AutoEventWireup="true" CodeBehind="CadastrarCondutor.aspx.cs" Inherits="LocadoraCarrosSite.CadastrarCondutor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="server">
    <div class="page-header ">
        <h1>Cadastrar Condutor</h1>
    </div>
    <form id="form1" runat="server" class="form-horizontal col-md-8" role="form">
        <asp:Panel class="alert alert-success" runat="server" ID="txtResp" Visible="False"></asp:Panel>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><b>Dados Pessoais:</b> </h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblNome" runat="server" Text="Nome"></asp:Label>
                        <asp:TextBox ID="txtNome" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtNome"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblCPF" runat="server" Text="CPF"></asp:Label>
                        <asp:TextBox ID="txtCPF" runat="server" CssClass="form-control" CausesValidation="True"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtCPF"></asp:RequiredFieldValidator>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblRG" runat="server" Text="RG"></asp:Label>
                        <asp:TextBox ID="txtRG" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtRG"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblEmail" runat="server" Text="E-Mail"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>
        <div class="panel panel-warning">
            <div class="panel-heading">
                <h3 class="panel-title"><b>Endereço:</b> </h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblLogradouro" runat="server" Text="Logradouro"></asp:Label>
                        <asp:TextBox ID="txtLogradouro" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtLogradouro"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblComplemento" runat="server" Text="Complemento"></asp:Label>
                        <asp:TextBox ID="txtComplemento" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtComplemento"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblBairro" runat="server" Text="Bairro"></asp:Label>
                        <asp:TextBox ID="txtBairro" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtBairro"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblEstado" runat="server" Text="Estado"></asp:Label>

                        <asp:DropDownList ID="txtEstado" runat="server" DataSourceID="SqlDataSource1" DataTextField="uf" DataValueField="uf" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="txtEstado_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:locadoraConnectionString %>" ProviderName="<%$ ConnectionStrings:locadoraConnectionString.ProviderName %>" SelectCommand="SELECT uf FROM estados"></asp:SqlDataSource>

                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblCidade" runat="server" Text="Cidade"></asp:Label>
                        
                        <asp:DropDownList ID="txtCidade" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtCidade"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblCEP" runat="server" Text="CEP"></asp:Label>
                        <asp:TextBox ID="txtCEP" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator9" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtCEP"></asp:RequiredFieldValidator>
                    </div>
                    <br />
                </div>

            </div>
        </div>

        <div class="panel panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title"><b>Dados da CNH</b></h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblCNH" runat="server" Text="Número de Registro"></asp:Label>
                        <asp:TextBox ID="txtCNH" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator10" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtCNH"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblCHNDataExperdicao" runat="server" Text="Data de Expedição"></asp:Label>
                        <asp:TextBox ID="txtCNHDataExpedicao" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator11" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtCNHDataExpedicao"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblPrimeiraHabilitacao" runat="server" Text="Data da Primeira Habilitação"></asp:Label>
                        <asp:TextBox ID="txtPrimeiraHabilitacao" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator12" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtPrimeiraHabilitacao"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblCNHVencimento" runat="server" Text="Vencimento"></asp:Label>
                        <asp:TextBox ID="txtCNHVencimento" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator13" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtCNHVencimento"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Cadastrar" CssClass="btn btn-lg btn-primary" OnClick="Button1_Click" />
    </form>
</asp:Content>
