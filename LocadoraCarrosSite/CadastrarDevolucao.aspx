<%@ Page Title="" Language="C#" MasterPageFile="~/Master/theMaster.Master" AutoEventWireup="true" CodeBehind="CadastrarDevolucao.aspx.cs" Inherits="LocadoraCarrosSite.CadastrarDevolucao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="server">
    <div class="page-header ">
        <h1>Cadastrar Devolução</h1>
    </div>
    <form id="form1" runat="server" class="form-horizontal col-md-8" role="form">
        <asp:Panel runat="server" ID="txtResp" Visible="False"></asp:Panel>

        <div class="panel panel-danger">
            <div class="panel-heading">
                <h3 class="panel-title"><b>Dados da Devolução</b> </h3>
            </div>

            <div class="panel-body">
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblDevolucao" runat="server" Text="Data de Devolução"></asp:Label>
                        <asp:TextBox ID="txtDataDevolucao" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator8" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtDataDevolucao"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblKmDevolucao" runat="server" Text="KM de Devolução"></asp:Label>
                        <asp:TextBox ID="txtKmDevolucao" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtKmDevolucao"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblToTal" runat="server" Text="Valor Total a Pagar"></asp:Label>
                        <asp:TextBox ID="txtTotal" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator9" runat="server" ErrorMessage="Campo obrigatório. Faça o cálculo antes de efetuar o registro." ControlToValidate="txtTotal"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <asp:Button ID="Button2" runat="server" Text="Calcular" CssClass="btn btn-lg btn-success" OnClick="Calcular_Click" CausesValidation="False" />
            </div>
        </div>

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><b>Dados da Locação:</b> </h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblDataDeReserva" runat="server" Text="Data de Reserva"></asp:Label>
                        <asp:TextBox ID="txtDataReserva" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator13" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtDataReserva"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblTipoDeLocacao" runat="server" Text="Tipo de Locação"></asp:Label>
                        <asp:TextBox ID="txtTipo" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblFranquiaDia" runat="server" Text="Franquia Dia"></asp:Label>
                        <asp:TextBox ID="txtFranquiaDia" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtFranquiaDia"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblDiariasPrevistas" runat="server" Text="Diárias Previstas"></asp:Label>
                        <asp:TextBox ID="txtDiariasPrevistas" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtDiariasPrevistas"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblDestino" runat="server" Text="Destino"></asp:Label>
                        <asp:TextBox ID="txtDestino" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtDestino"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblDataSaida" runat="server" Text="Data de Saída"></asp:Label>
                        <asp:TextBox ID="txtDataSaida" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtDataSaida"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblKmSaida" runat="server" Text="KM de Saída"></asp:Label>
                        <asp:TextBox ID="txtKmSaida" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator5" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtKMSaida"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
        </div>

        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><b>Dados do Contrato</b></h3>
            </div>

            <div class="panel-body">
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblDataContrato" runat="server" Text="Data do Contrato"></asp:Label>
                        <asp:TextBox ID="txtDataContrato" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" ID="RequiredFieldValidator6" runat="server" ErrorMessage="Campo obrigatório." ControlToValidate="txtDataContrato"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblLocatario" runat="server" Text="Locatário"></asp:Label>
                        <asp:TextBox ID="txtLocatario" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblCondutor" runat="server" Text="Condutor"></asp:Label>
                        <asp:TextBox ID="txtCondutor" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="lblVeiculoEscolhido" runat="server" Text="Veículo Escolhido"></asp:Label>
                        <asp:TextBox ID="txtVeiculo" runat="server" CssClass="form-control" ReadOnly="True"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
        <asp:Button ID="Button1" runat="server" Text="Cadastrar" CssClass="btn btn-lg btn-primary" OnClick="Button1_Click" />
    </form>
</asp:Content>
