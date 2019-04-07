using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;
using System.Data.Linq;
using System.Runtime.Serialization;
using KralilanProject.Entities;
using DAL.Enums;
using KralilanProject.Services.FormatHelper;
using Formatter = System.Runtime.Serialization.Formatter;

namespace DAL.Concrete.LINQ
{
    public class LTSIlanlarDal : IIlanlarDal
    {
        private ilanDataContext idc = new ilanDataContext();
        private readonly int pageIndex = 0, pageCount = 10, adsLimit = 3;

        public static Func<ilanDataContext, IQueryable<Ilan>> GetByLastDateCompiled =
            CompiledQuery.Compile((ilanDataContext iDc) =>
                (from i in iDc.ilans.Where(x => x.onay == 1 && x.silindiMi == false && x.satildiMi == false && x.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(2, 0, 0, 0, 0)))
                 select new Ilan
                 {
                     IlanId = i.ilanId,
                     Baslik = i.baslik,
                     Tarih = i.baslangicTarihi,
                     Resimler = i.resim,
                 }).OrderByDescending(x => x.Tarih).Take(20));


        public static Func<ilanDataContext, IQueryable<Ilan>> GetBySaleCompiled =
            CompiledQuery.Compile((ilanDataContext iDc) =>
                (from i in iDc.ilans.Where(x => x.onay == 1 && x.silindiMi == false && x.satildiMi == true)
                 select new Ilan
                 {
                     IlanId = i.ilanId,
                     Baslik = i.baslik,
                     Tarih = i.baslangicTarihi,
                     Resimler = i.resim,
                     Fiyat = string.Format("{0:N0}", i.fiyat),
                 }).OrderByDescending(x => x.IlanId).Take(20));

