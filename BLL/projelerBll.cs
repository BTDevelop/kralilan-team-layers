using BLL.ExternalClass;
using BLL.Formatter;
using DAL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.HtmlControls;

namespace BLL
{
    public class projelerBll
    {
        Formatter.Formatter formatter = new Formatter.Formatter();
        /// <summary>
        /// 
        /// </summary>
        ///// <param name="_id"></param>
        //public void delete(int _id)
        //{
        //    throw new NotImplementedException();
        //}

        //public void insert(string _inProjeName, string _inComPost, string _inPhone, string _inFaks, string _inAddress, string _inWebsite,
        //                   string _inAbout, string _inFo, string _inGalery, int _inProvId, int _inDistId, string _inPlan, string _inCoor,
        //                   string _inProp, string _inStPlan, int _inUserId, int _inComId)
        //{
        //    try
        //    {
        //        using (ilanDataContext idc = new ilanDataContext())
        //        {
        //            projeler proje = new projeler();
        //            proje.padi = _inProjeName;
        //            proje.padres = _inAddress;
        //            proje.pbilgiler = _inFo;
        //            proje.peposta = _inComPost;
        //            proje.pfaks = _inFaks;
        //            proje.pgaleri = _inGalery;
        //            proje.phakkinda = _inAbout;
        //            proje.pil = _inProvId;
        //            proje.pilce = _inDistId;
        //            proje.pkatplan = _inPlan;
        //            proje.pkoordinat = _inCoor;
        //            proje.pozellik = _inProp;
        //            proje.ptelefon = _inPhone;
        //            proje.pvaziyetplan = _inStPlan;
        //            proje.pwebsite = _inWebsite;
        //            proje.pkullanicid = _inUserId;
        //            proje.pfirmaid = _inComId;
        //            proje.ponay = false;
        //            proje.psatistami = false;
        //            proje.psilindmi = false;
        //            proje.ptarih = DateTime.Now;
        //            idc.projelers.InsertOnSubmit(proje);
        //            idc.SubmitChanges();
        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //        ex.ToString();
        //    }
        //}

        //public void lastedupdate(int _inProjeId, string _inGalery, string _inPlan, string _inStPlan)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.projelers.Where(q => q.projeid == _inProjeId).FirstOrDefault();
        //        if (value != null)
        //        {
        //            value.pgaleri = _inGalery;
        //            value.pkatplan = _inPlan;
        //            value.pvaziyetplan = _inStPlan;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}

        //public void update(int _inProjeId, string _inProName, string _inComPost, string _inPhone, string _inFaks, string _inAddress,
        //                   string _inWebsite, string _inAbout, string _inFo, string _inGalery, int _inProvId, int _inDistId, string _inPlan,
        //                   string _inCoor, string _inProp, string _inStPlan, Single _inLat, Single _inLng)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.projelers.Where(q => q.projeid == _inProjeId).FirstOrDefault();
        //        if (value != null)
        //        {
        //            value.padi = _inProName;
        //            value.padres = _inAddress;
        //            value.pbilgiler = _inFo;
        //            value.peposta = _inComPost;
        //            value.pfaks = _inFaks;
        //            value.pgaleri = _inGalery;
        //            value.phakkinda = _inAbout;
        //            value.pil = _inProvId;
        //            value.pilce = _inDistId;
        //            value.pkatplan = _inPlan;
        //            value.pkoordinat = _inCoor;
        //            value.pozellik = _inProp;
        //            value.ptelefon = _inPhone;
        //            value.pvaziyetplan = _inStPlan;
        //            value.pwebsite = _inWebsite;
        //            value.plat = _inLat;
        //            value.plng = _inLng;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}

        //int existid = 0;

        //public class ProjectView
        //{
        //    public int ProjeId { get; set; }
        //    public string ProjeAdi { get; set; }
        //    public string FirmaLogo { get; set; }
        //    public string ProjeBilgiler { get; set; }
        //    public string Galeri { get; set; }
        //    public string IlAdi { get; set; }
        //    public string IlceAdi { get; set; }
        //}

        //public ProjectView getProjectRandomizer(int _inProvId, string _inIpAddress, bool _inView)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        Random rnd = new Random();

