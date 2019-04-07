using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;
using DAL.Enums;
using KralilanProject.Entities;

namespace DAL.Concrete.ADONET
{
    public class ADOIlanlarDal : IIlanlarDal
    {
        public List<Ilan> GetByLastDate()
        {
            throw new NotImplementedException();
        }

        public List<Ilan> GetBySale()
        {
            throw new NotImplementedException();
        }

        public ilan GetLast()
        {
            throw new NotImplementedException();
        }

        public ilan GetLastByUserId(int UserId)
        {
            throw new NotImplementedException();
        }

        public bool IsOwnerAds(int AdsId, int UserId, int StoreId)
        {
            throw new NotImplementedException();
        }

        public List<Ilan> GetByLastDateFaceted(SortTypeString SortType)
        {
            throw new NotImplementedException();
        }

        public List<Ilan> GetBySaleFaceted(SortTypeString SortType)
        {
            throw new NotImplementedException();
        }

        public List<Ilan> GetByUserIdFaceted(int UserId)
        {
            throw new NotImplementedException();
        }

        public List<Ilan> GetSitemap(int Year, int Month)
        {
            throw new NotImplementedException();
        }

        public List<IlanSayi> GetAllRegion()
        {
            throw new NotImplementedException();
        }

        public List<Ilan> GetByLocationRound(int RegionId, int CityId)
        {
            throw new NotImplementedException();
        }

        public int CountByStoreId(int StoreId)
        {
            throw new NotImplementedException();
        }

        public int CountByUserStoreId(int UserId, int StoreId)
        {
            throw new NotImplementedException();
        }

        public int CountLastDate()
        {
            throw new NotImplementedException();
        }

        public int CountSale()
        {
            throw new NotImplementedException();
        }

        public void UpdatePicturesByAdsId(int AdsId, string Pictures)
        {
            throw new NotImplementedException();
        }

        public void UpdateStatus(int AdsId, int IsVerify, bool IsPass, bool IsDelete, bool IsSale)
        {
            throw new NotImplementedException();
        }

        public List<ilan> GetAll()
        {
            throw new NotImplementedException();
        }

        public ilan Get(int Id)
        {
            throw new NotImplementedException();
        }

