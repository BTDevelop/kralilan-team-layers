using BLL.ExternalClass;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class ozelliklerBll
    {
        /// <summary>
        /// 
        /// </summary>
        public static readonly string selectVal = "select";
        public static readonly string textVal = "text";
        public static readonly string checkVal = "check";

        /// <summary>
        /// sil
        /// </summary>
        /// <param name="_id"></param>
        //public void delete(int _id)
        //{
        //    throw new NotImplementedException();
        //}
        /// <summary>
        /// ekle
        /// </summary>
        /// <param name="_income"></param>
        //public void insert(string _income)
        //{
        //    throw new NotImplementedException();
        //}
        /// <summary>
        /// güncelle
        /// </summary>
        /// <param name="_id"></param>
        /// <param name="_income"></param>
        //public void update(int _id, string _income)
        //{
        //    throw new NotImplementedException();
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inPropId"></param>
        /// <returns></returns>
        //public ozellikler search(int _inPropId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var value = idc.ozelliklers.Where(x => x.ozellikId == _inPropId).FirstOrDefault();
        //        return value;
        //    }
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inPropId"></param>
        /// <param name="inPropValueId"></param>
        /// <returns></returns>
        public string searchPropValue(int _inPropId, int inPropValueId)
        {
            using (ilanDataContext idc = new ilanDataContext())
            {
                var value = idc.ozelliklers.Where(x => x.ozellikId == _inPropId).FirstOrDefault();

                string[] arrProp = value.ozellikTipi.Split('|');

                string propValue = null;
                int propValueId = -1;
                for (int i = 0; i < arrProp.Length; i++)
                {
                    propValueId = Convert.ToInt32(arrProp[i].Split('#')[0]);

                    if (propValueId == inPropValueId)
                    {
                        propValue = arrProp[i].Split('#')[1];
                        break;
                    }
                }

                return propValue;
            }
        }

        /// <summary>
        /// listele
        /// </summary>
        /// <returns></returns>
        //public List<ozelliklerDT> select(string _inCatId)
        //{
        //    using (ilanDataContext idc = new ilanDataContext())
        //    {
        //        var query = idc.ozelliklers;

        //        List<ozelliklerDT> propForm = new List<ozelliklerDT>();

        //        foreach (var item in query)
        //        {
        //            if (!String.IsNullOrEmpty(item.kategoriId))
        //            {
        //                string[] array = item.kategoriId.Split('#');

        //                foreach (var item2 in array)
        //                {
        //                    if (item2 == _inCatId)
        //                    {
        //                        var data = new ozelliklerDT
        //                        {
        //                            propertid = Convert.ToInt32(item.ozellikId),
        //                            propertname = item.ozellikAdi,
        //                            properttype = item.ozellikTipi,
        //                            propertvalue = item.ozellikDeger,
        //                            propfilter = Convert.ToBoolean(item.filtredeMi),
        //                            propnum = Convert.ToBoolean(item.sayisalMi),
        //                            propertcate = item.kategoriId,
        //                            propdetail = Convert.ToBoolean(item.detaydaMı)
        //                        };

        //                        propForm.Add(data);

        //                    }
        //                }
        //            }
        //            else
        //            {
        //                var data = new ozelliklerDT
        //                {
        //                    propertid = Convert.ToInt32(item.ozellikId),
        //                    propertname = item.ozellikAdi,
        //                    properttype = item.ozellikTipi,
        //                    propertvalue = item.ozellikDeger,
        //                    propfilter = Convert.ToBoolean(item.filtredeMi),
        //                    propnum = Convert.ToBoolean(item.sayisalMi),
        //                    propertcate = item.kategoriId,
        //                    propdetail = Convert.ToBoolean(item.detaydaMı)

        //                };

        //                propForm.Add(data);

        //            }
        //        }

        //        return propForm;
        //    }
        //}
    }
}
