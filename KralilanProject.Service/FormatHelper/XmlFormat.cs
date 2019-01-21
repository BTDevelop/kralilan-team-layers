using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.Services.FormatHelper
{
    public class XmlFormat : IFormatter
    {
        public object TypeDeFormatter(string rawData, Type type)
        {
            TextReader txtrd = new StringReader(rawData);
            var serializer = new System.Xml.Serialization.XmlSerializer(type);
            try
            {
                var obj = serializer.Deserialize(txtrd);
                txtrd.Close();
                return obj;
            }
            catch (Exception)
            {
                txtrd.Close();
            }

            return null;
        }

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
