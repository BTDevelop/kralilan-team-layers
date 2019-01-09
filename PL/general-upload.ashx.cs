using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace PL
{
    /// <summary>
    /// Summary description for general_upload
    /// </summary>
    public class general_upload : IHttpHandler
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="context"></param>
        public void ProcessRequest(HttpContext context)
        {
            string temp = context.Request.QueryString["tempnumber"];
            string filetype = context.Request.QueryString["filetype"];
            string file = context.Request.QueryString["file"];
            string tip = context.Request.QueryString["type"];
            if (!String.IsNullOrEmpty(tip))
            {
                if (!String.IsNullOrEmpty(filetype))
                {
                    var strpath = "";

                    if (filetype == "ads")
                    {
                        strpath = @"\upload\reklam\";
                    }
                    if (filetype == "store")
                    {
                        strpath = @"\upload\magaza\";
                    }

                    var originalDirectory = new DirectoryInfo(HttpContext.Current.Server.MapPath(strpath));
                    string pathString = "";
                    string path = "";
                    if (!String.IsNullOrEmpty(temp))
                    {
                        pathString = System.IO.Path.Combine(originalDirectory.ToString(), temp);
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
                        //else
                        //{
                        //    pathString = System.IO.Path.Combine(originalDirectory.ToString(), ilanId);
                        //    path = string.Format("{0}\\{1}", pathString, file);
                        //}

                        //path = string.Format("{0}\\{1}", originalDirectory, file);

                        //string mypath = System.IO.Path.Combine(strpath, file);
                    }

                    System.IO.File.Delete(path);
                }
            }
            else
            {
                SaveUploadedFile(context.Request.Files, temp, filetype);
            }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="httpFileCollection"></param>
        /// <param name="_temp"></param>
        /// <param name="_filetype"></param>
        public void SaveUploadedFile(HttpFileCollection httpFileCollection, string _temp, string _filetype)
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
                    if (!String.IsNullOrEmpty(_temp))
                    {
                        if (_filetype == "ads")
                        {
                            strpath = @"\upload\reklam\";
                        }
                        if (_filetype == "store")
                        {
                            strpath = @"\upload\magaza\";
                        }


                        var originalDirectory = new DirectoryInfo(HttpContext.Current.Server.MapPath(strpath));

                        string pathString = System.IO.Path.Combine(originalDirectory.ToString(), _temp);

                        var fileName1 = Path.GetFileName(file.FileName);

                        bool isExists = System.IO.Directory.Exists(pathString);

                        if (!isExists)
                            System.IO.Directory.CreateDirectory(pathString);

                        var path = string.Format("{0}\\{1}", pathString, file.FileName);
                        file.SaveAs(path);
                    }
                    //if (!String.IsNullOrEmpty(ilanId))
                    //{
                    //    strpath = @"\upload\ilan\";

                    //    var originalDirectory = new DirectoryInfo(HttpContext.Current.Server.MapPath(strpath));

                    //    string pathString = System.IO.Path.Combine(originalDirectory.ToString(), ilanId);

                    //    var fileName1 = Path.GetFileName(file.FileName);

                    //    bool isExists = System.IO.Directory.Exists(pathString);

                    //    if (!isExists)
                    //        System.IO.Directory.CreateDirectory(pathString);

                    //    var path = string.Format("{0}\\{1}", pathString, file.FileName);
                    //    file.SaveAs(path);
                    //}
                    if (String.IsNullOrEmpty(strpath))
                    {
                        break;
                    }
                }

            }

        }
    }
}