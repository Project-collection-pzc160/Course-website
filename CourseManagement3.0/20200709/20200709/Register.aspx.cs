using System;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using System.Text.RegularExpressions;


//author:林玉琴；
//create date:2020/07/11
//update date:2020/07/12   2020/07/14   2020/07/15
//description:注册界面，用户名、密码设置正确则注册成功，跳转至登录页面
//2020/07/14  添加了邮箱验证的功能
//2020/07/15  调用接口函数简化代码
//2020/07/28  增加了回车触发按钮事件

//author:彭子晨；
//update date:2020/7/25  description:增加about、contact按钮的弹窗显示，插入课程logo

namespace _20200709
{
    public partial class zhuce : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Attributes["onblur"] = ClientScript.GetPostBackEventReference(TextBox1, null);
            TextBox2.Attributes["onblur"] = ClientScript.GetPostBackEventReference(TextBox2, null);
            TextBox3.Attributes["onblur"] = ClientScript.GetPostBackEventReference(TextBox3, null);
            TextBox5.Attributes["onblur"] = ClientScript.GetPostBackEventReference(TextBox5, null);
            TextBox5.Attributes.Add("onkeydown", "return doButton()");
        }

        //用户名判断
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

            if (TextBox1.Text.Length < 16)
            {
                string a = Data_access.QueryData(TextBox1.Text,"account");
                if ("2" == a)//查询用户名是否存在
                { Label4.Text = "√"; }
                else if ("1" == a)
                { Label4.Text = "用户名已存在"; }
                else
                    Label7.Text = "用户重名检测异常";
            }
            else
                Label4.Text = "用户名长度不得大于15位";
        }

        //密码长度限制
        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            if (TextBox2.Text.Length < 21)
                Label5.Text = "√";
            else
                Label5.Text = "密码长度不得大于20位";
        }

        //判断两次密码是否一致
        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            if (TextBox3.Text == TextBox2.Text)
            {
                Label6.Text = "√";
            }
            else
                Label6.Text = "两次密码不一致";
        }

        //进行注册
        private void Register()
        {
            string account = TextBox1.Text;
            string password = TextBox2.Text;
            string email = TextBox4.Text;
            string connStr = System.Configuration.ConfigurationManager.ConnectionStrings["sqlcon"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            // if (passwordcheck && CanRegister && accountcheck)
            // {
            try
            {
                conn.Open();
                string strIns = "insert into users(account, password,email) values(@account, @password,@email)";//往数据表中插入数据
                SqlCommand cmd = new SqlCommand(strIns, conn);
                cmd.Parameters.AddWithValue("@account", account);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters["@account"].Value = account;
                cmd.Parameters["@password"].Value = password;
                cmd.Parameters["@email"].Value = email;
                cmd.ExecuteNonQuery();
                //Label7.Text = "hh";
            }
            catch
            {
                Label7.Text = "注册异常";
            }
            finally
            {
                conn.Close();
                Response.Redirect("Login.aspx");//注册成功则跳转到登录页面
            }
        }


        //注册按钮
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (Label4.Text== "√"&& Label5.Text == "√"&& Label6.Text == "√"&& Label10.Text == "√"&& Label11.Text == "√")
                Register();
            else
                Label7.Text = "注册失败";
        }


        //返回到登录界面
        protected void Button4_Click(object sender, EventArgs e)
        {
            Server.Transfer("Login.aspx");//返回到登录页面
        }





        private string code;//发送的邮箱验证码

        //发送邮件
        protected void Button5_Click(object sender, EventArgs e)
        {
            bool check = false;

            if (EmailCode.AddressCheck(TextBox4.Text))//填写邮箱格式正确
            {
                string a = Data_access.QueryData(TextBox4.Text,"email");
                if (a == "2")//邮箱未注册过
                    check = true;
                else if (a == "1")
                    Label10.Text = "该邮箱已注册";
                else if (a == "3")
                    Label7.Text = "邮箱重名检测异常";
            }
            else
                Label10.Text = "邮箱格式错误";

            try
            {
                if(check)
                {
                    code = EmailCode.SendMail(TextBox4.Text);
                    Label10.Text = "√";//发送成功
                }

            }
            catch
            {
                Label10.Text = "发送失败";
            }                     
        }


        //判断邮箱验证码是否正确
        protected void TextBox5_TextChanged(object sender, EventArgs e)
        {
            //string code = EmailCode.SendMail(TextBox4.Text);
            if (EmailCode.EmailCheck(code, TextBox5.Text))
            {
                Label11.Text = "√";
            }
            else
            {
                Label11.Text = "验证码错误";
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('团队: peace&love   成员:杨金鹏，林玉琴，彭子晨')</script>");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('联系邮箱：2427438398@qq.com')</script>");
        }
    }
}