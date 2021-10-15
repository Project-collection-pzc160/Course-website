using DevExpress.ClipboardSource.SpreadsheetML;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _20200709
{
    //author:彭子晨
    //create date:2020/07/21  description:实现管理员删除课程界面
    //update date:2020/7/25   description:插入课程logo

    //author:林玉琴
    //update date:2020/07/23  description：添加了到发布、删除、修改、和退出登录页面的跳转，进行了页面的美化

    public partial class DeleteCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {         
            string id = TextBox1.Text;
            SqlDataReader reader = Data_access.QueryCourseId(id);
            while (reader.Read())
            {
                string type = reader.GetString(9);
                if (type == "通识课")
                {
                    Panel2.Visible = false;
                }
                Label1.Text = reader.GetString(0);
                Label2.Text = reader.GetString(1);
                Label3.Text = reader.GetDecimal(2).ToString();
                Label4.Text = reader.GetString(3);
                Label5.Text = reader.GetString(4);
                if (type == "专业课")
                {
                    Label6.Text = reader.GetString(5);
                    Label7.Text = reader.GetInt32(6).ToString();
                }
                Label8.Text = reader.GetString(7);
                Label9.Text = reader.GetInt32(8).ToString();
                Label10.Text = reader.GetString(9);
                Label11.Text = reader.GetString(13);
            }
            reader.Close();
        }


        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Server.Transfer("Administrator.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            string id = Label1.Text;
            Data_access.DeleteCourses(id);
            Response.Write("<script>alert('删除成功')</script>");
            Response.Write("<script>window.location.href=window.location.href;</script>");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Server.Transfer("UpdateCourse.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Server.Transfer("DeleteCourse.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Server.Transfer("AddCourse.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Server.Transfer("Login.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Server.Transfer("Administrator.aspx");
        }
    }
}