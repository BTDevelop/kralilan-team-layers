using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Formatter
{
    public class JsonFormat : IFormatter
    {
        public string TypeFormatter(object rawData)
        {
            try
            {
                string result = JsonConvert.SerializeObject(rawData);
                return result;
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
