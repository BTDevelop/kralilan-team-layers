using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.Services.FormatHelper
{
    public class FormatHelper
    {
        private IFormatter formatter;
        public object rawData;
        public string strData;
        public Type type;

        public void FormatTo(IFormatter formatter)
        {
            this.formatter = formatter;
        }

        public string Format()
        {
            return this.formatter.TypeFormatter(rawData);
        }

        public object Deformat()
        {
            return this.formatter.TypeDeFormatter(strData, type);
        }
    }
}
