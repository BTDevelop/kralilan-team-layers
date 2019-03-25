using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PL
{
    public partial class ucretsiz_ilan_ver : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MetaDescription =
                "Ücretsiz ilan ver, Sahibinden ücretsiz ilan ver. Sitemizde Satılık kiralık devren ilanlarınızı; daire işyeri arsa ve tüm emlak kategorilerinde verebilirsiniz.";
            MetaKeywords = "ücretsiz, ilan, ver, sahibinden, emlak, bedava, ekle, gayrimenkul";
        }
    }
}