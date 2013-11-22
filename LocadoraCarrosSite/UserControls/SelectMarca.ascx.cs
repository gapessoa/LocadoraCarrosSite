using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LocadoraCarrosSite.UserControls
{
    public partial class SelectMarca : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string cp_marcas { get { return cpMarcas.SelectedItem.Value; } }
    }
}