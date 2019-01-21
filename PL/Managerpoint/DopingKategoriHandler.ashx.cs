using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL;
using KralilanProject.Entities;
using Newtonsoft.Json;

namespace PL.Managerpoint
{
    /// <summary>
    /// Summary description for DopingKategoriHandler
    /// </summary>
    public class DopingKategoriHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string Data = context.Request.QueryString["data"];

            if (!String.IsNullOrEmpty(Data))
            {
                if (Data == "GetDopingCategories")
                {
                    GetDopingCategories(context);
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

        public void GetDopingCategories(HttpContext context)
        {
            ilanDataContext idc = new ilanDataContext();;
            string[] strlst = null;
            strlst = context.Request.Params.AllKeys;
            string secho = context.Request.Params.Get("sEcho");
            int i = Convert.ToInt32(context.Request.Params.Get("iDisplayStart"));
            int icount = Convert.ToInt32(context.Request.Params.Get("iDisplayLength"));
            string search = context.Request.Params.Get("sSearch");

            var query = from d in idc.dopingKategoris
                        select new DopingKategori
                        {
                            Id = d.dopingKategoriId,
                            KategoriAdi = d.kategori.kategoriAdi,
                            DopingAdi = d.doping.dopingAdi,
                            Sure = d.dopingSureId + " Haftalık",
                            FiyatNumeric = d.fiyat,
                        };

            if (String.IsNullOrEmpty(search) == false) query = query.Where(x => x.KategoriAdi.IndexOf(search) != -1);

            int totalCount = query.Count();
            int filterCount = query.Count();

            query = query.Skip(i).Take(icount);

            var cmd = new
            {
                draw = secho,
                recordsTotal = totalCount,
                recordsFiltered = filterCount,
                data = query.ToList()
            };

            string str = JsonConvert.SerializeObject(cmd);
            context.Response.Clear();
            context.Response.ContentType = "application/json";
            context.Response.Write(str);
        }
    }
}