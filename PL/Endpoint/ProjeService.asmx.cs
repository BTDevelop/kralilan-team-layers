﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using BLL.Concrete;
using DAL.Concrete.LINQ;
using KralilanProject.Entities;
using KralilanProject.Interfaces;
using Newtonsoft.Json;

namespace PL.Endpoint
{
    /// <summary>
    /// Summary description for ProjeService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class ProjeService : System.Web.Services.WebService
    {
        private IProjeService _projeManager = new ProjeManager(new LTSProjelerDal());

        [WebMethod]
        public string CountAllByRegionId()
        {
            return JsonConvert.SerializeObject(_projeManager.CountAllByRegionId());
        }
    }
}
