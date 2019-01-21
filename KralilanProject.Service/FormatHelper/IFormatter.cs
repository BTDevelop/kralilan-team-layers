using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.Services.FormatHelper
{
    public interface IFormatter
    {
        string TypeFormatter(object rawData);

        object TypeDeFormatter(string rawData, Type type);

    }
}
