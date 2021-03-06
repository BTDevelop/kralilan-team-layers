﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using DAL.Abstract;
using KralilanProject.Entities;
using KralilanProject.Interfaces;

namespace BLL.Concrete
{
    public class OzellikManager : IOzellikService
    {
        private IOzelliklerDal _ozelliklerDal;
        public static readonly string selectVal = "select";
        public static readonly string textVal = "text";
        public static readonly string checkVal = "check";

        public OzellikManager(IOzelliklerDal ozelliklerDal)
        {
            _ozelliklerDal = ozelliklerDal;
        }

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
            return _ozelliklerDal.Get(Id);
        }

        public List<ozellikler> GetAll()
        {
            throw new NotImplementedException();
        }

        public List<Ozellik> GetAllByCategoriId(int CategoriId)
        {
            return _ozelliklerDal.GetAllByCategoriId(CategoriId);
        }

        public string GetPropValueId(int PropertyId, int PropertyValueId)
        {
            return _ozelliklerDal.GetPropValueId(PropertyId, PropertyValueId);
        }

        public void Update(ozellikler entity)
        {
            throw new NotImplementedException();
        }
    }
}
