using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.Entities
{
    public class Bildirim
    {
        public int Id { get; set; }

        public string Konu { get; set; }

        public string Mesaj { get; set; }

        public string BaslangicTarihi { get; set; }

        public DateTime Tarih { get; set; }
    }
}
