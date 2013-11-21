using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace LocadoraCarrosSite
{
    public partial class CadastrarMarca : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            theConn conn = new theConn();

            string Index = "TESTE";

            conn.Cmd("INSERT INTO veiculo_marcas (nome) VALUES ('" + txtNome.Text + "')");

            HtmlGenericControl newControl = new HtmlGenericControl("div");
            newControl.ID = "NEWControl" + Index;
            newControl.InnerHtml = "Você adicionou a marca <b>" + txtNome.Text + "</b> com êxito.";

            txtResp.Controls.Add(newControl);

            txtResp.Visible = true;
            txtNome.Text = null;
        }
    }
}