using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;
using System.Text.RegularExpressions;
using System.Data.SqlClient;

namespace _20200709
{
    public class EmailCode
    {
        //author:林玉琴
        //create date:2020/07/15
        //update date:2020/07/15
        //description:发送邮箱验证码的功能

        //判断邮箱格式是否正确,a表示用户填写的邮箱
        public static bool AddressCheck(string a)
        {
            string emailStr = @"^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,5})+$";
            Regex emailReg = new Regex(emailStr);
            if (emailReg.IsMatch(a.Trim()))
                return true;
            else
                return false;
        }

        //生成6位数字和大写字母的验证码
        public static string CreateRandom(int codelengh)
        {
            int rep = 0;
            string str = string.Empty;
            long num2 = DateTime.Now.Ticks + rep;
            rep++;
            Random random = new Random(((int)(((ulong)num2) & 0xffffffffL)) | ((int)(num2 >> rep)));
            for (int i = 0; i < codelengh; i++)
            {
                char ch;
                int num = random.Next();
                if ((num % 2) == 0)
                {
                    ch = (char)(0x30 + ((ushort)(num % 10)));
                }
                else
                {
                    ch = (char)(0x41 + ((ushort)(num % 0x1a)));
                }
                str = str + ch.ToString();
            }
            return str;
        }


        public static string emailcode;
        //发送邮件，a表示收件人邮箱地址
        public static string SendMail(string a)
        {
            MailMessage mailMessage = new MailMessage();//实例化一个发送邮件类。             
            mailMessage.From = new MailAddress("1457380863@qq.com");//发件人邮箱地址             
            mailMessage.To.Add(new MailAddress(a));//收件人邮箱地址。             
            mailMessage.Subject = "验证码";//邮件标题。
            emailcode = CreateRandom(6);//生成的六位验证码   
            //HttpContext.Current.Session["emailcode"] = emailcode;
            mailMessage.Body = "你的验证码是" + emailcode;//邮件内容。             
            SmtpClient client = new SmtpClient();//实例化一个SmtpClient类。
            client.Host = "smtp.qq.com";//使用的是qq邮箱，所以是smtp.qq.com（587），如果你使用的是126邮箱，那么就是smtp.126.com（25）。             
            client.EnableSsl = true;//使用安全加密连接。            
            client.UseDefaultCredentials = false;//不和请求一块发送。             
            client.Credentials = new NetworkCredential("1457380863@qq.com", "knegpkmxbuqeheij");//验证发件人身份            
            client.Send(mailMessage);//发送
            return emailcode;
        }



        //判断邮箱验证码是否正确，a表示填写的邮箱验证码，code表示发送的验证码
        public static bool EmailCheck(string code, string a)
        {
            code = emailcode;
            if (code.ToUpper() == a.ToUpper())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}