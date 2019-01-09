using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.Entities
{
    public class Odeme
    {
        public int OdemeId { get; set; }
        public double Tutar { get; set; }

        public DateTime Tarih { get; set; }

        public string YapanAdSoyad { get; set; }

        public string OdemeKartNo { get; set; }

        public string SiparisTip { get; set; }

        public string OdemeDurum { get; set; }

        public string OdemeTip { get; set; }


    }
}
