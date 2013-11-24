using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;

namespace LocadoraCarrosSite
{
    public partial class CadastrarLocatario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (txtTipo.SelectedValue == "0")
            {
                this.cadastraPessoaFisica();
            }
            else
            {
                this.cadastraPessoaJuridica();
            }

            HtmlGenericControl newControl = new HtmlGenericControl("div");
            //newControl.ID = "NEWControl" + Index;
            newControl.InnerHtml = "Você adicionou o condutor <b>" + txtNome.Text + "</b> com êxito.";

            txtResp.Controls.Add(newControl);

            txtResp.Visible = true;
            txtNome.Text = null;
            txtCPF.Text = null;
            txtLogradouro.Text = null;
            txtBairro.Text = null;
            txtCidade.SelectedIndex = -1;
            txtEstado.SelectedIndex = -1;
            txtCEP.Text = null;
            txtComplemento.Text = null;
            txtTipo.SelectedIndex = -1;
        }

        protected void txtEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            var uf = txtEstado.SelectedValue;
            List<string> cidadesDoEstado = new List<string>();

            theConn conn = new theConn();

            var cidades = conn.Select("SELECT nome FROM cidades WHERE uf = '" + uf + "'");

            foreach (var cidade in cidades)
            {
                cidadesDoEstado.Add(cidade["nome"].ToString());
            }

            txtCidade.DataSource = cidadesDoEstado;
            txtCidade.DataBind();

        }

        protected void txtTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            var tipo = txtTipo.SelectedValue;

            if (tipo == "0")
            {
                lblCPF.Text = "CPF";
                lblNome.Text = "Nome";
                lblRG.Text = "RG";
            }
            else
            {
                lblCPF.Text = "CNPJ";
                lblNome.Text = "Razão Social";
                lblRG.Text = "Nome Fantasia";
            }
        }

        private void cadastraPessoaFisica()
        {
            theConn conn = new theConn();

            conn.InsertItem("nome", txtNome.Text);
            conn.InsertItem("cpf", txtCPF.Text);
            conn.InsertItem("rg", txtRG.Text);
            conn.InsertItem("email", txtEmail.Text);
            conn.InsertItem("logradouro", txtLogradouro.Text);
            conn.InsertItem("bairro", txtBairro.Text);
            conn.InsertItem("cidade", txtCidade.SelectedValue);
            conn.InsertItem("estado", txtEstado.SelectedValue);
            conn.InsertItem("cep", txtCEP.Text);
            conn.InsertItem("complemento", txtComplemento.Text);
            conn.InsertItem("tipo", "0");

            conn.Insert("locatarios");
        }

        private void cadastraPessoaJuridica()
        {
            theConn conn = new theConn();

            conn.InsertItem("nome", txtNome.Text);
            conn.InsertItem("cnpj", txtCPF.Text);
            conn.InsertItem("nome_fantasia", txtRG.Text);
            conn.InsertItem("email", txtEmail.Text);
            conn.InsertItem("logradouro", txtLogradouro.Text);
            conn.InsertItem("bairro", txtBairro.Text);
            conn.InsertItem("cidade", txtCidade.SelectedValue);
            conn.InsertItem("estado", txtEstado.SelectedValue);
            conn.InsertItem("cep", txtCEP.Text);
            conn.InsertItem("complemento", txtComplemento.Text);
            conn.InsertItem("tipo", "1");

            conn.Insert("locatarios");
        }

    }
}