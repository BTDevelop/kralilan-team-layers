using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BLL.ImageZipperHelper
{
    public class ImageZipperHelper
    {
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

        private readonly string _root = "~/upload/ilan/";

        public Image Photo { get; set; }
        public int Width { get; set; }
        public int Height { get; set; }
        public string Watermark { get; set; }
        public string Number { get; set; }
        public string Path { get; set; }


        public void FixedSize()
        {
            int sourceWidth = Photo.Width;
            int sourceHeight = Photo.Height;
            int sourceX = 0;
            int sourceY = 0;
            int destX = 0;
            int destY = 0;

            float nPercent = 0;
            float nPercentW = 0;
            float nPercentH = 0;

            nPercentW = ((float)Width / (float)sourceWidth);
            nPercentH = ((float)Height / (float)sourceHeight);

            if (nPercentH < nPercentW)
            {
                nPercent = nPercentH;
                destX = (int)((Width - (sourceWidth * nPercent)) / 2);
            }
            else
            {
                nPercent = nPercentW;
                destY = (int)((Height - (sourceHeight * nPercent)) / 2);
            }

            int destWidth = (int)(sourceWidth * nPercent);
            int destHeight = (int)(sourceHeight * nPercent);
            Bitmap bmPhoto = new Bitmap(Width, Height, PixelFormat.Format24bppRgb);
            bmPhoto.SetResolution(Photo.HorizontalResolution, Photo.VerticalResolution);
            Graphics grPhoto = Graphics.FromImage(bmPhoto);
            grPhoto.Clear(Color.White);
            grPhoto.InterpolationMode = InterpolationMode.HighQualityBicubic;

            grPhoto.DrawImage(Photo,
                new Rectangle(destX, destY, destWidth, destHeight),
                new Rectangle(sourceX, sourceY, sourceWidth, sourceHeight),
                GraphicsUnit.Pixel);
            grPhoto.Dispose();

            Bitmap _bitmap;
            if (!string.IsNullOrEmpty(Watermark))
            {
                _bitmap = new Bitmap(bmPhoto);
                Graphics graf = Graphics.FromImage(_bitmap);
                //adsnumber resim üzerine yazdırılır.
                graf.DrawString("@" + Number, new Font("Century Gothic", 7, FontStyle.Bold), SystemBrushes.ControlDark, new Point(2, 2));
                //resmin şeffaflık değeri ve renk değerleri belirleniyor.
                SolidBrush firca = new SolidBrush(Color.FromArgb(45, 255, 255, 255));
                //resmin köşegen uzunluğu pisagor denklemiyle hesaplanıyor.
                double kosegen = Math.Sqrt(_bitmap.Width * _bitmap.Width + _bitmap.Height * _bitmap.Height);
                Rectangle kutu = new Rectangle();
                //bu 3 satırda ise yazının başlama noktası (x,y koordinatları) ve ayrıca font boyutu ayarlanıyor.
                kutu.X = (int)(kosegen / 3.5);
                float yazi = (float)(kosegen / Watermark.Length * 0.6);
                kutu.Y = -(int)(yazi / 0.6);
                Font fnt = new Font("Century Gothic", yazi, FontStyle.Bold);
                //font tipi ve boyutu burada köşegen eğimini aşağıdaki formülle hesaplıyoruz.
                float egim = (float)(Math.Atan2(_bitmap.Height, _bitmap.Width) * 180 / System.Math.PI);
                graf.RotateTransform(egim);
                StringFormat sf = new StringFormat();
                //watermark resim üzerine yazdırılır
                graf.DrawString(Watermark, fnt, firca, kutu, sf);
                _bitmap.Save(HttpContext.Current.Server.MapPath(_root + Path), ImageFormat.Jpeg);
                _bitmap.Dispose();
            }
            else
            {
                bmPhoto.Save(HttpContext.Current.Server.MapPath(_root + Path), ImageFormat.Jpeg);
                bmPhoto.Dispose();
            }
        }
    }
}
