using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.Services.PublicHelper
{
    public class Tools
    {

        public static string PhoneNumberOrganizer(string Number)
        {
            try
            {
                return Number.Replace("(", "").Replace(")", "").Replace(" ", "").Replace("-", "");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static string URLConverter(object rawData)
        {
            try
            {
                string strSonuc = rawData.ToString().Trim().ToLower();

                strSonuc = strSonuc.Replace("-", "+");
                strSonuc = strSonuc.Replace(" ", "+");

                strSonuc = strSonuc.Replace("ç", "c");
                strSonuc = strSonuc.Replace("Ç", "C");

                strSonuc = strSonuc.Replace("ğ", "g");
                strSonuc = strSonuc.Replace("Ğ", "G");

                strSonuc = strSonuc.Replace("ı", "i");
                strSonuc = strSonuc.Replace("İ", "I");

                strSonuc = strSonuc.Replace("ö", "o");
                strSonuc = strSonuc.Replace("Ö", "O");

                strSonuc = strSonuc.Replace("ş", "s");
                strSonuc = strSonuc.Replace("Ş", "S");

                strSonuc = strSonuc.Replace("ü", "u");
                strSonuc = strSonuc.Replace("Ü", "U");

                strSonuc = strSonuc.Trim();
                strSonuc = new System.Text.RegularExpressions.Regex("[^a-zA-Z0-9+]").Replace(strSonuc, "");
                strSonuc = strSonuc.Trim();
                strSonuc = strSonuc.Replace("+", "-");
                return strSonuc.ToLower();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static string[] StringOrganizer(string Text)
        {
            string[] arrWords = new string[2];
            string[] arrTemp = Text.Split(' ');

            arrWords[0] = "";
            arrWords[1] = arrTemp[arrTemp.Length - 1];

            if (arrTemp.Length > 2)
            {
                for (int i = 0; i < arrTemp.Length - 1; i++)
                {
                    arrWords[0] += " " + arrTemp[i];
                }
            }
            else arrWords[0] = arrTemp[0];
            
            return arrWords;
        }
    }
}
