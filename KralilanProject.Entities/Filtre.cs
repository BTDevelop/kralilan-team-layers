using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.Entities
{
    public class SelectFiltre
    {
        public int Id { get; set; }
        public int Value { get; set; }
    }

    public class TextFiltre
    {
        public int Id { get; set; }
        public double Min { get; set; }
        public double Max { get; set; }
    }

    public class FiyatFiltre
    {
        public double Max { get; set; }
        public double Min { get; set; }
    }

    public class KoordinatFiltre
    {
        public Single MinLat { get; set; }
        public Single MaxLat { get; set; }
        public Single MinLng { get; set; }
        public Single MaxLng { get; set; }
    }

    public class Filtre
    {
        public IList<SelectFiltre> Secilenler { get; set; }
        public IList<TextFiltre> Girilenler { get; set; }
        public FiyatFiltre Fiyat { get; set; }
        public bool KoordinatliMi { get; set; }
        public bool SuruklendiMi { get; set; }
        public KoordinatFiltre Koordinat { get; set; }
    }
}
