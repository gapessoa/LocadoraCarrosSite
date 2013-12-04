using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace LocadoraCarrosSite
{
    public partial class CadastrarDevolucao : System.Web.UI.Page
    {

        private string veiculo_id;
        private string id;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.id = Request.QueryString["id"].ToString();
            this.load_Locacao();
        }

        private void load_Locacao()
        {
            theConn conn = new theConn();

            var rows = conn.Select("SELECT locacoes.id, DATE_FORMAT(locacoes.data_reserva, '%d/%c/%Y') as data_reserva, tipo_locacao.nome as tipo_locacao, locacoes.franquia_dia, locacoes.diarias_previstas, locacoes.destino, DATE_FORMAT(locacoes.data_saida, '%d/%c/%Y') as data_saida, locacoes.km_saida, DATE_FORMAT(locacoes.data_contrato, '%d/%c/%Y') as data_contrato, condutores.nome as condutor_nome, locatarios.nome as locatario_nome, veiculos.id as veiculo_id, veiculos.nome as veiculo_nome, locacoes.dt_devolucao, locacoes.km_devolucao, locacoes.valor_pago FROM locacoes LEFT JOIN locatarios ON (locatarios.id = locacoes.locatario_id) LEFT JOIN veiculos ON (veiculos.id = locacoes.veiculo_id) LEFT JOIN condutores ON (condutores.id = locacoes.condutor_id) LEFT JOIN tipo_locacao ON (locacoes.tipo_locacao = tipo_locacao.id) WHERE locacoes.id = '" + this.id + "'");

            txtVeiculo.Text = rows[0]["veiculo_nome"].ToString();
            txtLocatario.Text = rows[0]["locatario_nome"].ToString();
            txtCondutor.Text = rows[0]["condutor_nome"].ToString();
            txtDataReserva.Text = Convert.ToDateTime(rows[0]["data_reserva"]).ToString("dd/MM/yyyy");
            txtDataContrato.Text = Convert.ToDateTime(rows[0]["data_contrato"]).ToString("dd/MM/yyyy");
            txtTipo.Text = rows[0]["tipo_locacao"].ToString();
            txtFranquiaDia.Text = rows[0]["franquia_dia"].ToString();
            txtDiariasPrevistas.Text = rows[0]["diarias_previstas"].ToString();
            txtDestino.Text = rows[0]["destino"].ToString();
            txtDataSaida.Text = Convert.ToDateTime(rows[0]["data_saida"]).ToString("dd/MM/yyyy");
            txtKmSaida.Text = rows[0]["km_saida"].ToString();
            this.veiculo_id = rows[0]["veiculo_id"].ToString();
        }

        private bool verifica_Campos()
        {
            try
            {
                if (Convert.ToInt32(txtKmSaida.Text) > Convert.ToInt32(txtKmDevolucao.Text))
                {
                    this.show_msg("<b>O valor do KM de devolução não pode ser menor do que o KM de saída.</b>");
                    return false;

                }
            }
            catch (Exception)
            {
                this.show_msg("<b>Registre o KM de devolução.</b>");
                return false;
            }

            try
            {
                if(Convert.ToDateTime(txtDataDevolucao.Text)  < Convert.ToDateTime(txtDataSaida.Text))
                {
                    this.show_msg("<b>A data de devolução deve ser maior do que a data de saída</b>");
                    return false;
                }
            }
            catch (Exception)
            {
                this.show_msg("<b>Registre a data de devolução.</b>");
                return false;
            }
            return true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (this.verifica_Campos())
            {
                theConn conn = new theConn();

                conn.InsertItem("km_devolucao", txtKmDevolucao.Text);
                conn.InsertItem("dt_devolucao", Convert.ToDateTime(txtDataDevolucao.Text).ToString("yyyy-MM-dd"));
                conn.InsertItem("valor_pago", txtTotal.Text.Replace(",", "."));

                conn.Update("locacoes", "id", this.id);

                theConn conn2 = new theConn();

                conn2.InsertItem("alugado", "0");

                conn2.Update("veiculos", "id", this.veiculo_id);

                Response.Redirect("ListarLocacoes.aspx");
            }
        }

        protected void Calcular_Click(object sender, EventArgs e)
        {
            try
            {
                DateTime saida = Convert.ToDateTime(txtDataSaida.Text);
                DateTime entrada = Convert.ToDateTime(txtDataDevolucao.Text);

                int diasPrevistos = Convert.ToInt32(txtDiariasPrevistas.Text);

                decimal multa = 0;

                int dias = (entrada - saida).Days;

                if (diasPrevistos > dias)
                {
                    multa = 50;
                }

                if (diasPrevistos < dias)
                {
                    int diferencaDias = dias - diasPrevistos;
                    multa = diferencaDias * 50;
                }

                decimal franquia = Convert.ToDecimal(txtFranquiaDia.Text);

                decimal total = (dias * franquia + multa) * 1.00m;

                txtTotal.Text = total.ToString();
            }
            catch (Exception)
            {

                this.show_msg("<b>ERRO:</b>\nDigite uma data válida de devolução.");
            }
        }
        private void show_msg(string msg)
        {
            HtmlGenericControl newControl = new HtmlGenericControl("div");

            newControl.InnerHtml = "<div class='alert alert-danger'>" + msg + "</div>";

            txtResp.Controls.Add(newControl);

            txtResp.Visible = true;
        }
    }
}