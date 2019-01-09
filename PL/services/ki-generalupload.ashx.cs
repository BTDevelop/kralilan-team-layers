using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace PL.services
{
    /// <summary>
    /// Summary description for ki_generalupload
    /// </summary>
    public class ki_generalupload : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            string empty = context.Request.QueryString["emptydata"];
            string normalize = context.Request.QueryString["normalizedata"];
            string defdata= context.Request.QueryString["defdata"];
            string type = context.Request.QueryString["type"];
            string file = context.Request.QueryString["file"];

            if (!String.IsNullOrEmpty(type))
            {
                if (!String.IsNullOrEmpty(file))
                {
                    var strpath = "";

                    if (!String.IsNullOrEmpty(empty))
                    {
                        strpath = @"\upload\estate-projects\";
                    }

                    if (!String.IsNullOrEmpty(normalize))
                    {
                        strpath = @"\upload\estate-projects\" + defdata + @"\";
                    }

                    var originalDirectory = new DirectoryInfo(HttpContext.Current.Server.MapPath(strpath));

                    string pathString = "";
                    string path = "";

                    if (!String.IsNullOrEmpty(empty))
                    {
                        pathString = System.IO.Path.Combine(originalDirectory.ToString(), empty);
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
                            var emppath = @"\upload\estate-projects\";
                            var OD = new DirectoryInfo(HttpContext.Current.Server.MapPath(emppath));
                            pathString = System.IO.Path.Combine(OD.ToString(), normalize);
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
                SaveUploadedFile(context.Request.Files, empty, normalize);
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }


        public void SaveUploadedFile(HttpFileCollection httpFileCollection, string intemp1, string intemp2)
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
                    string strpath = "";
                    if (!String.IsNullOrEmpty(intemp1))
                    {
                        strpath = @"\upload\estate-projects\";

                        var originalDirectory = new DirectoryInfo(HttpContext.Current.Server.MapPath(strpath));
                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), intemp1);
                        var fileName1 = Path.GetFileName(file.FileName);
                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (!isExists)
                            System.IO.Directory.CreateDirectory(pathString);

                        var path = string.Format("{0}\\{1}", pathString, file.FileName);
                        file.SaveAs(path);
                    }
                    if (!String.IsNullOrEmpty(intemp2))
                    {
                        strpath = @"\upload\estate-projects\";

                        var originalDirectory = new DirectoryInfo(HttpContext.Current.Server.MapPath(strpath));

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), intemp2);

                        var fileName1 = Path.GetFileName(file.FileName);

                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (!isExists)
                            System.IO.Directory.CreateDirectory(pathString);

                        var path = string.Format("{0}\\{1}", pathString, file.FileName);
                        file.SaveAs(path);
                    }
                    if (String.IsNullOrEmpty(strpath))
                    {
                        break;
                    }
                }

            }

        }
    }
}