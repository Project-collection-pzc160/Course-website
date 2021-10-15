<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="_20200709.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {            height: 674px;
        }
        .auto-style1 {
            z-index: 1;
            left: 28%;
            top: 4%;
            position: absolute;
            width: 142px;
            height: 58px;
        }
        .auto-style2 {
            z-index: 1;
            left: 20%;
            top: 4%;
            position: absolute;
            width: 120px;
            height: 54px;
            right: 1385px;
        }
    </style>
        <script type="text/javascript">
        function doButton()
        {
            if (event.keyCode == 13)
            {
                document.getElementById("Button1").click();
                return false;
            }
        }
    </script>
</head>
<body style="height: 100%;
            width:100%;            
            margin:0; 
            padding:0;
            background-image:url('image1/login.png');
            background-size: 100% 100%;
            background-repeat:no-repeat; 
            background-attachment: fixed;">
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server" style="z-index: 1; left: 50%; top: 10%; position: absolute; height: 70%; width:55%;" >
            <br />
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" style="z-index: 1; left: 18%; top: 66.5%; position: absolute; font-weight: 400; font-size: 24pt; font-family: 楷体;" Text="验证码"></asp:Label>
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 30%; top: 40%; position: absolute; height: 10%; width: 35%; margin:0; padding:0;
background-image:url('image1/5.jpg');background-size: 100% 100%; background-repeat:no-repeat;text-indent:1em; font-size: 24pt; font-family: 宋体; font-weight: 700;
border-radius:10px;" BackColor="#5EC8CD" BorderColor="#51C4C9" BorderStyle="None" ToolTip="请输入用户名" OnTextChanged="TextBox1_TextChanged1"></asp:TextBox>
           
            <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 36%; top: 90%; position: absolute; height: 10%; width: 30%; color: #FF0000;"></asp:Label>
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged"  style="z-index: 1;left: 30%; top: 52%; position: absolute; height: 10%; width: 35%;text-indent:1em; background-image:url('image1/5.jpg');background-size: 100% 100%; background-repeat:no-repeat; font-size: x-large; font-family: 宋体; font-weight: 700;" BackColor="#53C5CA" BorderColor="#51C4C9" BorderStyle="None" ToolTip="请输入密码" TextMode="Password"></asp:TextBox>
           
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="z-index: 1; left: 30%; top: 78%; position: absolute; height: 42px; width: 96px; font-size: 24pt; font-weight: 700; font-family: 楷体;" Text="登录" BackColor="#55C5CA" BorderColor="#5DC7CB" BorderStyle="None" />
            <asp:Label ID="Label2" runat="server" style="z-index: 1;left:20.5%; top: 54.5%; position: absolute; font-weight: 400; font-size: 24pt; font-family: 楷体; width: 95px;" Text="密码"></asp:Label>
            <asp:Button ID="Button2" runat="server" BackColor="#50C4C9" BorderColor="#56C6CB" BorderStyle="None" OnClick="Button2_Click" style="z-index: 1; left: 45%; top: 80%; position: absolute; text-decoration: underline; font-size: 14pt; font-family: 楷体;" Text="注册" />
            <asp:Button ID="Button3" runat="server" BackColor="#5EC8CD" BorderColor="#64CACE" BorderStyle="None" style="z-index: 1; left: 55%; top: 80%; position: absolute; text-decoration: underline; font-size: 14pt; font-family: 楷体;" Text="忘记密码" OnClick="Button3_Click" />
           
            <asp:TextBox ID="TextBox3" runat="server" style="z-index: 1; left: 30%; top: 64%; position: absolute; height: 10%; width: 17%;text-indent:1em;background-image:url('image1/5.jpg');background-size: 100% 100%; background-repeat:no-repeat; font-size: x-large; font-weight: 700;" BackColor="#5CC7CC" BorderColor="#50C4C9" BorderStyle="None" ToolTip="请输入验证码"></asp:TextBox>

            <asp:Image ID="Image1" runat="server" style="z-index: 1; left: 50%; top: 65%; position: absolute; height: 9%; width: 14%" ImageUrl="VerificationCode.aspx"  /><br />

            <asp:Label ID="Label5" runat="server" style="z-index: 1; left: 67%; top: 68%; position: absolute; color: #FF0000;"></asp:Label>
            <asp:Label ID="Label1" runat="server" BorderStyle="None" style="z-index: 1; left: 18%; top: 42.5%; position: absolute; font-weight: 400; font-size: 24pt; font-family: 楷体;" Text="用户名"></asp:Label>
            &nbsp;</asp:Panel>
        <br />
        <br />
        <br />
            <asp:Button ID="Button5" runat="server" style="color: #FFFFFF; font-size: x-large;" Text="ABOUT" BackColor="#090608" BorderColor="#0A0609" BorderStyle="None" CssClass="auto-style2" OnClick="Button5_Click" />
            <asp:Button ID="Button6" runat="server" style="color: #FFFFFF; font-size: x-large;" Text="CONTACT" BackColor="#090608" BorderColor="#0A0609" BorderStyle="None" CssClass="auto-style1" OnClick="Button6_Click" />
        <br />
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </form>
    </body>
</html>
<script type="text/javascript">
    var aaa = 1;
    document.getElementById("Image1").onclick = function () {
    this.setAttribute("src", "VerificationCode.aspx?id=" + aaa);
    aaa++;
    };
    </script>


