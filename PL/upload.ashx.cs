using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace PL
{
    /// <summary>
    /// Summary description for upload
    /// </summary>
    public class upload : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string gecici = context.Request.QueryString["gecicilanid"];
            string ilanId = context.Request.QueryString["ilanId"];
            string tip = context.Request.QueryString["type"];
            string file = context.Request.QueryString["file"];
            if(!String.IsNullOrEmpty(tip))
            {
                if(!String.IsNullOrEmpty(file))
                {
                 var strpath="";

                    if (!String.IsNullOrEmpty(gecici))
                    {
                        strpath = @"\upload\ilan\";
                    }
                    if(!String.IsNullOrEmpty(ilanId))
                    {
                        strpath = @"\upload\ilan\";

                    }

                    var originalDirectory = new DirectoryInfo(HttpContext.Current.Server.MapPath(strpath));
                    string pathString="";
                    string path = "";
                    if (!String.IsNullOrEmpty(gecici))
                    {
                        pathString = System.IO.Path.Combine(originalDirectory.ToString(), gecici);
                        path = string.Format("{0}\\{1}", pathString, file);

                    }
                    else
                    {
                        string mypathString = System.IO.Path.Combine(originalDirectory.ToString(), file);
                        bool isExists = System.IO.File.Exists(mypathString);

                        if (isExists)
                        {
                            path = mypathString;
                            string thmbpath = System.IO.Path.Combine(originalDirectory.ToString(), "thmb_" + file);
                            System.IO.File.Delete(thmbpath);
                        }
                        else
                        {
                            pathString = System.IO.Path.Combine(originalDirectory.ToString(), ilanId);
                            path = string.Format("{0}\\{1}", pathString, file);
                        }

                        //path = string.Format("{0}\\{1}", originalDirectory, file);

                        //string mypath = System.IO.Path.Combine(strpath, file);
                    }

                    System.IO.File.Delete(path);
                }

            }
            else
            {
                SaveUploadedFile(context.Request.Files, gecici,ilanId);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }


        public void SaveUploadedFile(HttpFileCollection httpFileCollection, string geciciIlanId, string ilanId)
        {
            //bool isSavedSuccessfully = true;
            string fName = "";
            foreach (string fileName in httpFileCollection)
            {
                HttpPostedFile file = httpFileCollection.Get(fileName);
                //Save file content goes here
                fName = file.FileName;
                if (file != null && file.ContentLength > 0)
                {
                    string strpath="";
                    if (!String.IsNullOrEmpty(geciciIlanId))
                    {
                        strpath = @"\upload\ilan\";

                        var originalDirectory = new DirectoryInfo(HttpContext.Current.Server.MapPath(strpath));

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), geciciIlanId);

                        var fileName1 = Path.GetFileName(file.FileName);

                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (!isExists)
                            System.IO.Directory.CreateDirectory(pathString);

                        var path = string.Format("{0}\\{1}", pathString, file.FileName);
                        file.SaveAs(path);
                    }
                    if (!String.IsNullOrEmpty(ilanId))
                    {
                        strpath = @"\upload\ilan\";

                        var originalDirectory = new DirectoryInfo(HttpContext.Current.Server.MapPath(strpath));

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), ilanId);

                        var fileName1 = Path.GetFileName(file.FileName);

                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (!isExists)
                            System.IO.Directory.CreateDirectory(pathString);

                        var path = string.Format("{0}\\{1}", pathString, file.FileName);
                        file.SaveAs(path);
                    }
                    if(String.IsNullOrEmpty(strpath))
                    {
                        break;
                    }            
                }

            }

        }

    }
}