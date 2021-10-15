using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;


//author:林玉琴
//create date:2020/07/15
//update date:2020/07/15
//description:验证码的生成
namespace _20200709
{
    public partial class VerificationCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Random r = new Random();
            string aaa = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            //生成画布
            Bitmap img = new Bitmap(80, 30);
            //画布背景色泛性组合
            List<Color> Clist = new List<Color>();
            Clist.Add(Color.Yellow);
            Clist.Add(Color.Green);
            Clist.Add(Color.Blue);
            Clist.Add(Color.Aqua);
            Clist.Add(Color.Orange);
            Clist.Add(Color.Pink);
            Graphics g = Graphics.FromImage(img);
            g.FillRectangle(new SolidBrush(Clist[r.Next(0, Clist.Count)]), 0, 0, 80, 30);
            //随机生成显示的验证码组合
            string str = "";
            for (int i = 0; i < 4; i++)
            {
                str += aaa.Substring(r.Next(0, aaa.Length), 1);
            }
            Session["VerificationCode"] = str;
            Font f = new Font("黑体", 20);
            Brush b = new SolidBrush(Color.Red);
            //生成
            g.DrawString(str, f, b, 10, 0);
            //添加干扰线
            for (int i = 0; i < r.Next(6, 20); i++)
            {
                Brush bb = new SolidBrush(Clist[r.Next(0, Clist.Count)]);
                Pen p = new Pen(bb, 1);
                g.DrawLine(p, r.Next(0, 80), r.Next(0, 30), r.Next(0, 80), r.Next(0, 30));
            }
            //保存完成
            img.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg);
            Response.End();
        }
    }
}