<%@ Page Title="" Language="C#" MasterPageFile="~/Master/theMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LocadoraCarrosSite.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent" runat="server">

    <hr />

    <div class="jumbotron">
        <div class="container">
            <h1>Sistema de Locação de Veículos</h1>
            <p>Este é um sistema desenvolvido para apresentação do PIM / Semestre 3</p>
            <p><a class="btn btn-primary btn-lg" role="button">Saiba Mais</a></p>
        </div>
    </div>

    <div class="container">
        <!-- Example row of columns -->
        <div class="row">
            <div class="col-md-4">
                <h2>Cadastro de Locatários</h2>
                <p>Faça o cadastro do locatário, podendo ele ser pessoa física ou jurídica.</p>
                <p><a class="btn btn-warning" href="../CadastrarLocatario.aspx" role="button">Acessar &raquo;</a></p>
            </div>
            <div class="col-md-4">
                <h2>Cadastro de Condutores</h2>
                <p>Faça o cadastro do condutor, bem como os dados de sua CNH.</p>
                <p><a class="btn btn-info" href="../CadastrarCondutor.aspx" role="button">Acessar &raquo;</a></p>
            </div>
            <div class="col-md-4">
                <h2>Cadastro de Locações</h2>
                <p>Registre uma locação, depois registre sua devolução. O custo final será gerado aqui.</p>
                <p><a class="btn btn-success" href="../CadastrarLocacao.aspx" role="button">Acessar &raquo;</a></p>
            </div>
        </div>
</asp:Content>
