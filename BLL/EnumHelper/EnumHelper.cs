using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace BLL.EnumHelper
{
    public enum PhoneTypeString : int
    {
        [Description("Cep")]
        Cep = 1,
        [Description("Cep 2")]
        Cep1 = 2,
        [Description("Sabit")]
        Sabit = 3,
        [Description("Sabit 2")]
        Sabit2 = 4
    }

    public enum StoreTypeString : int
    {
        [Description("Belediyeden")]
        belediyeden = 1,
        [Description("İcradan")]
        icradan = 2,
        [Description("İzaley-i Şuyudan")]
        izaleden = 3,
        [Description("Milli Hazineden Satılamayan")]
        maliyeden = 4,
        [Description("Bankadan")]
        bankadan = 5,
        [Description("Kamu Kurumlarından")]
        kamudan = 6,
        [Description("Emlak Ofisinden")]
        emlacidan = 7,
        [Description("İnşaat Firmasından")]
        insaattan = 8,
        [Description("Özelleştirme İdaresinden")]
        ozellestirmeden = 9,
        [Description("Milli Hazineden Güncel")]
        maliyedenGuncel = 10

    }

    public enum StoreUserTypeString : int
    {
        [Description("Mağaza Sahibi")]
        sahibi = 1,
        [Description("Danışman")]
        danisman = 2
    }

    public enum StorePackageTypeString : int
    {
        [Description("Standart")]
        standart = 1,
        [Description("Premium")]
        premium = 2
    }

    public enum PaymentTypeString : int
    {
        [Description("Kredi Kartı")]
        kredikart = 1,
        [Description("Mobil Ödeme")]
        mobile = 2,
        [Description("Havale / EFT")]
        havale = 3
    }

    public enum CurrencyTypeString : int
    {
        [Description(" &#x20BA;")]
        turklirasi = 1,
        [Description(" $")]
        dolar = 2,
        [Description(" €")]
        euro = 3
    }

    public enum EstateTypeString : int
    {
        [Description("Satılık")]
        satilik = 1,
        [Description("Kiralık")]
        kiralik = 2,
        [Description("Günlük Kiralık")]
        gunlukkiralik = 3,
        [Description("Devren")]
        devren = 4,
        [Description("Devren Satılık")]
        devrensatilik = 6
    }

    public enum PaymentOrderTypeString : int
    {
        [Description("Anasayfa Vitrini")]
        anasayfavitrini = 1,
        [Description("Arama Sonuç Vitrini")]
        aramasonucvitrini = 2,
        [Description("Kategori Vitrini")]
        katgorivitrini = 3,
        [Description("Acil Acil Vitrini")]
        acilvitrini = 5,
        [Description("Fiyatı Düştü Vitrini")]
        fiyatidustuvitrini = 8,
        [Description("Vitrin")]
        vitrin = 10,
        [Description("Mağaza")]
        magaza = 15,
        [Description("Proje")]
        proje = 20,
    }

    public class EnumHelper
    {
        public static string GetDescription(Enum en)
        {
            Type type = en.GetType();
            MemberInfo[] memInfo = type.GetMember(en.ToString());

            if (memInfo != null && memInfo.Length > 0)
            {
                object[] attrs = memInfo[0].GetCustomAttributes(typeof(DescriptionAttribute), false);

                if (attrs != null && attrs.Length > 0)
                {
                    return ((DescriptionAttribute)attrs[0]).Description;
                }
            }

            return en.ToString();
        }
    }
}

