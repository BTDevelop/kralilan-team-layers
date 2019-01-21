using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.Services.FormatHelper
{
    public class JsonFormat : IFormatter
    {
        public object TypeDeFormatter(string rawData, Type type)
        {
            throw new NotImplementedException();
        }

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
