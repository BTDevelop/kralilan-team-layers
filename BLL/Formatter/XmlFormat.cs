using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Formatter
{
    public class XmlFormat : IFormatter
    {
        public string TypeFormatter(object rawData)
        {
            TextWriter txtwrt = new StringWriter();
            var serializer = new System.Xml.Serialization.XmlSerializer(rawData.GetType());
            try
            {
                serializer.Serialize(txtwrt, rawData);
                txtwrt.Close();
            }
            catch (Exception)
            {
                txtwrt.Close();
                throw;
            }
            return txtwrt.ToString();
        }
    }
}
