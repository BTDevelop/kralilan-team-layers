using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Formatter
{
    public class Formatter
    {
        private IFormatter formatter;
        public object rawData;

        public void FormatTo(IFormatter formatter)
        {
            this.formatter = formatter;
        }

        public string Format()
        {
            return this.formatter.TypeFormatter(rawData);
        }
    }
}
