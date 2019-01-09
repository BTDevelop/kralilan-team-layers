using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.Formatter
{
    public interface IFormatter
    {
        string TypeFormatter(object rawData);
    }
}
