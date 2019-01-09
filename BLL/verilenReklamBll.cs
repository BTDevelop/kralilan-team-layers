using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class verilenReklamBll
    {
        //public void delete(int _id)
        //{
        //    throw new NotImplementedException();
        //}
        /// <summary>
        /// ekle
        /// </summary>
        /// <param name="_inadid"></param>
        /// <param name="_inuserid"></param>
        /// <param name="_inadname"></param>
        /// <param name="_inadphoto"></param>
        /// <param name="_inadproid"></param>
        /// <param name="_instrtdt"></param>
        /// <param name="_inenddt"></param>
        /// <param name="_inadlink"></param>
        /// <param name="_inpas"></param>
        /// <param name="_inok"></param>
        //public void insert(int _inAdvertId, int _inUserId, string _inAdvertName, string _inAdverPic, int _inProvId, 
        //                   DateTime _inStartDate, DateTime _inEndDate, string _inAdvertLink, bool _inPass, bool _inVeritfy)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        verilenReklam reklam = new verilenReklam();
        //        reklam.reklamId = _inAdvertId;
        //        reklam.kullaniciId = _inUserId;
        //        reklam.reklamAdi = _inAdvertName;
        //        reklam.reklamResim = _inAdverPic;
        //        if (_inProvId != -1) reklam.ilId = Convert.ToInt32(_inProvId);
        //        reklam.baslangicTarihi = _inStartDate;
        //        reklam.bitisTarihi = _inEndDate;
        //        reklam.reklamLink = _inAdvertLink;
        //        reklam.pasifMi = _inPass;
        //        reklam.onay = _inVeritfy;
        //        idc.verilenReklams.InsertOnSubmit(reklam);
        //        idc.SubmitChanges();
        //    }
        //}
        /// <summary>
        /// ara
        /// </summary>
        /// <param name="_id"></param>
        /// <returns></returns>
        //public verilenReklam search(int _id)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        return idc.verilenReklams.Where(q => q.reklamId == _id).FirstOrDefault();
        //    }
        //}
        //public void update(int _inOpt, int _inAddAdvertId, int _inUserId, string _inAdvertName, int _inAdvertId, 
        //                   int _inProvId, DateTime _inStartDate, DateTime _inEndDate, bool _inPass, bool _inVeritfy, 
        //                   string _inAdvertPic, string _inAdvertLink)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.verilenReklams.Where(q => q.verilenReklamId == _inAddAdvertId).FirstOrDefault();
        //        if (value != null)
        //        {
        //            if (_inOpt == 1)
        //            {
        //                value.onay = _inVeritfy;
        //            }
        //            if (_inOpt == 2)
        //            {
        //                value.pasifMi = _inPass;
        //                value.onay = _inVeritfy;
        //            }
        //            if (_inOpt == 3)
        //            {
        //                value.kullaniciId = _inUserId;
        //                value.reklamAdi = _inAdvertName;
        //                value.reklamId = _inAdvertId;
        //                if (_inProvId != -1) value.ilId = _inProvId;              
        //                value.baslangicTarihi = _inStartDate;
        //                value.bitisTarihi = _inEndDate;
        //                value.pasifMi = _inPass;
        //                value.onay = _inVeritfy;
        //            }
        //            if (_inOpt == 4)
        //            {
        //                value.reklamResim = _inAdvertPic;
        //            }

        //            idc.SubmitChanges();
        //        }
        //    }
        //}
        //public verilenReklam getLastAdvert()
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.verilenReklams.OrderByDescending(x => x.verilenReklamId).First();
        //        return value;
        //    }
        //}
        //public void insertAdvertPic(int _inAdvertId, string _inAdvertPic)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.verilenReklams.Where(q => q.verilenReklamId == _inAdvertId).FirstOrDefault();
        //        if (value != null)
        //        {
        //            value.reklamResim = _inAdvertPic;
        //            idc.SubmitChanges();
        //        }
        //    }
        //}


        //public object select(int _index, int _count, bool _income, string _insearch, string _inecho)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = from v in idc.verilenReklams.Where(v => v.onay == _income & v.pasifMi == false)
        //                    select new
        //                    {
        //                        v.kullanici.kullaniciAdSoyad,
        //                        v.verilenReklamId,
        //                        v.reklamAdi,
        //                        v.baslangicTarihi,
        //                        v.bitisTarihi,
        //                        v.iller.ilAdi,
        //                        v.reklam.reklamTurId,
        //                        reklamTurAdi = v.reklam.reklamTurId == 1 ? "Site Reklamı" : "Harita Çevresi Reklamı"
        //                    };


        //        if (String.IsNullOrEmpty(_insearch) == false)
        //        {
        //            query = query.Where(x => x.reklamAdi.IndexOf(_insearch) != -1);
        //        }

        //        int totalCount = idc.verilenReklams.Count(v => v.onay == _income & v.pasifMi == false);

        //        int filterCount = query.Count();

        //        query = query.Skip(_index).Take(_count); ;
        //        List<verilenReklam> list = new List<verilenReklam>();
        //        var data = query.ToList();


        //        for (int i = 0; i < data.Count(); i++)
        //        {
        //            if (data[i].reklamTurId == 1)
        //            {
        //                list.Add(
        //                    new verilenReklam
        //                    {
        //                        verilenReklamId = data[i].verilenReklamId,
        //                        reklamAdi = data[i].reklamAdi,
        //                        baslangicTarihi = data[i].baslangicTarihi,
        //                        bitisTarihi = data[i].bitisTarihi,
        //                        reklamLink = data[i].reklamTurAdi
        //                    });
        //            }

        //            else if (data[i].reklamTurId == 2)
        //            {
        //                list.Add(
        //                     new verilenReklam
        //                     {
        //                         verilenReklamId = data[i].verilenReklamId,
        //                         reklamAdi = data[i].reklamAdi,
        //                         baslangicTarihi = data[i].baslangicTarihi,
        //                         bitisTarihi = data[i].bitisTarihi,
        //                         reklamLink = data[i].reklamTurAdi,
        //                         reklamResim = @"<a class='btn btn-warning btn-xs' href='#" + data[i].verilenReklamId + @"'>Düzenle</a>"
        //                     });
        //            }

        //        }
        //        var cmd = new
        //        {
        //            draw = _inecho,
        //            recordsTotal = totalCount,
        //            recordsFiltered = filterCount,
        //            data = list
        //        };

        //        return cmd;
        //    }
        //}

    }
}