        public void Add(ilan entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(ilan entity)
        {
            throw new NotImplementedException();
        }

        public void Update(ilan entity)
        {
            throw new NotImplementedException();
        }

        public List<Ilan> GetFaceted(int Index, int[] GeneralFilter, Filtre OtherFilter)
        {
            SqlConnection conn = new SqlConnection("Data Source=.;Initial Catalog=ilanDB;Integrated Security=True");

            conn.Open();
            var query =
                "SELECT ilan.baslik, ilan.aciklama, ilan.baslangicTarihi, iller.ilAdi, ilceler.ilceAdi, mahalleler.mahalleAdi, ilan.fiyat, ilan.fiyatTurId, ilan.baslangicTarihi, ilan.ilanTurId, ilan.resim, magaza.magazaAdi FROM ilan " +
                "INNER JOIN iller ON iller.ilId = ilan.ilId " +
                "INNER JOIN ilceler ON ilceler.ilceId = ilan.ilceId " +
                "INNER JOIN mahalleler ON mahalleler.mahalleId = ilan.mahalleId " +
                "INNER JOIN magaza ON magaza.magazaId = ilan.magazaId " +
                "INNER JOIN kategori ON kategori.kategoriId = ilan.kategoriId ";

            if (GeneralFilter.Length > 0) query = query + " WHERE ";

            if (GeneralFilter[0] != -1) query += "kategori.kategoriId =" + GeneralFilter[0] + " ";

            if (GeneralFilter[1] != -1) query += "AND ilan.ilanTurId =" + GeneralFilter[1] + " ";

            if (GeneralFilter[2] != -1) query += "AND iller.ilId =" + GeneralFilter[2] + " ";

            if (GeneralFilter[3] != -1) query += "AND ilceler.ilceId =" + GeneralFilter[3] + " ";

            if (GeneralFilter[4] != -1) query += "AND mahalleler.mahalleId =" + GeneralFilter[4] + " ";

            if (GeneralFilter[5] != -1) query += "AND kategori.kategoriId =" + GeneralFilter[5] + " ";

            //if (GeneralFilter[4] != -1) query += "AND ilan.ilanTurId =" + GeneralFilter[4] + " ";

            //if (GeneralFilter[5] != -1) query += "AND magaza.magazaTurId =" + GeneralFilter[5] + " ";

            

            if (OtherFilter != null)
            {
                if (OtherFilter.KoordinatliMi)
                {

                }

                if (OtherFilter.SuruklendiMi)
                {
                }

                if (OtherFilter.Fiyat != null)
                {
                    if (OtherFilter.Fiyat.Min != -1.0)
                    {
                        query += "AND ilan.fiyat >" + OtherFilter.Fiyat.Min;
                    }

                    if (OtherFilter.Fiyat.Max != -1.0)
                    {
                        query += "AND ilan.fiyat <" + OtherFilter.Fiyat.Max;

                    }
                }

                if (OtherFilter.Secilenler != null)
                {
                    if (OtherFilter.Secilenler.Count > 0)
                    {
                        for (int i = 0; i < OtherFilter.Secilenler.Count; i++)
                        {
                            query += "AND ozellikDegerler.ozellikId =" + OtherFilter.Secilenler[i].Id;
                            query += "AND ozellikDegerler.deger =" + OtherFilter.Secilenler[i].Value;
                        }
                    }
                }

                if (OtherFilter.Girilenler != null)
                {
                    if (OtherFilter.Girilenler.Count > 0)
                    {
                        for (int i = 0; i < OtherFilter.Girilenler.Count; i++)
                        {
                            query += "AND ozellikDegerler.ozellikId =" + OtherFilter.Girilenler[i].Id;

                            if (OtherFilter.Girilenler[i].Min != -1)
                                query += "AND CAST(ozellikDegerler.deger AS int) >" + OtherFilter.Girilenler[i].Min;

                            if (OtherFilter.Girilenler[i].Max != -1)
                                query += "AND CAST(ozellikDegerler.deger AS int) <" + OtherFilter.Girilenler[i].Max;

                        }
                    }
                }
            }

            query = query +
                    " AND EXISTS (SELECT 1 FROM ozellikDegerler od WHERE od.ilanId = ilan.ilanId)";

            query = query + "ORDER BY ilan.baslangicTarihi DESC OFFSET " + (Index * 10) + " ROWS FETCH NEXT 10 ROWS ONLY;";

            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader dt = cmd.ExecuteReader();

            List<Ilan> TumIlanlar = new List<Ilan>();

            while (dt.Read())
            {
                var item = new Ilan
                {
                    Baslik = dt["baslik"].ToString(),
                    IlAdi = dt["ilAdi"].ToString(),
                    IlceAdi = dt["ilceAdi"].ToString(),
                    MahalleAdi = dt["mahalleAdi"].ToString(),
                    Url = KralilanProject.Services.PublicHelper.Tools.URLConverter(dt["baslik"].ToString()),
                    Fiyat = string.Format(" {0:N0}", dt["fiyat"]),
                    EmlakTipi = Enums.Enums.GetDescription(
                        (EstateTypeString) Enum.Parse(typeof(EstateTypeString), dt["ilanTurId"].ToString())),
                    FiyatTipi = Enums.Enums.GetDescription(
                        (CurrencyTypeString) Enum.Parse(typeof(CurrencyTypeString), dt["fiyatTurId"].ToString())),
                    Resimler = dt["resim"].ToString(),
                    BaslangicTarihi = String.Format(" {0:dd MMMM yyyy}", dt["baslangicTarihi"]),
                };

                TumIlanlar.Add(item);
            }
            conn.Close();
            conn.Dispose();

            return TumIlanlar;
        }

        public bool IsUserAdsLimitless(int UserId)
        {
            throw new NotImplementedException();
        }
    }
}
