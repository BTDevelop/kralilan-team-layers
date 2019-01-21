using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.Entities
{
    public class DopingKategori
    {
        public int Id  { get; set; }

        public string DopingAdi { get; set; }

        public string Sure { get; set; }

        public string Fiyat { get; set; }

        public double? FiyatNumeric { get; set; }

        public string KategoriAdi { get; set; }

    }
}
