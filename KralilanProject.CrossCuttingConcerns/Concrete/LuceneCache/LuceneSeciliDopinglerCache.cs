using DAL;
using DAL.Abstract;
using DAL.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using KralilanProject.CrossCuttingConcerns.Abstract;
using Lucene.Net.Index;
using Lucene.Net.Documents;

namespace KralilanProject.CrossCuttingConcerns.Concrete.LuceneCache
{
    public class LuceneSeciliDopinglerCache : LuceneEngine, ISeciliDopinglerCache
    {

        public LuceneSeciliDopinglerCache() : base()
        {
            
        }

        public void AddToCache(List<seciliDoping> values)
        {
            using (_IndexWriter = new IndexWriter(_Directory, _Analyzer, IndexWriter.MaxFieldLength.UNLIMITED))
            {
                foreach (var loopEntity in values)
                {
                    _Document = new Document();

                    foreach (var loopProperty in loopEntity.GetType().GetProperties())
                    {
                        _Document.Add(new Field(loopProperty.Name, loopProperty.GetValue(loopEntity).ToString(), Field.Store.YES, Field.Index.ANALYZED));
                        _IndexWriter.AddDocument(_Document);
                        _IndexWriter.Optimize();
                        _IndexWriter.Commit();
                    }
                }
            }
        }

        public void DeleteToCache(seciliDoping value)
        {
            throw new NotImplementedException();
        }

        public List<seciliDoping> GetAllFromCache()
        {
            throw new NotImplementedException();
        }

        public void UpdateToCache(List<seciliDoping> values)
        {
            throw new NotImplementedException();
        }
    }
}
