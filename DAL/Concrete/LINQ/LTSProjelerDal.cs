using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;
using KralilanProject.Entities;

namespace DAL.Concrete.LINQ
{
    public class LTSProjelerDal : IProjelerDal
    {
        private ilanDataContext idc = new ilanDataContext();
        private readonly int pageIndex = 0, pageCount = 10;
        public void Add(projeler entity)
        {
            projeler proje = new projeler();
            proje.padi = entity.padi;
            proje.padres = entity.padres;
            proje.pbilgiler = entity.pbilgiler;
            proje.peposta = entity.peposta;
            proje.pfaks = entity.pfaks;
            proje.pgaleri = entity.pgaleri;
            proje.phakkinda = entity.phakkinda;
            proje.pil = entity.pil;
            proje.pilce = entity.pilce;
            proje.pkatplan = entity.pkatplan;
            proje.pkoordinat = entity.pkoordinat;
            proje.pozellik = entity.pozellik;
            proje.ptelefon = entity.ptelefon;
            proje.pvaziyetplan = entity.pvaziyetplan;
            proje.pwebsite = entity.pwebsite;
            proje.pkullanicid = entity.pkullanicid;
            proje.pfirmaid = entity.pfirmaid;
            proje.ponay = entity.ponay;
            proje.psatistami = entity.psatistami;
            proje.psilindmi = entity.psilindmi;
            proje.ptarih = DateTime.Now;
            idc.projelers.InsertOnSubmit(proje);
            idc.SubmitChanges();
        }

        public int Count()
        {
            var query = idc.projelers.Where(b => b.psilindmi == false && b.ponay == true && b.psatistami == true);
            return query.Count();
        }

        public List<IlanSayi> CountAllByRegionId()
        {
            var query = from i in idc.projelers
                where i.ponay == true && i.psilindmi == false && i.psatistami == true
                group i by i.iller into g
                select new IlanSayi
                {
                    Id = g.Key.ilId,
                    Adi = g.Key.ilAdi,
                    Sayi = g.Count()
                };

            return query.ToList();
        }

        public void Delete(projeler entity)
        {
            throw new NotImplementedException();
        }

        public projeler Get(int Id)
        {
            return idc.projelers.Where(q => q.projeid == Id).FirstOrDefault();
        }

        public projeler Get(projeler entity)
        {
            throw new NotImplementedException();
        }

        public List<projeler> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<Proje> GetByCompanyId(int CompanyId)
        {
            var query = from i in idc.projelers.Where(i => i.psilindmi == false && i.ponay == true && i.pfirmaid == CompanyId)
                select new Proje
                {
                    ProjeId = i.projeid,
                    ProjeAdi = i.padi,
                    BaslangicTarihi = Convert.ToDateTime(i.ptarih),
                    IlAdi = i.iller.ilAdi,
                    IlceAdi = i.ilceler.ilceAdi,
                    ProjeBilgiler = i.pbilgiler,
                    Galeri = i.pgaleri,
                    SatistaMi = Convert.ToBoolean(i.psatistami)
                };

            query = query.OrderByDescending(x => x.BaslangicTarihi).Skip(pageCount * (pageIndex)).Take(pageCount);
            return query.ToList();
        }

        public List<Proje> GetByUserId(int UserId)
        {
            var query = from i in idc.projelers.Where(x => x.pkullanicid == UserId && x.psilindmi == false)
                select new Proje
                {
                    ProjeId = i.projeid,
                    ProjeAdi = i.padi,
                    Galeri = i.pgaleri,
                    IlAdi = i.iller.ilAdi,
                    IlceAdi = i.ilceler.ilceAdi,
                    BaslangicTarihi = Convert.ToDateTime(i.ptarih)
                };

            query = query.OrderByDescending(x => x.BaslangicTarihi).Skip(pageCount * (pageIndex)).Take(pageCount);

            return query.ToList();
        }

        public projeler GetLast()
        {
            var value = idc.projelers.OrderByDescending(x => x.projeid).First();
            return value;
        }

        public List<Proje> GetRandom(int RegionId)
        {
            var query = from p in idc.projelers.Where(x =>
                    x.psilindmi == false && x.psatistami == true && x.ponay == true)
                select new Proje
                {
                    ProjeId = p.projeid,
                    ProjeAdi = p.padi,
                    FirmaLogo = p.firmalar.flogo,
                    ProjeBilgiler = p.pbilgiler,
                    Galeri = p.pgaleri,
                    IlAdi = p.iller.ilAdi,
                    IlId = p.iller.ilId,
                    IlceAdi = p.ilceler.ilceAdi
                };

            return query.ToList();
        }

        public bool IsByUserId(int UserId)
        {
            var query = idc.projelers.Where(q => q.pkullanicid == UserId && q.psilindmi == false).FirstOrDefault();
            return (query != null) ? true : false;
        }

        public void Update(projeler entity)
        {
            var value = idc.projelers.Where(q => q.projeid == entity.projeid).FirstOrDefault();
            if (value != null)
            {
                value.padi = entity.padi;
                value.padres = entity.padres;
                value.pbilgiler = entity.pbilgiler;
                value.peposta = entity.peposta;
                value.pfaks = entity.pfaks;
                value.pgaleri = entity.pgaleri;
                value.phakkinda = entity.phakkinda;
                value.pil = entity.pil;
                value.pilce = entity.pilce;
                value.pkatplan = entity.pkatplan;
                value.pkoordinat = entity.pkoordinat;
                value.pozellik = entity.pozellik;
                value.ptelefon = entity.ptelefon;
                value.pvaziyetplan = entity.pvaziyetplan;
                value.pwebsite = entity.pwebsite;
                value.plat = entity.plat;
                value.plng = entity.plng;
                idc.SubmitChanges();
            }
        }

        public void UpdateLast(projeler entity)
        {
            var value = idc.projelers.Where(q => q.projeid == entity.projeid).FirstOrDefault();
            if (value != null)
            {
                value.pgaleri = entity.pgaleri;
                value.pkatplan = entity.pkatplan;
                value.pvaziyetplan = entity.pvaziyetplan;
                idc.SubmitChanges();
            }
        }

        public void UpdateStatus(projeler entity)
        {
            var value = idc.projelers.Where(q => q.projeid == entity.projeid).FirstOrDefault();
            if (value != null)
            {
                value.psilindmi = entity.psilindmi;
                value.ponay = entity.ponay;
                value.psatistami = entity.psatistami;
                idc.SubmitChanges();
            }
        }
    }
}
