using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.Entities
{
    public class Firma
    {
        public int FirmaId { get; set; }
        public string FirmaAdi { get; set; }
        public DateTime Tarih { get; set; }
        public string Logo { get; set; }
    }
}
