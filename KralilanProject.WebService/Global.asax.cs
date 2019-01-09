using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using BLL.Concrete;
using KralilanProject.Interfaces;
using DAL.Abstract;
using DAL.Concrete.LINQ;
using KralilanProject.BLL.Concrete;

namespace KralilanProject.WebService
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {

            //var container = this.AddUnity();
            //container.RegisterType<IBildirimService, BildirimManager>();
            //container.RegisterType<IBildirimlerDal, LTSBildirimlerDal>();
            //container.RegisterType<IIlanSayiService, IlanSayiManager>();
            //container.RegisterType<IIlanSayilarDal, LTSIlanSayilarDal>();

        }
    }
}