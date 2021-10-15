using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _20200709
{
    //author:彭子晨
    //create date:2020/07/21  description:实现管理员发布课程界面
    //update date:2020/7/25   description:插入课程logo

    //author:林玉琴
    //update date:2020/07/23  description：添加了到发布、删除、修改、和退出登录页面的跳转，进行了页面的美化

    public partial class AddCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RadioButtonList1.SelectedIndex = 0;
                Panel2.Visible = false;
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedIndex == 0)
            {
                Panel2.Visible = false;
            }
            else
            {
                Panel2.Visible = true;
            }
        }



        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Server.Transfer("Administrator.aspx");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string id = TextBox1.Text;
            string cname = TextBox2.Text;
            double credit = Convert.ToDouble(TextBox3.Text);
            string tname = TextBox4.Text;
            string academy = TextBox5.Text;
            string schoolyear = TextBox8.Text;
            int schoolterm = Convert.ToInt32(TextBox9.Text);
            string school = TextBox10.Text;

            if (Data_access.QueryCourses(id))
            {
                Response.Write("<script>alert('课头号已存在，发布失败')</script>");
            }
            else
            {
                if (RadioButtonList1.SelectedIndex == 0)
                {
                    string type = "通识课";
                    Data_access.InsertCourses2(id, cname, credit, tname, academy, schoolyear, schoolterm, type, school);
                    Response.Write("<script>alert('发布成功')</script>");
                    Response.Write("<script>window.location.href=window.location.href;</script>");
                }
                else
                {
                    string type = "专业课";
                    string major = TextBox6.Text;
                    int grade = Convert.ToInt32(TextBox7.Text);
                    Data_access.InsertCourses1(id, cname, credit, tname, academy, major, grade, schoolyear, schoolterm, type, school);
                    Response.Write("<script>alert('发布成功')</script>");
                    Response.Write("<script>window.location.href=window.location.href;</script>");
                }
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Server.Transfer("UpdateCourse.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Server.Transfer("DeleteCourse.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Server.Transfer("AddCourse.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Server.Transfer("Login.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Server.Transfer("Administrator.aspx");
        }
    }
}