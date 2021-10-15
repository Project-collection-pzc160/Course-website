using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _20200709
{
    public partial class MainForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('团队: peace&love   成员:杨金鹏，林玉琴，彭子晨')</script>");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('联系邮箱：2427438398@qq.com')</script>");
        }
    }
}