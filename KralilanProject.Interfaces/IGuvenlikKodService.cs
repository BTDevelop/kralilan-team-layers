using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace KralilanProject.Interfaces
{
    public interface IGuvenlikKodService
    {
        List<guvenlikKodlari> GetAll();

        guvenlikKodlari Get(int Id);

        void Add(guvenlikKodlari entity);

        void Delete(guvenlikKodlari entity);

        void Update(guvenlikKodlari entity);

        guvenlikKodlari GetBySecureCode(string Code);

        guvenlikKodlari GetByPhone(string Phone);
    }
}
