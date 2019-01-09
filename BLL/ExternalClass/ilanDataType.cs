using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL.ExternalClass
{
    public class ilanDataType
    {
        public int ilanId,
                   ilId,
                   ilceId,
                   mahalleId,
                   magazaId,
                   kullaniciId,
                   onay,
                   magazaTurId;

        public double fiyat;

        public Single lat,
                      lng;

        public string baslik,
                      ilAdi,
                      ilceAdi,
                      mahalleAdi,
                      resim,
                      aciklama,
                      koordinat,
                      satisTarihi1,
                      satisTarihi2,
                      fiyatTurId,
                      kategoriAdi,
                      turAdi,
                      girilenOzellik,
                      secilenOzellik
            ;

        
        public DateTime baslangicTarihi,
                        bitisTarihi;

        public bool pasif,
                    silindi,
                    numaraYayin,
                    fiyatiDustu,
                    satildi,
                    guncelMi,
                    acilMi;

        public List<resimDataType> resimList = new List<resimDataType>();
        public List<girilenDataType> girilenOzellikList = new List<girilenDataType>();
        public List<secilenDataType> secilen = new List<secilenDataType>();

    }
}