        public void Add(ilan entity)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                ilan ilan = new ilan();
                if (entity.ilanTurId != -1) ilan.ilanTurId = entity.ilanTurId;
                if (entity.kategoriId != -1) ilan.kategoriId = entity.kategoriId;
                if (entity.fiyat != -1) ilan.fiyat = entity.fiyat;
                if (entity.fiyatTurId != -1) ilan.fiyatTurId = entity.fiyatTurId;
                if (entity.kullaniciId != -1) ilan.kullaniciId = entity.kullaniciId;
                if (entity.magazaId != -1) ilan.magazaId = entity.magazaId;
                if (entity.ilId != -1) ilan.ilId = entity.ilId;
                if (entity.ilceId != -1) ilan.ilceId = entity.ilceId;
                if (entity.mahalleId != -1) ilan.mahalleId = entity.mahalleId;
                if (!String.IsNullOrEmpty(entity.baslik)) ilan.baslik = entity.baslik;
                if (!String.IsNullOrEmpty(entity.aciklama)) ilan.aciklama = entity.aciklama;
                ilan.baslangicTarihi = DateTime.Now;
                ilan.bitisTarihi = (DateTime.Now.AddYears(1));
                if (entity.onay != -1) ilan.onay = entity.onay;
                ilan.ziyaretci = 0;
                ilan.satildiMi = false;
                ilan.numaraYayinlansinMi = entity.numaraYayinlansinMi;
                if (!String.IsNullOrEmpty(entity.koordinat)) ilan.koordinat = entity.koordinat;
                if (!String.IsNullOrEmpty(entity.girilenOzellik)) ilan.girilenOzellik = entity.girilenOzellik;
                if (!String.IsNullOrEmpty(entity.secilenOzellik)) ilan.secilenOzellik = entity.secilenOzellik;
                if (!String.IsNullOrEmpty(entity.resim)) ilan.resim = entity.resim;
                if (entity.ilat != -1) ilan.ilat = entity.ilat;
                if (entity.ilng != -1) ilan.ilng = entity.ilng;
                idc.ilans.InsertOnSubmit(ilan);
                idc.SubmitChanges();
            }
        }

        public void Delete(ilan entity)
        {
            throw new NotImplementedException();
        }

        public ilan Get(int Id)
        {
            var value = idc.ilans.Where(i => i.ilanId == Id).SingleOrDefault();
            return value;
        }

        public ilan Get(ilan entity)
        {
            throw new NotImplementedException();
        }

        public List<ilan> GetAll()
        {
            throw new NotImplementedException();
        }

        public void Update(ilan entity)
        {
            var value = idc.ilans.Where(q => q.ilanId == entity.ilanId).SingleOrDefault();

            if (value != null)
            {
                if (entity.fiyat != -1) value.fiyat = entity.fiyat;
                if (entity.fiyatTurId != -1) value.fiyatTurId = entity.fiyatTurId;
                if (entity.kullaniciId != -1) value.kullaniciId = entity.kullaniciId;
                if (entity.magazaId != -1) value.magazaId = entity.magazaId;
                if (entity.ilId != -1) value.ilId = entity.ilId;
                if (entity.ilceId != -1) value.ilceId = entity.ilceId;
                if (entity.mahalleId != -1) value.mahalleId = entity.mahalleId;
                if (!String.IsNullOrEmpty(entity.baslik)) value.baslik = entity.baslik;
                if (!String.IsNullOrEmpty(entity.aciklama)) value.aciklama = entity.aciklama;
                value.baslangicTarihi = entity.baslangicTarihi;
                value.bitisTarihi = entity.bitisTarihi;
                if (entity.onay != -1) value.onay = entity.onay;
                value.satildiMi = false;
                value.numaraYayinlansinMi = entity.numaraYayinlansinMi;
                if (!String.IsNullOrEmpty(entity.koordinat)) value.koordinat = entity.koordinat;
                if (!String.IsNullOrEmpty(entity.girilenOzellik)) value.girilenOzellik = entity.girilenOzellik;
                if (!String.IsNullOrEmpty(entity.secilenOzellik)) value.secilenOzellik = entity.secilenOzellik;
                if (!String.IsNullOrEmpty(entity.resim)) value.resim = entity.resim;
                if (entity.ilat != -1) value.ilat = entity.ilat;
                if (entity.ilng != -1) value.ilng = entity.ilng;
                value.silindiMi = entity.silindiMi;
                idc.SubmitChanges();
            }
        }

        public List<Ilan> GetByLastDate()
        {
            return GetByLastDateCompiled(idc).ToList();
        }

        public List<Ilan> GetBySale()
        {
            return GetBySaleCompiled(idc).ToList();
        }

        public int CountByStoreId(int StoreId)
        {
            return idc.ilans.Count(i => i.magazaId == StoreId && i.onay == 1 && i.silindiMi == false && i.satildiMi == false);
        }

        public ilan GetLast()
        {
            var value = idc.ilans.OrderByDescending(x => x.ilanId).First();
            return value;
        }

        public void UpdatePicturesByAdsId(int AdsId, string Pictures)
        {
            var value = idc.ilans.Where(q => q.ilanId == AdsId).SingleOrDefault();
            if (value != null)
            {
                value.resim = Pictures;
                idc.SubmitChanges();
            }
        }

        public List<Ilan> GetByLastDateFaceted(SortTypeString SortType)
        {
            var query = from i in idc.ilans.Where(i => i.onay == 1 && i.silindiMi == false && i.satildiMi == false)
                        select new Ilan
                        {
                            IlanId = i.ilanId,
                            Baslik = i.baslik,
                            Fiyat = String.Format(" {0:N0}", i.fiyat),
                            FiyatNumeric = i.fiyat,
                            Aciklama = i.aciklama,
                            MagazaId = i.magazaId,
                            Tarih = i.baslangicTarihi,
                            IlAdi = i.iller.ilAdi,
                            MahalleAdi = i.mahalleler.mahalleAdi,
                            IlceAdi = i.ilceler.ilceAdi,
                            EmlakTipi = Enums.Enums.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), i.ilanTurId.ToString())),
                            FiyatTipi = Enums.Enums.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.fiyatTurId.ToString())),
                            Resimler = i.resim,
                            KategoriAdi = i.kategori.kategoriAdi,
                            Url = KralilanProject.Services.PublicHelper.Tools.URLConverter(i.baslik),
                            BaslangicTarihi = String.Format(" {0:dd MMMM yyyy}", i.baslangicTarihi),
                        };


            query = query.Where(q => q.Tarih >= DateTime.Now.Subtract(new TimeSpan(2, 0, 0, 0, 0)));

            if (SortTypeString.DateDesc == SortType) query = query.OrderByDescending(x => x.Tarih).Skip(pageCount * (pageIndex)).Take(pageCount);

            else if (SortTypeString.DateAsc == SortType) query = query.OrderBy(x => x.Tarih).Skip(pageCount * (pageIndex)).Take(pageCount);

            else if (SortTypeString.PriceDesc == SortType) query = query.OrderByDescending(x => x.FiyatNumeric).Skip(pageCount * (pageIndex)).Take(pageCount);

            else if (SortTypeString.PriceAsc == SortType) query = query.OrderBy(x => x.FiyatNumeric).Skip(pageCount * (pageIndex)).Take(pageCount);

            return query.ToList();
        }

        public List<Ilan> GetBySaleFaceted(SortTypeString SortType)
        {
            var query = from i in idc.ilans.Where(i => i.onay == 1 && i.silindiMi == false && i.satildiMi == true)
                        select new Ilan
                        {
                            IlanId = i.ilanId,
                            Baslik = i.baslik,
                            Fiyat = String.Format(" {0:N0}", i.fiyat),
                            FiyatNumeric = i.fiyat,
                            Aciklama = i.aciklama,
                            MagazaId = i.magazaId,
                            Tarih = i.baslangicTarihi,
                            IlAdi = i.iller.ilAdi,
                            MahalleAdi = i.mahalleler.mahalleAdi,
                            IlceAdi = i.ilceler.ilceAdi,
                            EmlakTipi = Enums.Enums.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), i.ilanTurId.ToString())),
                            FiyatTipi = Enums.Enums.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.fiyatTurId.ToString())),
                            Resimler = i.resim,
                            KategoriAdi = i.kategori.kategoriAdi,
                            Url = KralilanProject.Services.PublicHelper.Tools.URLConverter(i.baslik),
                            BaslangicTarihi = String.Format(" {0:dd MMMM yyyy}", i.baslangicTarihi),
                        };


            if (SortTypeString.DateDesc == SortType) query = query.OrderByDescending(x => x.Tarih).Skip(pageCount * (pageIndex)).Take(pageCount);

            else if (SortTypeString.DateAsc == SortType) query = query.OrderBy(x => x.Tarih).Skip(pageCount * (pageIndex)).Take(pageCount);

            else if (SortTypeString.PriceDesc == SortType) query = query.OrderByDescending(x => x.FiyatNumeric).Skip(pageCount * (pageIndex)).Take(pageCount);

            else if (SortTypeString.PriceAsc == SortType) query = query.OrderBy(x => x.FiyatNumeric).Skip(pageCount * (pageIndex)).Take(pageCount);

            return query.ToList();
        }

        public List<Ilan> GetByUserIdFaceted(int UserId)
        {

            var query = from i in idc.ilans.Where(i => i.onay == 1 && i.silindiMi == false && i.satildiMi == false && i.kullaniciId == UserId && i.magazaId == null)
                        select new Ilan
                        {
                            IlanId = i.ilanId,
                            Baslik = i.baslik,
                            Fiyat = String.Format(" {0:N0}", i.fiyat),
                            FiyatNumeric = i.fiyat,
                            Aciklama = i.aciklama,
                            MagazaId = i.magazaId,
                            Tarih = i.baslangicTarihi,
                            IlAdi = i.iller.ilAdi,
                            MahalleAdi = i.mahalleler.mahalleAdi,
                            IlceAdi = i.ilceler.ilceAdi,
                            EmlakTipi = Enums.Enums.GetDescription((EstateTypeString)Enum.Parse(typeof(EstateTypeString), i.ilanTurId.ToString())),
                            FiyatTipi = Enums.Enums.GetDescription((CurrencyTypeString)Enum.Parse(typeof(CurrencyTypeString), i.fiyatTurId.ToString())),
                            Resimler = i.resim,
                            KategoriAdi = i.kategori.kategoriAdi,
                            Url = KralilanProject.Services.PublicHelper.Tools.URLConverter(i.baslik),
                            BaslangicTarihi = String.Format(" {0:dd MMMM yyyy}", i.baslangicTarihi),
                        };

            query = query.OrderByDescending(x => x.Tarih).Skip(pageCount * (pageIndex)).Take(pageCount);
            return query.ToList();
        }

        public ilan GetLastByUserId(int UserId)
        {
            var value = idc.ilans.Where(i => i.kullaniciId == UserId && i.onay == 1 && i.silindiMi == false && i.satildiMi == false)
                .OrderByDescending(x => x.baslangicTarihi).FirstOrDefault();
            return value;
        }

        public bool IsOwnerAds(int AdsId, int UserId, int StoreId)
        {
            var value = idc.ilans.Where(i => i.ilanId == AdsId).FirstOrDefault();
            if (value != null)
            {
                if (StoreId != -1) value = value.magazaId == StoreId ? value : null;
                else if (UserId != -1) value = value.kullaniciId == UserId ? value : null;

            }

            return value == null ? false : true;
        }

        public void UpdateStatus(int AdsId, int IsVerify, bool IsPass, bool IsDelete, bool IsSale)
        {
            var value = idc.ilans.Where(q => q.ilanId == AdsId).FirstOrDefault();

            if (value != null)
            {
                value.silindiMi = IsDelete;
                value.onay = IsVerify;
                value.pasifMi = IsPass;
                value.satildiMi = IsSale;
                idc.SubmitChanges();
            }
        }

        public int CountLastDate()
        {
            var value = idc.ilans.Where(q => q.onay == 1 && q.silindiMi == false
                                                         && q.satildiMi == false
                                                         && q.baslangicTarihi >= DateTime.Now.Subtract(new TimeSpan(2, 0, 0, 0, 0)));
            return value.Count();
        }

        public int CountSale()
        {
            var value = idc.ilans.Where(q => q.onay == 1 && q.silindiMi == false && q.satildiMi == true);
            return value.Count();
        }

        public List<Ilan> GetSitemap(int Year, int Month)
        {
            var query = from i in idc.ilans
                    .Where(x => x.onay == 1 && x.silindiMi == false &&
                                x.baslangicTarihi.Year == Year && x.baslangicTarihi.Month == Month)
                    .OrderBy(x => x.baslangicTarihi)
                        select new Ilan
                        {
                            Baslik = i.baslik,
                            IlanId = i.ilanId,
                            Tarih = i.baslangicTarihi
                        };

            return query.ToList();
        }

        public List<IlanSayi> GetAllRegion()
        {
            var query = (from i in idc.ilans
                         where i.onay == 1 && i.silindiMi == false && i.satildiMi == false
                         group i by i.iller into g
                         select new IlanSayi
                         {
                             Id = g.Key.ilId,
                             Adi = g.Key.ilAdi,
                             Sayi = g.Count()
                         });

            return query.ToList();
        }

        public List<Ilan> GetByLocationRound(int RegionId, int CityId)
        {
            var query = from i in idc.ilans.Where(x => x.onay == 1 && x.silindiMi == false && x.satildiMi == false)
                        select new Ilan
                        {
                            IlanId = i.ilanId,
                            Baslik = i.baslik,
                            Tarih = i.baslangicTarihi,
                            Resimler = i.resim,
                            IlId = i.ilId,
                            IlceId = i.ilceId,
                            Url = KralilanProject.Services.PublicHelper.Tools.URLConverter(i.baslik)
                        };

            var subQuery = query.Where(x => x.IlceId == CityId);

            if (subQuery.Count() > 10)
            {
                return subQuery.Take(10).ToList();
            }
            else
            {
                return query.Where(x => x.IlId == RegionId).Take(10).ToList();
            }

        }

        public int CountByUserStoreId(int UserId, int StoreId)
        {
            var query = idc.ilans.Where(i => i.onay == 1 && i.silindiMi == false && i.satildiMi == false && i.kullaniciId == UserId);

            if (StoreId == -1) query = query.Where(x => x.magazaId == null);
            else query = query.Where(x => x.magazaId == StoreId);

            return query.Count();
        }

        public class girilenDataType
        {
            public int ozellikId { get; set; }
            public string deger { get; set; }
        }

        public List<Ilan> GetFaceted(int Index, int[] GeneralFilter, Filtre OtherFilter)
        {
            var query = from i in idc.ilans.Where(i =>
                    i.onay == 1 && i.silindiMi == false)
                select new Ilan
                {
                    IlanId = i.ilanId,
                    KategoriId = i.kategoriId,
                    EmlakTipiId = i.ilanTurId,
                    UstKategoriId = i.kategori.ustKategoriId,
                    Baslik = i.baslik,
                    FiyatNumeric = i.fiyat,
                    FiyatTipi = Enums.Enums.GetDescription(
                        (CurrencyTypeString) Enum.Parse(typeof(CurrencyTypeString), i.fiyatTurId.ToString())),
                    Tarih = i.baslangicTarihi,
                    IlId = i.iller.ilId,
                    IlceId = i.ilceler.ilceId,
                    MahalleId = i.mahalleler.mahalleId,
                    IlAdi = i.iller.ilAdi,
                    IlceAdi = i.ilceler.ilceAdi,
                    MahalleAdi = i.mahalleler.mahalleAdi,
                    MagazaTipId = i.magaza.magazaTur.turId,
                    MagazaId = i.magazaId,
                    Resimler = i.resim,
                    Girilenler = i.girilenOzellik,
                    Secilenler = i.secilenOzellik,
                    Koordinat = i.koordinat,
                    Enlem = i.ilat,
                    Boylam = i.ilng,
                    BitisTarihi = i.bitisTarihi
                };

            if (GeneralFilter.Length > 0)
            {

                int
                    EstateTypeId = Convert.ToInt32(GeneralFilter[1]),
                    RegionId = Convert.ToInt32(GeneralFilter[2]),
                    CityId = Convert.ToInt32(GeneralFilter[3]),
                    CityAreaId = Convert.ToInt32(GeneralFilter[4]),
                    StoreType = Convert.ToInt32(GeneralFilter[5]),
                    DateRange = Convert.ToInt32(GeneralFilter[6]),
                    SortType = Convert.ToInt32(GeneralFilter[7]);

                string category = GeneralFilter[0].ToString();



                if (RegionId != -1)
                {
                    query = query.Where(q => q.IlId == RegionId);

                    if (CityId != -1)
                    {
                        query = query.Where(q => q.IlceId == CityId);

                        if (CityAreaId != -1)
                        {
                            query = query.Where(q => q.MahalleId == CityAreaId);
                        }
                    }
                }


                //if (!category.Equals("-1"))
                //{
                //    int categoryId = idc.kategoris.Where(x => (x.kategoriAdi).Equals(category)).FirstOrDefault()
                //        .kategoriId;

                //    if (idc.kategoris.Where(x => x.ustKategoriId == categoryId).FirstOrDefault() == null)
                //    {
                //        query = query.Where(q => q.kategoriId == categoryId);
                //    }
                //    else
                //    {
                //        query = query.Where(q => q.kategori.ustKategoriId == categoryId);
                //    }
                //}

                if (EstateTypeId != -1)
                {
                    query = query.Where(q => q.EmlakTipiId == EstateTypeId);
                }


                if (StoreType != -1)
                {
                    if (StoreType != 0)
                    {
                        query = query.Where(q => q.MagazaTipId == StoreType);
                    }
                    else
                    {
                        query = query.Where(q => q.MagazaId == null);
                    }
                }

                if (DateRange != -1)
                {
                    if (DateRange == 1)
                    {
                        query = query.Where(
                            q => q.Tarih >= DateTime.Now.Subtract(new TimeSpan(1, 0, 0, 0, 0)));
                    }
                    else if (DateRange == 3)
                    {
                        query = query.Where(
                            q => q.Tarih >= DateTime.Now.Subtract(new TimeSpan(3, 0, 0, 0, 0)));
                    }
                    else if (DateRange == 7)
                    {
                        query = query.Where(
                            q => q.Tarih >= DateTime.Now.Subtract(new TimeSpan(7, 0, 0, 0, 0)));
                    }
                    else if (DateRange == 15)
                    {
                        query = query.Where(q =>
                            q.Tarih >= DateTime.Now.Subtract(new TimeSpan(15, 0, 0, 0, 0)));
                    }
                    else
                    {
                        query = query.Where(q =>
                            q.Tarih >= DateTime.Now.Subtract(new TimeSpan(30, 0, 0, 0, 0)));
                    }
                }

                if (SortType != -1)
                {
                    if (SortType == 2) query = query.OrderBy(x => x.FiyatNumeric);

                    if (SortType == 3) query = query.OrderByDescending(x => x.FiyatNumeric);

                    if (SortType == 4) query = query.OrderBy(x => x.Tarih);

                    if (SortType == 5) query = query.OrderByDescending(x => x.Tarih);

                    if (SortType == 6) query = query.OrderBy(x => x.IlId);

                    if (SortType == 7) query = query.OrderByDescending(x => x.IlId);
                }


            }

            if (OtherFilter != null)
            {
                if (OtherFilter.KoordinatliMi)
                {
                    query = query.Where(q => q.Koordinat != null);

                    if (OtherFilter.SuruklendiMi)
                    {
                        query = query.Where(q =>
                            q.Enlem < OtherFilter.Koordinat.MaxLat & q.Enlem > OtherFilter.Koordinat.MinLat &
                            q.Boylam < OtherFilter.Koordinat.MaxLng & q.Boylam > OtherFilter.Koordinat.MinLng);
                    }
                }

                if (OtherFilter.Fiyat != null)
                {
                    double MinFiyat = -1,
                        MaxFiyat = -1;

                    if (OtherFilter.Fiyat.Min != -1)
                        MinFiyat = Convert.ToDouble(OtherFilter.Fiyat.Min);
                    if (OtherFilter.Fiyat.Max != -1)
                        MaxFiyat = Convert.ToDouble(OtherFilter.Fiyat.Max);

                    if (MinFiyat != -1 && MaxFiyat != -1)
                        query = query.Where(q => q.FiyatNumeric >= MinFiyat & q.FiyatNumeric <= MaxFiyat);

                    if (MinFiyat == -1 && MaxFiyat != -1) query = query.Where(q => q.FiyatNumeric <= MaxFiyat);

                    if (MinFiyat != -1 && MaxFiyat == -1) query = query.Where(q => q.FiyatNumeric >= MaxFiyat);

                }


                if (OtherFilter.Secilenler != null)
                {
                    for (int i = 0; i < OtherFilter.Secilenler.Count; i++)
                    {
                        SelectFiltre InData = OtherFilter.Secilenler[i];

                        int Value = -1;

                        if (InData.Value != -1)
                        {
                            query = query.Where(q => q.Secilenler.Contains("<deger>" + InData.Value + "</deger>"));
                        }
                    }
                }


                if (OtherFilter.Girilenler != null)
                {
                    for (int i = 0; i < OtherFilter.Girilenler.Count; i++)
                    {
                        TextFiltre InData = OtherFilter.Girilenler[i];
                        double MinValue = -1,
                            MaxValue = -1,
                            PropertyId = -1;

                        //if (InData.Max != -1) MaxValue = InData.Max;


                        //if (InData.Min != -1)  MinValue = InData.Min;


                        PropertyId = InData.Id;

                        //TextFiltre itemclssorgu = new TextFiltre();
                        //itemclssorgu.id = ozellikId;
                        //itemclssorgu.Max = max;
                        //itemclssorgu.Min = min;
                        //lstsorgu.Add(itemclssorgu);
                        if (InData.Max != -1 || InData.Min != -1)
                        {
                            query = query.Where(q =>
                                q.Girilenler.Contains("<ozellikId>" + InData.Id + "</ozellikId>"));
                        }

                        List<Ilan> FiltrelenenIlanlar = new List<Ilan>();
                        FiltrelenenIlanlar = query.ToList();

                        FormatHelper formatter = new FormatHelper();
                        XmlFormat xmlFormat = new XmlFormat();


                        for (int j = 0; j < FiltrelenenIlanlar.Count; j++)
                        {

                          
                            List<girilenDataType> Girilenler = new List<girilenDataType>();
                            
                            formatter.FormatTo(xmlFormat);
                            formatter.strData = FiltrelenenIlanlar[i].Girilenler;
                            formatter.type = typeof(girilenDataType);
                            formatter.Deformat();

                            double Min = -1,
                                   Max = -1;

                        }
                    }
                }


            }

            return null;
        }

        public bool IsUserAdsLimitless(int UserId)
        {
            var value = idc.ilans.Count(x => x.kullaniciId == UserId);
            return value > adsLimit;
        }
    }
}
