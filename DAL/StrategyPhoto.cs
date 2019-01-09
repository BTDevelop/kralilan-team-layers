using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Web;

namespace DAL
{
    public class StrategyPhoto
    {
        /// <summary>
        ///  kralilan resim işlemler class 
        ///  tüm resim işlemleri burada yapılır.
        /// </summary>

        enum Dimensions
        {
            Width,
            Height
        }
        enum AnchorPosition
        {
            Top,
            Center,
            Bottom,
            Left,
            Right
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inphoto"></param>
        /// <param name="_inwidth"></param>
        /// <param name="_inheight"></param>
        /// <param name="_inwatermark"></param>
        /// <param name="_inadsnumber"></param>
        /// <param name="_inpath"></param>
        public static void FixedSize(System.Drawing.Image _inphoto, int _inwidth, int _inheight,string _inwatermark,string _inadsnumber,string _inpath)
        {
            int sourceWidth = _inphoto.Width;
            int sourceHeight = _inphoto.Height;
            int sourceX = 0;
            int sourceY = 0;
            int destX = 0;
            int destY = 0;

            float nPercent = 0;
            float nPercentW = 0;
            float nPercentH = 0;

            nPercentW = ((float)_inwidth / (float)sourceWidth);
            nPercentH = ((float)_inheight / (float)sourceHeight);

            if (nPercentH < nPercentW)
            {
                nPercent = nPercentH;
                destX = (int)((_inwidth - (sourceWidth * nPercent)) / 2);
            }
            else
            {
                nPercent = nPercentW;
                destY = (int)((_inheight - (sourceHeight * nPercent)) / 2);
            }

            int destWidth = (int)(sourceWidth * nPercent);
            int destHeight = (int)(sourceHeight * nPercent);
            Bitmap bmPhoto = new Bitmap(_inwidth, _inheight, PixelFormat.Format24bppRgb);
            bmPhoto.SetResolution(_inphoto.HorizontalResolution, _inphoto.VerticalResolution);
            Graphics grPhoto = Graphics.FromImage(bmPhoto);
            grPhoto.Clear(Color.White);
            grPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;

            grPhoto.DrawImage(_inphoto,
                new Rectangle(destX, destY, destWidth, destHeight),
                new Rectangle(sourceX, sourceY, sourceWidth, sourceHeight),
                GraphicsUnit.Pixel);
            grPhoto.Dispose();

            Bitmap resim;
            if (!string.IsNullOrEmpty(_inwatermark))
            {
                resim = new Bitmap(bmPhoto);
                Graphics graf = Graphics.FromImage(resim);
                //adsnumber resim üzerine yazdırılır.
                graf.DrawString("@" + _inadsnumber, new Font("Century Gothic", 7, FontStyle.Bold), SystemBrushes.ControlDark, new Point(2, 2));
                //resmin şeffaflık değeri ve renk değerleri belirleniyor.
                SolidBrush firca = new SolidBrush(Color.FromArgb(45, 255, 255, 255));
                //resmin köşegen uzunluğu pisagor denklemiyle hesaplanıyor.
                double kosegen = Math.Sqrt(resim.Width * resim.Width + resim.Height * resim.Height);
                Rectangle kutu = new Rectangle();
                //bu 3 satırda ise yazının başlama noktası (x,y koordinatları) ve ayrıca font boyutu ayarlanıyor.
                kutu.X = (int)(kosegen / 3.5);
                float yazi = (float)(kosegen / _inwatermark.Length * 0.6);
                kutu.Y = -(int)(yazi / 0.6);
                Font fnt = new Font("Century Gothic", yazi, FontStyle.Bold);
                //font tipi ve boyutu burada köşegen eğimini aşağıdaki formülle hesaplıyoruz.
                float egim = (float)(Math.Atan2(resim.Height, resim.Width) * 180 / System.Math.PI);
                graf.RotateTransform(egim);
                StringFormat sf = new StringFormat();
                //watermark resim üzerine yazdırılır
                graf.DrawString(_inwatermark, fnt, firca, kutu, sf);
                resim.Save(HttpContext.Current.Server.MapPath("~/upload/ilan/" + _inpath), ImageFormat.Jpeg);
                resim.Dispose();
            }
            else
            {
                if (_inadsnumber != null)
                {
                    bmPhoto.Save(HttpContext.Current.Server.MapPath("~/upload/ilan/" + "thmb_" + _inpath), ImageFormat.Jpeg);
                    bmPhoto.Dispose();
                }
                else
                {
                    bmPhoto.Save(HttpContext.Current.Server.MapPath(_inpath), ImageFormat.Jpeg);
                    bmPhoto.Dispose();
                }
                
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="_inphoto"></param>
        /// <param name="_inwidth"></param>
        /// <param name="_inheight"></param>
        /// <param name="_inwatermark"></param>
        /// <param name="_inadsnumber"></param>
        /// <param name="_insmallphoto"></param>
        /// <param name="_infilename"></param>
        /// <param name="_infolderpath"></param>
        public static void GeneralFixedSize(System.Drawing.Image _inphoto, int _inwidth, int _inheight, string _inwatermark, string _inadsnumber, string _insmallphoto, string _infilename, string _infolderpath)
        {
            int sourceWidth = _inphoto.Width;
            int sourceHeight = _inphoto.Height;
            int sourceX = 0;
            int sourceY = 0;
            int destX = 0;
            int destY = 0;

            float nPercent = 0;
            float nPercentW = 0;
            float nPercentH = 0;

            nPercentW = ((float)_inwidth / (float)sourceWidth);
            nPercentH = ((float)_inheight / (float)sourceHeight);

            if (nPercentH < nPercentW)
            {
                nPercent = nPercentH;
                destX = (int)((_inwidth - (sourceWidth * nPercent)) / 2);
            }
            else
            {
                nPercent = nPercentW;
                destY = (int)((_inheight - (sourceHeight * nPercent)) / 2);
            }

            int destWidth = (int)(sourceWidth * nPercent);
            int destHeight = (int)(sourceHeight * nPercent);
            Bitmap bmPhoto = new Bitmap(_inwidth, _inheight, PixelFormat.Format24bppRgb);
            bmPhoto.SetResolution(_inphoto.HorizontalResolution, _inphoto.VerticalResolution);
            Graphics grPhoto = Graphics.FromImage(bmPhoto);
            grPhoto.Clear(Color.White);
            grPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;

            grPhoto.DrawImage(_inphoto,
                new Rectangle(destX, destY, destWidth, destHeight),
                new Rectangle(sourceX, sourceY, sourceWidth, sourceHeight),
                GraphicsUnit.Pixel);
            grPhoto.Dispose();

            Bitmap resim;
            if (!string.IsNullOrEmpty(_inwatermark))
            {
                resim = new Bitmap(bmPhoto);
                Graphics graf = Graphics.FromImage(resim);
                //adsnumber resim üzerine yazdırılır.
                graf.DrawString("@" + _inadsnumber, new Font("Century Gothic", 7, FontStyle.Bold), SystemBrushes.ControlDark, new Point(2, 2));
                //resmin şeffaflık değeri ve renk değerleri belirleniyor.
                SolidBrush firca = new SolidBrush(Color.FromArgb(45, 255, 255, 255));
                //resmin köşegen uzunluğu pisagor denklemiyle hesaplanıyor.
                double kosegen = Math.Sqrt(resim.Width * resim.Width + resim.Height * resim.Height);
                Rectangle kutu = new Rectangle();
                //bu 3 satırda ise yazının başlama noktası (x,y koordinatları) ve ayrıca font boyutu ayarlanıyor.
                kutu.X = (int)(kosegen / 3.5);
                float yazi = (float)(kosegen / _inwatermark.Length * 0.6);
                kutu.Y = -(int)(yazi / 0.6);
                Font fnt = new Font("Century Gothic", yazi, FontStyle.Bold);
                //font tipi ve boyutu burada köşegen eğimini aşağıdaki formülle hesaplıyoruz.
                float egim = (float)(Math.Atan2(resim.Height, resim.Width) * 180 / System.Math.PI);
                graf.RotateTransform(egim);
                StringFormat sf = new StringFormat();
                //watermark resim üzerine yazdırılır
                graf.DrawString(_inwatermark, fnt, firca, kutu, sf);
                resim.Save(HttpContext.Current.Server.MapPath(_infolderpath + _infilename), ImageFormat.Jpeg);
                resim.Dispose();
            }
            else
            {
                if (_insmallphoto != null)
                {
                    bmPhoto.Save(HttpContext.Current.Server.MapPath(_infolderpath + "thmb_" + _infilename), ImageFormat.Jpeg);
                    bmPhoto.Dispose();
                }
                else
                {
                    bmPhoto.Save(HttpContext.Current.Server.MapPath(_infilename), ImageFormat.Jpeg);
                    bmPhoto.Dispose();
                }

            }
        }
    
    }
}
