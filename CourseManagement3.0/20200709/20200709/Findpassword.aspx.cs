using System;


//author:林玉琴
//create date:2020/07/15
//update date:2020/07/15
//description:完成找回/修改密码的功能
//2020/07/28  增加了回车触发按钮事件

//author:彭子晨；
//update date:2020/7/25  description:增加about、contact按钮的弹窗显示，插入课程logo
namespace _20200709
{
    public partial class wangjimima : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox5.Attributes["onblur"] = ClientScript.GetPostBackEventReference(TextBox5, null);
            TextBox2.Attributes["onblur"] = ClientScript.GetPostBackEventReference(TextBox2, null);
            TextBox3.Attributes["onblur"] = ClientScript.GetPostBackEventReference(TextBox3, null);
            TextBox5.Attributes.Add("onkeydown", "return doButton()");
            TextBox3.Attributes.Add("onkeydown", "return doButton2()");
        }

        //成功设置新密码后返回登陆页面
        protected void Button1_Click(object sender, EventArgs e)
        {
            string a = Data_access.UpdateData(TextBox3.Text, TextBox4.Text);
            if (a == "1")
            {
                Server.Transfer("Login.aspx");
            }
            else
                Label8.Text = "修改异常";
                               
        }

        //返回登陆页面
        protected void Button5_Click(object sender, EventArgs e)
        {
            Server.Transfer("Login.aspx");
        }


        //点击进行下一步
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (Label6.Text == "√" && Label7.Text == "√")
            {
                Button1.Visible = true;
                Button2.Visible = true;
                Label2.Visible = true;
                Label3.Visible = true;
                TextBox2.Visible = true;
                TextBox3.Visible = true;
                Button3.Visible = false;
                Button4.Visible = false;
                Button5.Visible = false;
                Label4.Visible = false;
                Label5.Visible = false;
                Label6.Visible = false;
                Label7.Visible = false;
                TextBox4.Visible = false;
                TextBox5.Visible = false;
            }
            else
                Label8.Text = "请先将信息填写正确";
        }

        //点击返回上一步
        protected void Button2_Click(object sender, EventArgs e)
        {
            Button1.Visible = false;
            Button2.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            TextBox2.Visible = false;
            TextBox3.Visible = false;
            Button3.Visible = true;
            Button4.Visible = true;
            Button5.Visible = true;
            Label4.Visible = true;
            Label5.Visible = true;
            Label6.Visible = true;
            Label7.Visible = true;
            Label9.Visible = false;
            Label10.Visible = false;
            TextBox4.Visible = true;
            TextBox5.Visible = true;
        }


        private string code;//发送的邮箱验证码

        //发送邮件
        protected void Button3_Click(object sender, EventArgs e)
        {
            bool check = false;

            if (EmailCode.AddressCheck(TextBox4.Text))//填写邮箱格式正确
            {
                string a = Data_access.QueryData(TextBox4.Text, "email");
                if (a == "2")//邮箱未注册过
                    Label6.Text = "该邮箱未注册";
                else if (a == "1")
                    check = true;
                else if (a == "3")
                    Label8.Text = "邮箱重名检测异常";
            }
            else
                Label6.Text = "邮箱格式错误";

            try
            {
                if (check)
                {
                    code = EmailCode.SendMail(TextBox4.Text);
                    Label6.Text = "√";//发送成功
                }

            }
            catch
            {
                Label6.Text = "发送失败";
            }
        }


        //判断邮箱验证码是否正确
        protected void TextBox5_TextChanged(object sender, EventArgs e)
        {
            //string code = EmailCode.SendMail(TextBox4.Text);
            if (EmailCode.EmailCheck(code, TextBox5.Text))
            {
                 Label7.Text = "√";
            }
            else
            {
                Label7.Text = "验证码错误";
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            if (TextBox2.Text.Length < 21)
                Label9.Text = "√";
            else
                Label9.Text = "密码长度不得大于20位";
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            if (TextBox3.Text == TextBox2.Text)
            {
                Label10.Text = "√";
            }
            else
                Label10.Text = "两次密码不一致";
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