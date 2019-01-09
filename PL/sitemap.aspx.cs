using BLL;
using BLL.PublicHelper;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PL.sm
{
    public partial class sitemap : System.Web.UI.Page
    {
        ilanBll ilanb = new ilanBll();

        protected void Page_Load(object sender, EventArgs e)
        {
            List<BLL.ExternalClass.SiteMapCS> _lst = new List<BLL.ExternalClass.SiteMapCS>();

            string strpath = @"\sm\";
            string link;
            var originalDirectory = new DirectoryInfo(HttpContext.Current.Server.MapPath(strpath));

            StringBuilder strBuilder = new StringBuilder();

            string nowStr = System.IO.Path.Combine(originalDirectory.ToString(), "sitemap-pt-post-" + DateTime.Now.Year + "-" + DateTime.Now.Month.ToString("D2") + ".xml");

            for (int i = 2000; i <= DateTime.Now.Year; i++)
            {
                for (int j = 1; j < 13; j++)
                {

                    if (i == DateTime.Now.Year && j > DateTime.Now.Month)
                    {
                        break;
                    }

                    string pathString = System.IO.Path.Combine(originalDirectory.ToString(), "sitemap-pt-post-" + i + "-" + j.ToString("D2") + ".xml");
                    bool isExists = System.IO.File.Exists(pathString);


                    if (!isExists)
                    {
                        _lst = ilanb.getSitemapByYearAndMonth(i, j);
                        if (_lst.Count != 0)
                        {
                            System.IO.File.Create(pathString).Dispose();
                            strBuilder.AppendLine("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                            strBuilder.AppendLine("<urlset xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\" xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">");

                            foreach (var item in _lst)
                            {
                                strBuilder.AppendLine("<url>");
                                strBuilder.AppendLine("<loc>");

                                link = String.Format("https://www.kralilan.com/ilan/{0}-{1}/detay", Tools.URLConverter(item.baslik), item.ilanId);

                                strBuilder.AppendLine(link);
                                strBuilder.AppendLine("</loc>");
                                strBuilder.AppendLine("<changefreq>");
                                strBuilder.AppendLine("hourly");
                                strBuilder.AppendLine("</changefreq>");
                                strBuilder.AppendLine("<priority>");
                                strBuilder.AppendLine("0.5");
                                strBuilder.AppendLine("</priority>");
                                strBuilder.AppendLine("</url>");
                            }


                            strBuilder.AppendLine("</urlset>");

                            TextWriter tWriter = new StreamWriter(pathString);
                            tWriter.Write(strBuilder.ToString());
                            tWriter.Flush();
                            tWriter.Close();
                            strBuilder.Clear();
                        }
                    }

                    else
                    {
                        if (nowStr.Equals(pathString))
                        {
                            _lst = ilanb.getSitemapByYearAndMonth(i, j);
                            if (_lst.Count != 0)
                            {
                                strBuilder.AppendLine("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
                                strBuilder.AppendLine("<urlset xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\" xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">");

                                foreach (var item in _lst)
                                {
                                    strBuilder.AppendLine("<url>");
                                    strBuilder.AppendLine("<loc>");

                                    link = String.Format("https://www.kralilan.com/ilan/{0}-{1}/detay", Tools.URLConverter(item.baslik), item.ilanId);

                                    strBuilder.AppendLine(link);
                                    strBuilder.AppendLine("</loc>");
                                    strBuilder.AppendLine("<changefreq>");
                                    strBuilder.AppendLine("weekly");
                                    strBuilder.AppendLine("</changefreq>");
                                    strBuilder.AppendLine("<priority>");
                                    strBuilder.AppendLine("0.5");
                                    strBuilder.AppendLine("</priority>");
                                    strBuilder.AppendLine("</url>");
                                }


                                strBuilder.AppendLine("</urlset>");

                                TextWriter tWriter = new StreamWriter(pathString);
                                tWriter.Write(strBuilder.ToString());
                                tWriter.Flush();
                                tWriter.Close();
                                strBuilder.Clear();

                            }
                        }
                    }
                }
            }

            strBuilder.AppendLine("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
            strBuilder.AppendLine("<sitemapindex xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\" xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">");

            string[] filesXML = Directory.GetFiles(originalDirectory.ToString(), "*.xml");
            string year = DateTime.Now.Year.ToString();
            string month = DateTime.Now.Month.ToString("D2");
            string day = "";

            foreach (var item in filesXML)
            {

                day = DateTime.Now.Day.ToString("D2");

                FileInfo fileInfo = new FileInfo(item);

                if (!fileInfo.Name.Equals("sitemap.xml"))
                {
                    year = fileInfo.Name.Split('-')[3];
                    month = fileInfo.Name.Split('-')[4].Split('.')[0];

                    if (!(year == DateTime.Now.Year.ToString() && month == DateTime.Now.Month.ToString("D2")))
                    {
                        day = 15.ToString();
                    }
                }




                strBuilder.AppendLine("<sitemap>");
                strBuilder.AppendLine("<loc>");

                link = "https://www.kralilan.com/sm/" + fileInfo.Name;

                strBuilder.AppendLine(link);
                strBuilder.AppendLine("</loc>");
                strBuilder.AppendLine("<lastmod>");
                strBuilder.AppendLine(year + "-" + month + "-" + day);
                strBuilder.AppendLine("</lastmod>");
                strBuilder.AppendLine("</sitemap>");
            }


            strBuilder.AppendLine("</sitemapindex>");

            Response.ContentType = "text/xml";
            Response.Write(strBuilder.ToString());
            Response.End();
        }
    }
}