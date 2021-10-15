
using System;
using System.Data.SqlClient;
using System.Web.UI;


//author:林玉琴；
//create date:20200710
//update date:20200711
//description:登录界面，成功则跳转至主页面，不成功则提示错误信息
//2020/07/28  增加了回车触发按钮事件

//author:彭子晨；
//update date:2020/7/25  description:增加about、contact按钮的弹窗显示，插入课程logo
namespace _20200709
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            TextBox3.Attributes.Add("onkeydown", "return doButton()");
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
        }

        private bool VCodeCheck()//判断验证码输入是否正确
        {
            try
            {
                if (Session["VerificationCode"].ToString().ToUpper() == TextBox3.Text.ToUpper())
                    return true;
                else
                    return false;
            }
            catch
            {
                Label3.Text = "验证码错误";
            }
            return false;
        }

        private void Login()//判断用户名是否存在以及用户名和密码输入是否正确
        {
            string account = TextBox1.Text;
            string password = TextBox2.Text;
            Session["account"] = account; //存放用户名，以便登录后标识用户进行选课等操作
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["sqlcon"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            try
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("select count(*) from users where account=@account and password=@password", conn);
                cmd.Parameters.AddWithValue("@account", account);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters[0].Value = account;
                cmd.Parameters[1].Value = password;
                int count = (int)cmd.ExecuteScalar();
                if (count == 1)
                {
                    if (account == "peace&love")
                    {
                        Response.Redirect("Administrator.aspx");
                    }
                    else
                    {
                        Response.Redirect("UserCourse.aspx");
                    }
                }
                else
                {
                    //Response.Write("<script>alert('用户名或密码错误')</script>");
                    Label3.Text = "用户名或密码错误";
                }
            }
            catch
            {
                //Response.Write("<script>alert('登录异常')</script>");
                Label3.Text = "登录异常";
            }

            finally
            {
                conn.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (VCodeCheck())
                Login();
            else
                Label5.Text = "验证码错误";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Server.Transfer("Register.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Server.Transfer("Findpassword.aspx");
        }

        protected void TextBox1_TextChanged1(object sender, EventArgs e)
        {
           
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('团队: peace&love   成员:杨金鹏，林玉琴，彭子晨')</script>");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('联系邮箱：2427438398@qq.com')</script>");
        }
    }
}