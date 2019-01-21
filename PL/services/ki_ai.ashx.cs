using BLL;
using DAL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PL.services
{
    /// <summary>
    /// Summary description for ki_ai
    /// </summary>
    public class ki_ai : IHttpHandler
    {
        ilanBll ilanBll = new ilanBll();
        kullaniciBll kullanicib = new kullaniciBll();
        magazaBll magazab = new magazaBll();
        odemeBll odemeb=new odemeBll();
        magazaKategoriBll magazaKatb = new magazaKategoriBll();
        projelerBll projeb = new projelerBll();
        firmalarBll firmab = new firmalarBll();

        public void ProcessRequest(HttpContext context)
        {

            string data = context.Request.QueryString["data"];

            if (!String.IsNullOrEmpty(data))
            {
                if (data == "filterdata")
                {
                    giveMeFilterData(context);
                }
                else if (data == "storedata")
                {
                    giveMeStoreInfo(context);
                }
                else if(data=="userdata")
                {
                    giveMeUserPermission(context);
                }
                else if(data== "classifiedlist")
                {
                    giveMeClasisifedInfo(context);
                }
                else if(data=="paymentdata")
                {
                    giveMePaymentInfo(context);
                }
                else if (data == "adsdata")
                {
                    giveMeAdsInfo(context);
                }
                else if (data == "packagedata")
                {
                    giveMePackagePricing(context);
                }

                else if (data == "projectlist")
                {
                    giveMeProjectInfo(context);
                }

                else if (data == "companylist")
                {
                    giveMeCompanyInfo(context);
                }
            }

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        //public void giveMeShowcasePricing(HttpContext context)
        //{
        //    string[] strlst = null;
        //    strlst = context.Request.Params.AllKeys;
        //    string secho = context.Request.Params.Get("sEcho");
        //    int i = Convert.ToInt32(context.Request.Params.Get("iDisplayStart"));
        //    int icount = Convert.ToInt32(context.Request.Params.Get("iDisplayLength"));
        //    string search = context.Request.Params.Get("sSearch");

        //    var _data = dopingKatb.getDopingCategorisJDatatables(i, icount, search, secho);

        //    string str = JsonConvert.SerializeObject(_data);
        //    context.Response.Clear();
        //    context.Response.ContentType = "application/json";
        //    context.Response.Write(str);
        //}

        public void giveMePaymentInfo(HttpContext context)
        {
            string[] strlst = null;
            strlst = context.Request.Params.AllKeys;
            string secho = context.Request.Params.Get("sEcho");
            int i = Convert.ToInt32(context.Request.Params.Get("iDisplayStart"));
            int icount = Convert.ToInt32(context.Request.Params.Get("iDisplayLength"));
            string search = context.Request.Params.Get("sSearch");

            var _data = odemeb.select(i, icount, search, secho);

            string str = JsonConvert.SerializeObject(_data);
            context.Response.Clear();
            context.Response.ContentType = "application/json";
            context.Response.Write(str);
        }

        public void giveMeStoreInfo(HttpContext context)
        {
            string[] strlst = null;
            strlst = context.Request.Params.AllKeys;
            string secho = context.Request.Params.Get("sEcho");
            int i = Convert.ToInt32(context.Request.Params.Get("iDisplayStart"));
            int icount = Convert.ToInt32(context.Request.Params.Get("iDisplayLength"));
            string search = context.Request.Params.Get("sSearch");
            bool income = false;
            //income = bool.Parse(context.Request.Params.Get("_income"));
            income=Convert.ToBoolean(Convert.ToInt32(context.Request.Params.Get("_income")));


            var _data = magazab.select(i, icount, income, search, secho);

            string str = JsonConvert.SerializeObject(_data);
            context.Response.Clear();
            context.Response.ContentType = "application/json";
            context.Response.Write(str);
        }

        public void giveMeClasisifedInfo(HttpContext context)
        {

            int outok=0;
            bool outdlt = false, outsale = false;
            string[] strlst = null;
            strlst = context.Request.Params.AllKeys;
            string secho = context.Request.Params.Get("sEcho");
            int i = Convert.ToInt32(context.Request.Params.Get("iDisplayStart"));
            int icount = Convert.ToInt32(context.Request.Params.Get("iDisplayLength"));
            string search = context.Request.Params.Get("sSearch");
            int income;
            //income = bool.Parse(context.Request.Params.Get("_income"));
            income = Convert.ToInt32(context.Request.Params.Get("_income"));
            
            if(income==1)
            {
                outok = 1;
                outsale = false;
                outdlt = false;
            }
            else if (income == 2)
            {
                outok = 0;
                outsale = false;
                outdlt = false;
            }
            else if (income == 3)
            {
                outok = 2;
                outsale = false;
                outdlt = false;
            }
            else if (income==4)
            {
                outok = 3;
                outsale = false;
                outdlt = false;
            }
            else if (income == 5)
            {
                outok = 1;
                outsale = true;
                outdlt = false;
            }
            else if(income==6)
            {
                outok = 1;
                outsale = false;
                outdlt = false;
            }


            var _data = ilanBll.getAdminListAds(i, icount, outok, outdlt, outsale, search, secho, income);

            string str = JsonConvert.SerializeObject(_data);
            context.Response.Clear();
            context.Response.ContentType = "application/json";
            context.Response.Write(str);
        }



        public void giveMeProjectInfo(HttpContext context)
        {

            bool outok = false;
            bool outdlt = false, outsale = false;
            string[] strlst = null;
            strlst = context.Request.Params.AllKeys;
            string secho = context.Request.Params.Get("sEcho");
            int i = Convert.ToInt32(context.Request.Params.Get("iDisplayStart"));
            int icount = Convert.ToInt32(context.Request.Params.Get("iDisplayLength"));
            string search = context.Request.Params.Get("sSearch");
            int income;
            income = Convert.ToInt32(context.Request.Params.Get("_income"));

            if (income == 1)
            {
                outok = true;
                outsale = false;
                outdlt = false;
            }
            else if (income == 2)
            {
                outok = false;
                outsale = false;
                outdlt = false;
            }

            try
            {
                var _data = projeb.list(i, icount, outok, outdlt, outsale, search, secho, income);
                string str = JsonConvert.SerializeObject(_data);
                context.Response.Clear();
                context.Response.ContentType = "application/json";
                context.Response.Write(str);

            }
            catch (Exception ex)
            {

                throw;
            }

          
        }

        public void giveMeCompanyInfo(HttpContext context)
        {

            string[] strlst = null;
            strlst = context.Request.Params.AllKeys;
            string secho = context.Request.Params.Get("sEcho");
            int i = Convert.ToInt32(context.Request.Params.Get("iDisplayStart"));
            int icount = Convert.ToInt32(context.Request.Params.Get("iDisplayLength"));
            string search = context.Request.Params.Get("sSearch");
            int income;
            //income = bool.Parse(context.Request.Params.Get("_income"));
            income = Convert.ToInt32(context.Request.Params.Get("_income"));


            var _data = firmab.getCompaniesJDatatables(i, icount, search, secho, income);

            string str = JsonConvert.SerializeObject(_data);
            context.Response.Clear();
            context.Response.ContentType = "application/json";
            context.Response.Write(str);
        }

        public void giveMeUserPermission(HttpContext context)
        {
            string[] strlst = null;
            strlst = context.Request.Params.AllKeys;
            string secho = context.Request.Params.Get("sEcho");
            int i = Convert.ToInt32(context.Request.Params.Get("iDisplayStart"));
            int icount = Convert.ToInt32(context.Request.Params.Get("iDisplayLength"));
            string search = context.Request.Params.Get("sSearch");
            int income = Convert.ToInt32(context.Request.Params.Get("_income"));

            var _data = kullanicib.getUsersJDatatables(i, icount, income, search, secho);

            string str = JsonConvert.SerializeObject(_data);
            context.Response.Clear();
            context.Response.ContentType = "application/json";
            context.Response.Write(str);
        }

        public void giveMeFilterData(HttpContext context)
        {
            try
            {
                string[] strlst = null;
                strlst = context.Request.Params.AllKeys;
                string secho = context.Request.Params.Get("sEcho");
                int i = Convert.ToInt32(context.Request.Params.Get("iDisplayStart"));
                int icount = Convert.ToInt32(context.Request.Params.Get("iDisplayLength"));
                string search = context.Request.Params.Get("sSearch");
                int[] _income = JsonConvert.DeserializeObject<int[]>(context.Request.Params.Get("_incomestr"));
                var _intext = JsonConvert.DeserializeObject<BLL.ExternalClass.jsonintextDataType>(context.Request.Params.Get("_intextstr"));
                string _inads = context.Request.Params.Get("_inadsno");
                string daterange = context.Request.Params.Get("_indaterange");

                var _data = ilanBll.getAdminMultipleFilterAds(i, icount, _income, _intext, _inads, secho, daterange);
                string str = JsonConvert.SerializeObject(_data);
                context.Response.Clear();
                context.Response.ContentType = "application/json";
                context.Response.Write(str);
            }
            catch (Exception ex)
            {
                ex.ToString();
            }


        }

        public void giveMeAdsInfo(HttpContext context)
        {
            //string[] strlst = null;
            //strlst = context.Request.Params.AllKeys;
            //string secho = context.Request.Params.Get("sEcho");
            //int i = Convert.ToInt32(context.Request.Params.Get("iDisplayStart"));
            //int icount = Convert.ToInt32(context.Request.Params.Get("iDisplayLength"));
            //string search = context.Request.Params.Get("sSearch");
            //bool income = false;
            ////income = bool.Parse(context.Request.Params.Get("_income"));
            //income = Convert.ToBoolean(Convert.ToInt32(context.Request.Params.Get("_income")));


            //var _data = verilenReklamb.select(i, icount, income, search, secho);

            //string str = JsonConvert.SerializeObject(_data);
            //context.Response.Clear();
            //context.Response.ContentType = "application/json";
            //context.Response.Write(str);
        }

        public void giveMePackagePricing(HttpContext context)
        {
            string[] strlst = null;
            strlst = context.Request.Params.AllKeys;
            string secho = context.Request.Params.Get("sEcho");
            int i = Convert.ToInt32(context.Request.Params.Get("iDisplayStart"));
            int icount = Convert.ToInt32(context.Request.Params.Get("iDisplayLength"));
            string search = context.Request.Params.Get("sSearch");

            var _data = magazaKatb.select(i, icount, search, secho);

            string str = JsonConvert.SerializeObject(_data);
            context.Response.Clear();
            context.Response.ContentType = "application/json";
            context.Response.Write(str);
        }

    }
}