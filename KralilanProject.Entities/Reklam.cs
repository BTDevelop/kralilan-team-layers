using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.Entities
{
    public class Reklam
    {
        public int Id { get; set; }
        public string ReklamAdi { get; set; }
        public string ReklamTipi { get; set; }
        public string Konumu { get; set; }
        public string Link { get; set; }
        public string Resim { get; set; }
        public int? IlId { get; set; }
        public DateTime BaslangicTarihi { get; set; }
        public DateTime BitisTarihi { get; set; }
    }
}