        //        var query = from p in idc.projelers.Where(x =>
        //                x.psilindmi == false && x.psatistami == true && x.ponay == true)
        //            select new
        //            {
        //                p.projeid,
        //                p.padi,
        //                p.firmalar.flogo,
        //                p.pbilgiler,
        //                p.pgaleri,
        //                p.iller.ilAdi,
        //                p.iller.ilId,
        //                p.ilceler.ilceAdi
        //            };

        //        if (_inProvId != -1)
        //        {
        //            var count = query.Where(x => x.ilId == _inProvId).Count();
        //            if (count > 0)
        //            {
        //                var subQuery = query.Where(x => x.ilId == _inProvId);
        //                int r = rnd.Next(subQuery.Count());
        //                var subData = subQuery.ToList()[r];
        //                var result = new ProjectView
        //                {
        //                    ProjeId = subData.projeid,
        //                    ProjeAdi = subData.padi,
        //                    ProjeBilgiler = subData.pbilgiler,
        //                    FirmaLogo = subData.flogo,
        //                    IlAdi = subData.ilAdi,
        //                    IlceAdi = subData.ilceAdi,
        //                    Galeri = subData.pgaleri
        //                };

        //                return result;
        //            }

        //        }
        //        else
        //        {
        //            var count = query.Count();
        //            if (count > 0)
        //            {
        //                int r = rnd.Next(query.Count());
        //                var subData = query.ToList()[r];
        //                var result = new ProjectView
        //                {
        //                    ProjeId = subData.projeid,
        //                    ProjeAdi = subData.padi,
        //                    ProjeBilgiler = subData.pbilgiler,
        //                    FirmaLogo = subData.flogo,
        //                    IlAdi = subData.ilAdi,
        //                    IlceAdi = subData.ilceAdi,
        //                    Galeri = subData.pgaleri
        //                };

        //                return result;
        //            }
        //        }

        //        return null;
        //    }

        //}

        //public projeler getLastProject()
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.projelers.OrderByDescending(x => x.projeid).First();
        //        return value;
        //    }
        //}

