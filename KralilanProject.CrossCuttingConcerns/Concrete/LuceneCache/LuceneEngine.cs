using Lucene.Net.Analysis;
using Lucene.Net.Analysis.Standard;
using Lucene.Net.Documents;
using Lucene.Net.Index;
using Lucene.Net.QueryParsers;
using Lucene.Net.Search;
using Lucene.Net.Store;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace KralilanProject.CrossCuttingConcerns.Concrete.LuceneCache
{
    public abstract class LuceneEngine
    {
        public Analyzer _Analyzer;
        public Directory _Directory;
        public IndexWriter _IndexWriter;
        public IndexSearcher _IndexSearcher;
        public Document _Document;
        public QueryParser _QueryParser;
        public Query _Query;
        public string _IndexPath = @"C:\LuceneIndex";

        public LuceneEngine()
        {
            _Analyzer = new StandardAnalyzer(Lucene.Net.Util.Version.LUCENE_30);
            _Directory = FSDirectory.Open(_IndexPath);
        }

    }
}
