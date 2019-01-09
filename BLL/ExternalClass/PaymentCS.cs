using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ExternalClass
{
    public class PaymentCS
    {
        public int id { get; set; }
        public string paytype { get; set; }
        public string paytotal { get; set; }
        public string date { get; set; }
        public string username { get; set; }
        public string cardno { get; set; }
        public string operation { get; set; }
        public string success { get; set; }
        public string exp { get; set; }
    }
}
