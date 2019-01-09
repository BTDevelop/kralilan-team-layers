using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.SecurityCodeHelper
{
    public class SecurityCodeHelper
    {
        public string SecurityCodeGenerate()
        {
            ArrayList selected = new ArrayList();
            Random rnd = new Random();

            bool control = true;
            string securityCode = "";

            while (control)
            {
                if (securityCode.Length < 6)
                {
                    int _num = rnd.Next(10);
                    if (selected.IndexOf(_num) < 0) 
                    {
                        securityCode += _num.ToString(); 
                        selected.Add(_num); 
                    }
                }
                else
                {
                    control = false; 
                }
            }

            return securityCode;
        }
    }
}
