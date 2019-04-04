using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using DAL;

namespace KralilanProject.WindowsService
{
    public partial class Service1 : ServiceBase
    {
        private System.Timers.Timer timer;
        private ilanDataContext idc = new ilanDataContext();
        public Service1()
        {
            InitializeComponent();

            this.EventLog.Source = this.ServiceName;
            this.EventLog.Log = "Application";

            timer = new System.Timers.Timer();
            timer.Interval = 1000 * 60;
            //timer.Elapsed += new System.Timers.ElapsedEventHandler(this.OnTimer);
            timer.Start();
        }

        protected override void OnStart(string[] args)
        {
            Task.Run(() => SendSalesAdsUpdater());
        }

        protected override void OnStop()
        {
        }

        private int sendErrorCount = 0;
        private int zeroCount = 0;
        Stopwatch _stopwatch = new Stopwatch();


        private async Task SendSalesAdsUpdater()
        {
            try
            {
                this.EventLog.WriteEntry("SendSalesAdsUpdater START", EventLogEntryType.Information);
                var salesAds = idc.ilans.Where(x => x.silindiMi == false && x.satildiMi == true);
                if (salesAds.Count() > 0)
                {
                    foreach (var item in salesAds.ToList())
                    {
                        ilanSatilan ilan = new ilanSatilan();
                        ilan.ilanId = item.ilanId;
                        if (item.ilanTurId != -1) ilan.ilanTurId = item.ilanTurId;
                        if (item.kategoriId != -1) ilan.kategoriId = item.kategoriId;
                        if (item.fiyat != -1) ilan.fiyat = item.fiyat;
                        if (item.fiyatTurId != -1) ilan.fiyatTurId = item.fiyatTurId;
                        if (item.kullaniciId != -1) ilan.kullaniciId = item.kullaniciId;
                        if (item.magazaId != -1) ilan.magazaId = item.magazaId;
                        if (item.ilId != -1) ilan.ilId = item.ilId;
                        if (item.ilceId != -1) ilan.ilceId = item.ilceId;
                        if (item.mahalleId != -1) ilan.mahalleId = item.mahalleId;
                        if (!String.IsNullOrEmpty(item.baslik)) ilan.baslik = item.baslik;
                        if (!String.IsNullOrEmpty(item.aciklama)) ilan.aciklama = item.aciklama;
                        ilan.baslangicTarihi = DateTime.Now;
                        ilan.bitisTarihi = (DateTime.Now.AddYears(1));
                        if (item.onay != -1) ilan.onay = item.onay;
                        ilan.ziyaretci = 0;
                        ilan.satildiMi = false;
                        ilan.numaraYayinlansinMi = item.numaraYayinlansinMi;
                        if (!String.IsNullOrEmpty(item.koordinat)) ilan.koordinat = item.koordinat;
                        if (!String.IsNullOrEmpty(item.girilenOzellik)) ilan.girilenOzellik = item.girilenOzellik;
                        if (!String.IsNullOrEmpty(item.secilenOzellik)) ilan.secilenOzellik = item.secilenOzellik;
                        if (!String.IsNullOrEmpty(item.resim)) ilan.resim = item.resim;
                        if (item.ilat != -1) ilan.ilat = item.ilat;
                        if (item.ilng != -1) ilan.ilng = item.ilng;
                        idc.ilanSatilans.InsertOnSubmit(ilan);
                        idc.SubmitChanges();

                        var value = idc.ilans.Where(q => q.ilanId == item.ilanId).FirstOrDefault();
                        if (value != null)
                        {
                            idc.ilans.DeleteOnSubmit(value);
                            idc.SubmitChanges();
                        }
                    }

                    this.EventLog.WriteEntry("SendSalesAdsUpdater Will Update Count: " + salesAds.Count(), EventLogEntryType.Information);
                }

                sendErrorCount = 0;
                _stopwatch.Stop();
                var timeElapsed = _stopwatch.Elapsed;

                await Task.Run(() =>
                {
                    var minutes = 1;
                    if (zeroCount >= 5 && zeroCount < 30)
                    {
                        minutes = 5;
                    }
                    else
                    {
                        minutes = 10;
                    }

                    Task.Delay(1000 * 60 * minutes).ContinueWith((prevTask) => SendSalesAdsUpdater());
                });

            }
            catch (Exception q)
            {
                sendErrorCount++;

                var delay = 1;
                if (sendErrorCount >= 5 && sendErrorCount < 10)
                {
                    delay = 5;
                }
                else
                {
                    delay = 10;
                }

                this.EventLog.WriteEntry("SendSalesAdsUpdater EXCEPTION", EventLogEntryType.Information);

                await Task.Run(() =>
                {
                    Task.Delay(1000 * 60 * delay).ContinueWith((prevTask) => SendSalesAdsUpdater());
                });
            }
        }

        public void OnTimer(object sender, System.Timers.ElapsedEventHandler args)
        {
            EventLog.WriteEntry("NORMALLY TICKS :)", EventLogEntryType.Information);
        }

    }
}


