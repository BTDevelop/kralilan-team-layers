using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.Entities
{
    public class Ozellik
    {
        public int OzellikId { get; set; }

        public string OzellikAdi { get; set; }

        public string Tipi { get; set; }

        public string Degeri { get; set; }

        public string Kategori { get; set; }

        public bool SayisalMi { get; set; }

        public bool FiltreMi { get; set; }

        public bool DetayMi { get; set; }
    }
}
