using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.Entities
{
    public class Ilan
    {
        public int IlanId { get; set; }

        public string Baslik { get; set; }

        public string BaslangicTarihi { get; set; }

        public DateTime Tarih { get; set; }

        public string Aciklama { get; set; }

        public string Resimler { get; set; }

        public double FiyatNumeric { get; set; }

        public string Fiyat { get; set; }

        public int UstKategoriId { get; set; }

        public int KategoriId { get; set; }

        public string KategoriAdi { get; set; }

        public int? MagazaId { get; set; }

        public string IlAdi { get; set; }

        public string IlceAdi { get; set; }

        public string MahalleAdi { get; set; }

        public string Url { get; set; }

        public int FiyatTipiId { get; set; }

        public string FiyatTipi { get; set; }

        public string EmlakTipi { get; set; }
    }
}
