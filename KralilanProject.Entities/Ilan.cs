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

        public int? UstKategoriId { get; set; }

        public int KategoriId { get; set; }

        public string KategoriAdi { get; set; }

        public int? MagazaId { get; set; }

        public string IlAdi { get; set; }

        public int IlId { get; set; }

        public string IlceAdi { get; set; }

        public int IlceId { get; set; }

        public int MahalleId { get; set; }

        public string MahalleAdi { get; set; }

        public string Url { get; set; }

        public int FiyatTipiId { get; set; }

        public string FiyatTipi { get; set; }

        public int? EmlakTipiId { get; set; }

        public string EmlakTipi { get; set; }

        public string Girilenler { get; set; }

        public string Secilenler { get; set; }

        public string Koordinat { get; set; }

        public double? Enlem { get; set; }

        public double? Boylam { get; set; }

        public int? MagazaTipId { get; set; }

        public DateTime? BitisTarihi { get; set; }

    }
}
