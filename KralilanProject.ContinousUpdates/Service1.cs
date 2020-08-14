using DAL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Net.Sockets;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.ContinousUpdates
{
    public partial class Service1 : ServiceBase
    {
        ilanDataContext idc = new ilanDataContext();
        public Service1()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
        }

        protected override void OnStop()
        {
        }

        private void BankAdsContinousUpdates()
        {
            var storeType = 5;
            var repoBankAds = (from i in idc.ilans.Where(x => x.magaza.magazaTur.turId == storeType && x.silindiMi == false)
                select new
                {
                    i.ilanId,
                    i.girilenOzellik
                }).OrderBy(x => x.ilanId);

            var repoBankAdsList = repoBankAds.Where(x => x.girilenOzellik.Contains("2222")).Take(50).ToList();

            foreach (var VARIABLE in repoBankAdsList)
            {
                
            }

        }                                                              
    }
}
