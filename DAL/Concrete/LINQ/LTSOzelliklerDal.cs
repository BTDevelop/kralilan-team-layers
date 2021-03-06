﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL.Abstract;
using KralilanProject.Entities;

namespace DAL.Concrete.LINQ
{
    public class LTSOzelliklerDal : IOzelliklerDal
    {
        private ilanDataContext idc = new ilanDataContext();

        public void Add(ozellikler entity)
        {
            throw new NotImplementedException();
        }

        public void Delete(ozellikler entity)
        {
            throw new NotImplementedException();
        }

        public ozellikler Get(int Id)
        {
            var value = idc.ozelliklers.Where(x => x.ozellikId == Id).FirstOrDefault();
            return value;
        }

        public ozellikler Get(ozellikler entity)
        {
            throw new NotImplementedException();
        }

        public List<ozellikler> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<Ozellik> GetAllByCategoriId(int CategoriId)
        {
            var query = idc.ozelliklers;

            List<Ozellik> OzelliklerList = new List<Ozellik>();

            foreach (var item in query)
            {
                if (!String.IsNullOrEmpty(item.kategoriId))
                {
                    string[] Kategoriler = item.kategoriId.Split('#');

                    foreach (var kategori in Kategoriler)
                    {
                        if (kategori == CategoriId.ToString())
                        {
                            var data = new Ozellik
                            {
                                OzellikId = Convert.ToInt32(item.ozellikId),
                                OzellikAdi = item.ozellikAdi,
                                Tipi = item.ozellikTipi,
                                Degeri = item.ozellikDeger,
                                FiltreMi = Convert.ToBoolean(item.filtredeMi),
                                SayisalMi = Convert.ToBoolean(item.sayisalMi),
                                Kategori = item.kategoriId,
                                DetayMi = Convert.ToBoolean(item.detaydaMı)
                            };

                            OzelliklerList.Add(data);

                        }
                    }
                }
                else
                {
                    var data = new Ozellik
                    {
                        OzellikId = Convert.ToInt32(item.ozellikId),
                        OzellikAdi = item.ozellikAdi,
                        Tipi = item.ozellikTipi,
                        Degeri = item.ozellikDeger,
                        FiltreMi = Convert.ToBoolean(item.filtredeMi),
                        SayisalMi = Convert.ToBoolean(item.sayisalMi),
                        Kategori = item.kategoriId,
                        DetayMi = Convert.ToBoolean(item.detaydaMı)

                    };

                    OzelliklerList.Add(data);

                }
            }

            return OzelliklerList;
        }

        public string GetPropValueId(int PropertyId, int PropertyValueId)
        {
            var value = idc.ozelliklers.Where(x => x.ozellikId == PropertyId).FirstOrDefault();
            string[] arrProp = value.ozellikTipi.Split('|');

            string propValue = null;
            int propValueId = -1;
            for (int i = 0; i < arrProp.Length; i++)
            {
                propValueId = Convert.ToInt32(arrProp[i].Split('#')[0]);

                if (propValueId == PropertyValueId)
                {
                    propValue = arrProp[i].Split('#')[1];
                    break;
                }
            }

            return propValue;
        }

        public void Update(ozellikler entity)
        {
            throw new NotImplementedException();
        }
    }
}
