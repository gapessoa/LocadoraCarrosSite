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

            conn.InsertItem("nome", nome);
            conn.InsertItem("placa", placa);
            conn.InsertItem("chassi", chassi);
            conn.InsertItem("cor", cor);
            conn.InsertItem("modelo", modelo);
            conn.InsertItem("ano", ano);
            conn.InsertItem("marca_id", marca);
            conn.InsertItem("tipo_combustivel", combustivel);
            conn.InsertItem("km", km);

            conn.Insert("veiculos");

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