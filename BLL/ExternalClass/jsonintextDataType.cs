using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ExternalClass
{
    /// <summary>
    /// 
    /// </summary>
    public class ListDrop
    {
        public int id { get; set; }
        public string value { get; set; }
    }
    /// <summary>
    /// 
    /// </summary>
    public class ListText
    {
        public string id { get; set; }
        public string Min { get; set; }
        public string Max { get; set; }
    }

    public class FiyatData
    {
        public string Max { get; set; }
        public string Min { get; set; }
    }

    public class Koordinatlar
    {
        public Single minLat { get; set; }
        public Single maxLat { get; set; }
        public Single minLng { get; set; }
        public Single maxLng { get; set; }
    }

    public class jsonintextDataType
    {
        public IList<ListDrop> ListDrop { get; set; }
        public IList<ListText> ListText { get; set; }
        public FiyatData FiyatData { get; set; }
        public bool isCoordinates { get; set; }
        public bool isDrag { get; set; }
        public Koordinatlar koordinatlar { get; set; }
    }
}
