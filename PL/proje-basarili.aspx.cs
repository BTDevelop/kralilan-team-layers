using BLL;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PL
{
    public partial class proje_basarili : System.Web.UI.Page
    {
        public int _inproid;
        kullanici _kullanici;
        protected void Page_Load(object sender, EventArgs e)
        {
            _kullanici = kullaniciBll.getUsersBlock();

            int kullaniciId = Convert.ToInt32(_kullanici.kullaniciId);

            if(_kullanici!=null)
            { 
                if (Session["ki-projectregnumeramble"] != null)
                {
                    _inproid = Convert.ToInt32(Session["ki-projectregnumeramble"]);
                }
            }
        }
    }
}