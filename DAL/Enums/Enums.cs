using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace DAL.Enums
{
    //public enum PhoneTypeString : int
    //{
    //    [Description("Cep")]
    //    Cep = 1,
    //    [Description("Cep 2")]
    //    Cep1 = 2,
    //    [Description("Sabit")]
    //    Sabit = 3,
    //    [Description("Sabit 2")]
    //    Sabit2 = 4
    //}

    //public enum StoreTypeString : int
    //{
    //    [Description("Belediyeden")]
    //    belediyeden = 1,
    //    [Description("İcradan")]
    //    icradan = 2,
    //    [Description("İzaley-i Şuyudan")]
    //    izaleden = 3,
    //    [Description("Milli Hazineden Satılamayan")]
    //    maliyeden = 4,
    //    [Description("Bankadan")]
    //    bankadan = 5,
    //    [Description("Kamu Kurumlarından")]
    //    kamudan = 6,
    //    [Description("Emlak Ofisinden")]
    //    emlacidan = 7,
    //    [Description("İnşaat Firmasından")]
    //    insaattan = 8,
    //    [Description("Özelleştirme İdaresinden")]
    //    ozellestirmeden = 9,
    //    [Description("Milli Hazineden Güncel")]
    //    maliyedenGuncel = 10

    //}

    //public enum StoreUserTypeString : int
    //{
    //    [Description("Mağaza Sahibi")]
    //    sahibi = 1,
    //    [Description("Danışman")]
    //    danisman = 2
    //}

    //public enum StorePackageTypeString : int
    //{
    //    [Description("Standart")]
    //    standart = 1,
    //    [Description("Premium")]
    //    premium = 2
    //}

    public enum PaymentTypeString : int
    {
        [Description("Kredi Kartı")]
        kredikart = 1,
        [Description("Mobil Ödeme")]
        mobile = 2,
        [Description("Havale / EFT")]
        havale = 3
    }

    public enum AdsTypeString : int
    {
        [Description("Sayfa Düzeyi Reklam")]
        sayfaduzeyi = 1,
        [Description("Harita Düzeyi Reklam")]
        haritaduzeyi = 2,
    }

    public enum AdsLocationTypeString : int
    {
        
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

    public enum SortTypeString : int
    {
        [Description("Fiyata Göre Artan")]
        PriceAsc = 1,
        [Description("Fiyata Göre Azalan")]
        PriceDesc = 2,
        [Description("Tarihe Göre Artan")]
        DateAsc = 3,
        [Description("Tarihe Göre Azalan")]
        DateDesc = 4,
        [Description("Konuma Göre (A - Z)")]
        LocationAsc = 5,
        [Description("Konuma Göre (Z - A)")]
        LocationDesc = 6,
        [Description("İlan Numarasına Göre Artan")]
        IdAsc = 7,
        [Description("İlan Numarasına Göre Azalan")]
        IdDesc = 8
    }

    public class Enums
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

