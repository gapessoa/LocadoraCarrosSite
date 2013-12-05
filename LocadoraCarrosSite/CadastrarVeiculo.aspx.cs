using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Drawing.Imaging;

namespace LocadoraCarrosSite
{
    public partial class CadastrarVeiculo : System.Web.UI.Page
    {
        private string privatePath = @"C:\Users\Gabriel\Documents\GitHub\LocadoraCarrosDesktop\LocadoraCarrosDesktop\Img\";

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
            conn.InsertItem("imgfile", hiddenFilename.Value.ToString());

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

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (FileUploadControl.HasFile)
            {
                try
                {
                    string filename = System.IO.Path.GetFileName(FileUploadControl.FileName);

                    string getExtension = System.IO.Path.GetExtension(filename);

                    string guid = this.GenerateId();

                    string newName = guid + getExtension;

                    FileUploadControl.SaveAs(Server.MapPath("~/img/") + newName);
                    FileUploadControl.SaveAs(this.privatePath + newName);

                    theImage.Src = "~/img/" + newName;

                    hiddenFilename.Value = newName;

                    //StatusLabel.Text = "Upload status: File uploaded!";
                }
                catch (Exception ex)
                {
                   // StatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                }
            }
        }

        private string GenerateId()
        {
            long i = 1;
            foreach (byte b in Guid.NewGuid().ToByteArray())
            {
                i *= ((int)b + 1);
            }
            return string.Format("{0:x}", i - DateTime.Now.Ticks);
        }
    }
}