        /// <summary>
        /// güncelle
        /// </summary>
        /// <param name="_inopt"></param>
        /// <param name="_id"></param>
        /// <summary>
        /// ara
        /// </summary>
        /// <param name="_id"></param>
        /// <returns></returns>
        public projeler search(int _inProjeId)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                return idc.projelers.Where(q => q.projeid == _inProjeId).FirstOrDefault();
            }
        }

        /// <summary>
        /// sayısını döndür
        /// </summary>
        /// <param name="_intoid"></param>
        ///// <returns></returns>
        //public int count()
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = idc.projelers.Where(b => b.psilindmi == false && b.ponay == true && b.psatistami == true);
        //        return query.Count();
        //    }
        //}

        //public bool SpecialUserCtrlProject(int _inUserId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = idc.projelers.Where(q => q.pkullanicid == _inUserId && q.psilindmi == false).FirstOrDefault();
        //        if (query != null)
        //        {
        //            return true;
        //        }
        //        else
        //        {
        //            return false;
        //        }
        //    }
        //}

        public string SpecialUserProject(int _inUserId, int _index, int _inCount, IFormatter _inReturnType)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.projelers.Where(x => x.pkullanicid == _inUserId && x.psilindmi == false)
                            select new
                            {
                                i.projeid,
                                i.padi,
                                i.pgaleri,
                                i.iller.ilAdi,
                                i.ilceler.ilceAdi,
                                i.ponay,
                                i.psilindmi,
                                i.ptarih,
                                i.psatistami,
                                views = idc.ziyaretprojes.Where(x => x.gpid == i.projeid && x.gtip == false).Count(),
                                click = idc.ziyaretprojes.Where(x => x.gpid == i.projeid && x.gtip == true).Count()
                            };

                query = query.OrderByDescending(x => x.ptarih).Skip(_inCount * (_index)).Take(_inCount);

                formatter.FormatTo(_inReturnType);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }
        }

        //public void StatusProject(int _inProjeId, bool _inVeritfy, bool _inDeleted, bool _inSales)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.projelers.Where(q => q.projeid == _inProjeId).FirstOrDefault();

        //        if (value != null)
        //        {
        //            value.psilindmi = _inDeleted;
        //            value.ponay = _inVeritfy;
        //            value.psatistami = _inSales;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}

        public string FilterProject(int _index, int _count, int[] _income, ExternalClass.jsonintextDataType _intext, int _datatur)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var pageSize = _count;
                var pageIndex = _index;
                List<resimDataType> resimler = new List<resimDataType>();

                var query = from i in idc.projelers
                            where i.ponay == true && i.psilindmi == false && i.psatistami == true
                            select new
                            {
                                RowIndex = _index + 1,
                                i.projeid,
                                i.pil,
                                i.iller.ilAdi,
                                i.pilce,
                                i.ilceler.ilceAdi,
                                i.padi,
                                i.padres,
                                i.pbilgiler,
                                i.peposta,
                                i.pfaks,
                                i.ptelefon,
                                i.pvaziyetplan,
                                i.pwebsite,
                                i.pozellik,
                                i.pkoordinat,
                                i.pkatplan,
                                i.phakkinda,
                                i.firmalar.fadi,
                                i.pgaleri,
                                i.firmalar.flogo,
                                i.plat,
                                i.plng
                            };

                int ilId = _income[0],
                    ilceId = _income[1],
                    room = _income[2],
                    type = _income[3];

                if (_intext.isCoordinates == true)
                {
                    query = query.Where(q => q.pkoordinat != null);

                    if (_intext.isDrag == true)
                    {
                        query = query.Where(q => q.plat < _intext.koordinatlar.maxLat && q.plat > _intext.koordinatlar.minLat && q.plng < _intext.koordinatlar.maxLng && q.plng > _intext.koordinatlar.minLng);
                    }
                }


                if (ilId != -1)
                {
                    query = query.Where(q => q.pil == ilId);

                    if (ilceId != -1)
                    {
                        query = query.Where(q => q.pilce == ilceId);
                    }
                }


                if (room != -1)
                {
                    try
                    {
                        query = query.Where(q => q.pkatplan.Contains("<nofroom>" + room + "</nofroom>"));
                    }
                    catch (Exception)
                    {

                        throw;
                    }

                }

                if (type != -1)
                {
                    try
                    {
                        query = query.Where(q => q.pkatplan.Contains("<housing>" + type + "</housing>"));

                    }
                    catch (Exception)
                    {

                        throw;
                    }

                }


                List<projectDT> list = new List<projectDT>();

                query = query.OrderBy(x => x.RowIndex).Skip(pageSize * (pageIndex)).Take(pageSize);

                var dt = query.ToArray();
                int bas = pageSize * (pageIndex);
                int bitis = (pageSize * (pageIndex)) + pageSize;
                int art = 0;
                foreach (var item in dt)
                {
                    if (_intext.FiyatData.Max != "" || _intext.FiyatData.Min != "")
                    {

                        bool ekle = false;
                        string _infos = item.pbilgiler;
                        List<ExternalClass.pplanDT> planlist = new List<ExternalClass.pplanDT>();
                        planlist = (List<ExternalClass.pplanDT>)toolkit.GetObjectInXml(_infos, typeof(List<ExternalClass.pplanDT>));

                        double min = -1,
                           max = -1;

                        if (_intext.FiyatData.Min != "")
                            min = Convert.ToDouble(_intext.FiyatData.Min);
                        if (_intext.FiyatData.Max != "")
                            max = Convert.ToDouble(_intext.FiyatData.Max);

                        foreach (ExternalClass.pplanDT itemgiris in planlist)
                        {


                            if (min != -1 && max != -1)
                            {
                                if (max >= Convert.ToDouble(itemgiris.sqmeter) && min <= Convert.ToDouble(itemgiris.sqmeter))
                                {
                                    ekle = true;

                                }
                            }
                            if (min == -1 && max != -1)
                            {
                                if (max >= Convert.ToDouble(itemgiris.sqmeter))
                                {
                                    ekle = true;
                                }
                            }
                            if (min != -1 && max == -1)
                            {
                                if (min <= Convert.ToDouble(itemgiris.sqmeter))
                                {
                                    ekle = true;
                                }
                            }
                        }

                        if (ekle == true)
                        {
                            if (bas <= art && art < bitis)
                            {
                                string resdata = item.pgaleri;
                                List<ExternalClass.resimDataType> resler = new List<ExternalClass.resimDataType>();
                                resler = (List<ExternalClass.resimDataType>)DAL.toolkit.GetObjectInXml(resdata, typeof(List<ExternalClass.resimDataType>));

                                ExternalClass.resimDataType seciliresim = new ExternalClass.resimDataType();
                                if (resler.Count() == 0)
                                {
                                    seciliresim.resim = "noImage.jpg";
                                }
                                else
                                {
                                    foreach (ExternalClass.resimDataType rs in resler)
                                    {

                                        seciliresim.resim = "thmb_" + rs.resim;
                                        seciliresim.seciliMi = true;
                                        break;
                                    }
                                }

                                string projealani = "";
                                string konutsayisi = "";
                                string teslimtarihi = "";

                                List<BLL.ExternalClass.girilenDataType> txtlist = new List<BLL.ExternalClass.girilenDataType>();
                                txtlist = (List<BLL.ExternalClass.girilenDataType>)DAL.toolkit.GetObjectInXml(item.pbilgiler, typeof(List<BLL.ExternalClass.girilenDataType>));

                                foreach (var data in txtlist)
                                {

                                    if (data.ozellikId == 8756)
                                    {
                                        projealani = data.deger;
                                    }
                                    if (data.ozellikId == 8757)
                                    {
                                        konutsayisi = data.deger;
                                    }
                                    if (data.ozellikId == 8758)
                                        if (data.deger == "check")
                                            teslimtarihi = "Hemen Teslim";
                                        else
                                            teslimtarihi = data.deger;
                                }


                                list.Add(new ExternalClass.projectDT()
                                {
                                    proid = item.projeid,
                                    proname = item.padi,
                                    province = item.ilAdi,
                                    district = item.ilceAdi,
                                    image = seciliresim.resim,
                                    comlogo = item.flogo,
                                    comname = item.fadi,
                                    proplace = projealani,
                                    estatecnt = konutsayisi,
                                    deliverytime = teslimtarihi,
                                    coordinates = item.pkoordinat
                                });

                            }
                            art++;
                            if (art > bitis) break;
                        }

                    }
                    else
                    {
                        string resdata = item.pgaleri;
                        List<ExternalClass.resimDataType> resler = new List<ExternalClass.resimDataType>();
                        resler = (List<ExternalClass.resimDataType>)DAL.toolkit.GetObjectInXml(resdata, typeof(List<ExternalClass.resimDataType>));

                        ExternalClass.resimDataType seciliresim = new ExternalClass.resimDataType();
                        if (resler.Count() == 0)
                        {
                            seciliresim.resim = "noImage.jpg";
                        }
                        else
                        {
                            foreach (ExternalClass.resimDataType rs in resler)
                            {

                                seciliresim.resim = "thmb_" + rs.resim;
                                seciliresim.seciliMi = true;
                                break;
                            }
                        }

                        string projealani = "";
                        string konutsayisi = "";
                        string teslimtarihi = "";

                        List<BLL.ExternalClass.girilenDataType> txtlist = new List<BLL.ExternalClass.girilenDataType>();
                        txtlist = (List<BLL.ExternalClass.girilenDataType>)DAL.toolkit.GetObjectInXml(item.pbilgiler, typeof(List<BLL.ExternalClass.girilenDataType>));

                        foreach (var data in txtlist)
                        {

                            if (data.ozellikId == 8756)
                            {
                                projealani = data.deger;
                            }
                            if (data.ozellikId == 8757)
                            {
                                konutsayisi = data.deger;
                            }
                            if (data.ozellikId == 8758)
                                if (data.deger == "check")
                                    teslimtarihi = "Hemen Teslim";
                                else
                                    teslimtarihi = data.deger;
                        }

                        list.Add(new ExternalClass.projectDT()
                        {
                            proid = item.projeid,
                            proname = item.padi,
                            province = item.ilAdi,
                            district = item.ilceAdi,
                            image = seciliresim.resim,
                            comlogo = item.flogo,
                            comname = item.fadi,
                            proplace = projealani,
                            estatecnt = konutsayisi,
                            deliverytime = teslimtarihi,
                            coordinates = item.pkoordinat
                        });
                    }
                }

                if (_datatur == 1)
                {
                    return JsonConvert.SerializeObject(list);
                }
                else if (_datatur == 2)//xml
                {
                    return DAL.toolkit.GetXmlDataInObject(list).ToString();
                }
                else if (_datatur == 3)//html
                {
                    string sonuc = "";

                    foreach (var item in list)
                    {
                        sonuc += @"<div class='item-list'>
                                <div class='col-sm-3 no-padding photobox'>
                                    <div class='add-image'>
                                        <a href='property-details.html'>
                                            <img class='thumbnail no-margin' src='/upload/estate-projects/" + item.proid + @"/" + item.image + @"' alt='img' /></a>
                                    </div>
                                </div>
                                <div class='col-sm-6 add-desc-box'>
                                    <div class='add-details'>
                                        <h5 class='add-title'><a href='property-details.html'>" + item.proname + @"</a></h5>
                                        <span class='info-row'><span class='item-location'>" + item.province + @" - " + item.district + @" | <a><i class='icon-location-2'></i>Konum</a></span></span>
                                        <div class='prop-info-box'>
                                            <div class='prop-info'>
                                                <div class='clearfix prop-info-block'>
                                                    <span class='title '>" + item.proplace + @" m2</span>
                                                    <span class='text'>Proje Alanı</span>
                                                </div>
                                                <div class='clearfix prop-info-block middle'>
                                                    <span class='title prop-area'>" + item.estatecnt + @"</span>
                                                    <span class='text'>Konut Sayısı</span>
                                                </div>
                                                <div class='clearfix prop-info-block'>
                                                    <span class='title prop-room'>Teslim Tarihi</span>
                                                    <span class='text'>" + item.deliverytime + @" </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class='col-sm-3 text-right  price-box'>

                                    <h3 class='item-price '><strong>64 m2 - 216 m2 </strong></h3>
                                    <div style='clear: both'></div>

                                </div>
                            </div>";
                    }
                    return sonuc;
                }
                else
                {
                    return null;
                }
            }
        }

        public string CompanyProject(int _inWhoFrom, int _index, int _inCount, bool _inSales)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {

                var query = from i in idc.projelers.Where(i => i.psilindmi == false && i.ponay == true && i.psatistami == _inSales && i.pfirmaid == _inWhoFrom)
                            select new
                            {
                                i.projeid,
                                i.padi,
                                i.ptarih,
                                i.iller.ilAdi,
                                i.ilceler.ilceAdi,
                                i.pbilgiler,
                                i.pgaleri,
                                projeFormat = PublicHelper.Tools.URLConverter(i.padi)
                            };


                query = query.OrderByDescending(x => x.ptarih).Skip(_inCount * (_index)).Take(_inCount);

                JsonFormat jsonFormat = new JsonFormat();
                formatter.FormatTo(jsonFormat);
                formatter.rawData = query.ToList();
                return formatter.Format();
            }
        }


        //public string getProjectCountByProvince()
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = (from i in idc.projelers
        //                     where i.ponay == true && i.psilindmi == false && i.psatistami == true
        //                     group i by i.iller into g
        //                     select new provinCntDT
        //                     {
        //                         provId = g.Key.ilId,
        //                         provName = g.Key.ilAdi,
        //                         cnt = g.Count()
        //                     });

        //        JsonFormat jsonFromat = new JsonFormat();
        //        formatter.FormatTo(jsonFromat);
        //        formatter.rawData = query.ToList();
        //        return formatter.Format();
        //    }
        //}

        public object list(int _index, int _inCount, bool _inVerify, bool _inDeleted, bool _inSales, 
                           string _inAds, string _inEcho, int _income)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var query = from i in idc.projelers.Where(i => i.ponay == _inVerify && i.psilindmi == _inDeleted)
                            select new ilanDataType
                            {
                                ilanId = i.projeid,
                                resim = i.kullanici.kullaniciAdSoyad,
                                ilAdi = i.iller.ilAdi,
                                baslik = i.padi,
                                satisTarihi1 = String.Format(" {0:dd MMMM yyyy}", i.ptarih),
                                aciklama = String.Format("<a class='btn btn-primary btn-xs' target='_blank' href='/proje/{0}/{1}/detay'>Görüntüle</a><a class='btn btn-warning btn-xs' target='_blank' href='/management/anaYonetim/projeYonetimi/proje.aspx?page=duzenle&proje={1}'>Düzenle</a>", PublicHelper.Tools.URLConverter(i.padi),i.projeid)
                            };


                if (!String.IsNullOrEmpty(_inAds)) query = query.Where(q => q.ilanId.ToString() == _inAds);

                int totalCount = query.Count();
                int filteredCount = query.Count();

                query = query.OrderByDescending(x => x.ilanId).Skip(_index).Take(_inCount);

                var cmd = new
                {
                    draw = _inEcho,
                    recordsTotal = totalCount,
                    recordsFiltered = filteredCount,
                    data = query.ToList()
                };

                return cmd;
            }

        }
    }

}


