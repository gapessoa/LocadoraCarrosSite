﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace LocadoraCarrosSite
{
    public partial class CadastrarLocacao : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            theConn conn = new theConn();

            conn.InsertItem("data_reserva", txtDataReserva.Text);
            conn.InsertItem("tipo_locacao", txtTipoLocacao.SelectedValue);
            conn.InsertItem("franquia_dia", txtFranquiaDia.Text);
            conn.InsertItem("diarias_previstas", txtDiariasPrevistas.Text);
            conn.InsertItem("destino", txtDestino.Text);
            conn.InsertItem("data_saida", Convert.ToDateTime(txtDataSaida.Text).ToString("yyyy-MM-dd"));
            conn.InsertItem("km_saida", txtKMSaida.Text);
            conn.InsertItem("data_contrato", Convert.ToDateTime(txtDataContrato.Text).ToString("yyyy-MM-dd"));
            conn.InsertItem("veiculo_id", txtVeiculoEscolhido.SelectedValue);
            conn.InsertItem("locatario_id", txtLocatario.SelectedValue);
            conn.InsertItem("condutor_id", txtCondutor.SelectedValue);

            conn.Insert("locacoes");

            theConn conn2 = new theConn();
            conn2.InsertItem("alugado", "1");
            conn2.Update("veiculos", "id", txtVeiculoEscolhido.SelectedValue.ToString());

            HtmlGenericControl newControl = new HtmlGenericControl("div");
            newControl.InnerHtml = "Você adicionou uma locação com êxito.";

            txtResp.Controls.Add(newControl);

            txtDataReserva.Text = null;
            txtTipoLocacao.SelectedIndex = -1;
            txtFranquiaDia.Text = null;
            txtDiariasPrevistas.Text = null;
            txtDestino.Text = null;
            txtDataSaida.Text = null;
            txtKMSaida.Text = null;
            txtDataContrato.Text = null;
            txtVeiculoEscolhido.SelectedIndex = -1;
            txtLocatario.SelectedIndex = -1;
            txtCondutor.SelectedIndex = -1;

            Response.Redirect("ListarLocacoes.aspx");
        }
    }
}