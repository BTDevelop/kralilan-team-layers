﻿using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KralilanProject.Entities;

namespace KralilanProject.Interfaces
{
    public interface IOdemeService
    {
        List<odeme> GetAll();

        odeme Get(int Id);

        void Add(odeme entity);

        void Delete(odeme entity);

        void Update(odeme entity);

        odeme GetLast();

        List<Odeme> GetByProjeId(int ProjeId);

    }
}
