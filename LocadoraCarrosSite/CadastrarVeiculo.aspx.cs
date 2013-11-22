using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace LocadoraCarrosSite
{
    public partial class CadastrarVeiculo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            theConn conn = new theConn();

            var nome = txtNome.Text;
            var chassi = txtChassi.Text;
            var cor = txtCor.Text;
            var marca = this.txtMarca.cp_marcas;
            var modelo = txtModelo.Text;
            var combustivel = txtCombustivel.SelectedItem.Value;
            var placa = txtPlaca.Text;
            var ano = txtAno.Text;
            var km = txtKm.Text;

            conn.Cmd("INSERT INTO veiculos (nome, placa, chassi, cor, modelo, ano, marca_id, tipo_combustivel,km) VALUES ('" + nome + "','" + placa + "','" + chassi + "','" + cor + "','" + modelo + "','" + ano + "'," + marca + "," + combustivel +"," + km + ")");

            HtmlGenericControl newControl = new HtmlGenericControl("div");
            //newControl.ID = "NEWControl" + Index;
            newControl.InnerHtml = "Você adicionou o veículo <b>" + txtNome.Text + "</b> com êxito.";

            txtResp.Controls.Add(newControl);

            txtResp.Visible = true;
            txtNome.Text = null;

            txtNome.Text = null;
            txtChassi.Text = null;
            txtCor.Text = null;
            txtModelo.Text = null;
            txtPlaca.Text = null;
            txtAno.Text = null;
            txtKm.Text = null;
            txtCombustivel.SelectedIndex = -1;
        }
    }
}