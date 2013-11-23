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
    public partial class CadastrarCondutor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
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
            conn.InsertItem("cnh_registro", txtCNH.Text);
            conn.InsertItem("cnh_data_expedicao", Convert.ToDateTime(txtCNHDataExpedicao.Text).ToString("yyyy-mm-dd"));
            conn.InsertItem("cnh_data_primeira_habilitacao", txtPrimeiraHabilitacao.Text);
            conn.InsertItem("cnh_vencimento", txtCNHVencimento.Text);

            conn.Insert("condutores");

            HtmlGenericControl newControl = new HtmlGenericControl("div");
            //newControl.ID = "NEWControl" + Index;
            newControl.InnerHtml = "Você adicionou o condutor <b>" + txtNome.Text + "</b> com êxito.";

            txtResp.Controls.Add(newControl);

            txtResp.Visible = true;
            txtNome.Text = null;
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
    }
}