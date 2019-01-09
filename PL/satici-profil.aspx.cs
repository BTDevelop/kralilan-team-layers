﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using BLL.Concrete;
using DAL;
using DAL.Concrete.LINQ;
using KralilanProject.Interfaces;

namespace PL
{
    public partial class satici_profil : System.Web.UI.Page
    {

        ilanBll ilanb = new ilanBll();
        telefonBll telefonb = new telefonBll();
        kullaniciTakipciBll kullaniciTkpb = new kullaniciTakipciBll();
        magazaBll magazab = new magazaBll();
        magazaTelefonBll magazaTlfb = new magazaTelefonBll();
        magazaKullaniciBll magazaKllb = new magazaKullaniciBll();
        magazaTakipciBll magazaTakipb = new magazaTakipciBll();
        seciliDopingBll seciliDopingb = new seciliDopingBll();
        kullaniciBll kullanicib = new kullaniciBll();

        public int sellerProfilId, userFollowerCount = 0, userFollowedCount = 0, userClassifiedCount = 0, userid = 0;
        public string thmbUserProfile, userName;
        public int ctrlFollow;

        private IKullaniciTakipService _kullaniciTakipManager;
        private IKullaniciService _kullaniciManager;
        public satici_profil()
        {
            _kullaniciTakipManager = new KullaniciTakipManager(new LTSKullaniciTakipcilerDal());
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            sellerProfilId = Convert.ToInt32(RouteData.Values["SaticiNo"]);
            DAL.kullanici _kullanici = _kullaniciManager.Get(sellerProfilId);
            Page.Title = _kullanici.kullaniciAdSoyad + " satılık kiralık emlak ilanları kral ilan ‘da";
            Page.MetaDescription = _kullanici.kullaniciAdSoyad + " satılık daire kiralık ev işyeri arsa ve tüm emlak ilanları ile iletişim bilgileri kral ilan ‘da";
            Page.MetaKeywords = (_kullanici.kullaniciAdSoyad + " satılık daire kiralık ev işyeri arsa ve tüm emlak ilanları ile iletişim bilgileri kral ilan ‘da").Replace(' ', ',');


            userName = _kullanici.kullaniciAdSoyad;

            if (!String.IsNullOrEmpty(_kullanici.profilResim))
            {
                thmbUserProfile = "profil/" + _kullanici.profilResim;
            }
            else
            {
                thmbUserProfile = "default-images/no-user.jpg";
            }

            _kullanici = kullaniciBll.getUsersBlock();

            if(_kullanici!=null)
            { 
                if (_kullaniciTakipManager.GetUserFollowerId(sellerProfilId, _kullanici.kullaniciId) != null)
                {
                    ctrlFollow = 1;
                }
                else
                {
                    ctrlFollow = 0;
                }

                userFollowerCount = _kullaniciTakipManager.CountFollower(sellerProfilId);
                userFollowedCount = _kullaniciTakipManager.CountFollowed(sellerProfilId);
                userClassifiedCount = kullanicib.countAdsByUserId(sellerProfilId);
                rpuserfollower.DataSource = _kullaniciTakipManager.GetFollowed(_kullanici.kullaniciId);
                rpuserfollower.DataBind();
                rpuserfollowed.DataSource = _kullaniciTakipManager.GetFollower(_kullanici.kullaniciId);
                rpuserfollowed.DataBind();
            }       
        }
    }
}