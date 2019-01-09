using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.Entities
{
    public class Proje
    {
        public int ProjeId { get; set; }
        public string ProjeAdi { get; set; }
        public string FirmaLogo { get; set; }
        public string ProjeBilgiler { get; set; }
        public string Galeri { get; set; }
        public int IlId { get; set; }
        public string IlAdi { get; set; }
        public int IlceId { get; set; }
        public string IlceAdi { get; set; }
        public DateTime BaslangicTarihi { get; set; }
        public bool SatistaMi { get; set; }
    }
}
