<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Findpassword.aspx.cs" Inherits="_20200709.wangjimima" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 736px;
        }
        .auto-style2 {
            z-index: 1;
            left: 20%;
            top: 4%;
            position: absolute;
            width: 120px;
            height: 54px;
            right: 1381px;
        }
        .auto-style1 {
            z-index: 1;
            left: 28%;
            top: 4%;
            position: absolute;
            width: 142px;
            height: 53px;
        }
        </style>

        <script type="text/javascript">
        function doButton()
        {
            if (event.keyCode == 13)
            {
                document.getElementById("Button4").click();
                return false;
            }
        }

        function doButton2()
        {
            if (event.keyCode == 13)
            {
                document.getElementById("Button1").click();
                return false;
            }
        }
    </script>

</head>
<body  style="height: 100%;
            width:100%;            
            margin:0; 
            padding:0;
            background-image:url('image1/password2.png');
            background-size: 100% 100%;
            background-repeat:no-repeat; 
            background-attachment: fixed;">
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server" style="z-index: 1; left: 45%; top: 10%; position: absolute; height: 70%; width: 50%;" >
            
            <asp:TextBox ID="TextBox2" runat="server" style="z-index: 1; left: 45%; top: 37%; position: absolute; height: 10%; width: 35%;
background-image:url('image1/5.jpg');background-size: 100% 100%;background-repeat:no-repeat;text-indent:1em; font-size: 24pt; font-family: 宋体; 
font-weight: 700;border-radius:10px;" BackColor="#5EC8CD" BorderColor="#51C4C9" BorderStyle="None" ToolTip="用户名不得超过15位" AutoPostBack="True" OnTextChanged="TextBox2_TextChanged" Visible="False"></asp:TextBox>
            <asp:TextBox ID="TextBox3" runat="server" style="z-index: 1; left: 45%; top: 49%; position: absolute; height: 10%; width: 35%;
background-image:url('image1/5.jpg');background-size: 100% 100%;background-repeat:no-repeat;text-indent:1em; font-size: 24pt; font-family: 宋体; 
font-weight: 700;border-radius:10px;" BackColor="#5EC8CD" BorderColor="#51C4C9" BorderStyle="None" ToolTip="用户名不得超过15位" AutoPostBack="True" OnTextChanged="TextBox3_TextChanged" Visible="False"></asp:TextBox>
           
            <asp:TextBox ID="TextBox4" runat="server" style="z-index: 1; left: 45%; top: 37%; position: absolute; height: 10%; width: 25%;
background-image:url('image1/5.jpg');background-size: 100% 100%;background-repeat:no-repeat;text-indent:1em; font-size: 24pt; font-family: 宋体; 
font-weight: 700;border-radius:10px;" BackColor="#5EC8CD" BorderColor="#51C4C9" BorderStyle="None" ToolTip="请输入邮箱"></asp:TextBox>
            <asp:TextBox ID="TextBox5" runat="server" AutoPostBack="True" OnTextChanged="TextBox5_TextChanged" style="z-index: 1; left: 45%; top: 49%; position: absolute; height:10%; width: 35%;
background-image:url('image1/5.jpg');background-size: 100% 100%;background-repeat:no-repeat;text-indent:1em; font-size: 24pt; font-family: 宋体; 
font-weight: 700;border-radius:10px;" BackColor="#5EC8CD" BorderColor="#51C4C9" BorderStyle="None" ToolTip="请输入邮箱验证码"></asp:TextBox>
            
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="z-index: 1; left: 48%; top: 63%; position: absolute; height: 46px; width: 79px; font-size: 24pt; font-family: 楷体;" Text="确定" Visible="False" BackColor="#5BC7CC" BorderColor="#4FC4C9" BorderStyle="None" />
            <asp:Button ID="Button2" runat="server" BackColor="#51C4C9" BorderColor="#53C5C9" BorderStyle="None" OnClick="Button2_Click" style="z-index: 1;  left: 65%; top: 65%; position: absolute; height: 34px; width: 76px; text-decoration: underline; font-size: 14pt; font-family: 楷体;" Text="上一步" Visible="False" />
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" style="z-index: 1; left: 70%; top: 37%; position: absolute; height: 10%; width: 10%; font-size: 24pt; font-family: 楷体;" Text="发送" BackColor="#5BC7CC" BorderColor="#52C5CA" BorderStyle="None" />
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" style="z-index: 1; left: 48%; top: 63%; position: absolute; height: 10%;  width: 15%; font-size: 24pt; font-family: 楷体;"  BackColor="#5BC7CC" BorderColor="#52C5CA" BorderStyle="None" Text="下一步" />
            <asp:Button ID="Button5" runat="server" style="z-index: 1; left: 65%; top: 65%; position: absolute; height: 58px; width: 103px; font-size: 14pt; font-family: 楷体; text-decoration: underline;" BackColor="#5BC7CC" BorderColor="#52C5CA" BorderStyle="None" OnClick="Button5_Click"  Text="返回" />
            
            <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 28%; top: 39%; position: absolute; font-weight: 400; font-size: 24pt; font-family: 楷体;" Text="新密码" Visible="False"></asp:Label>
            <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 24%; top: 51%; position: absolute; font-weight: 400; font-size: 24pt; font-family: 楷体;" Text="确认密码" Visible="False"></asp:Label>
            <asp:Label ID="Label4" runat="server" style="z-index: 1; left: 33%; top: 39%; position: absolute;font-weight: 400; font-size: 24pt; font-family: 楷体;" Text="邮箱"></asp:Label>
            <asp:Label ID="Label5" runat="server" style="z-index: 1; left: 29%; top: 51%; position: absolute;font-weight: 400; font-size: 24pt; font-family: 楷体;" Text="验证码"></asp:Label>
            <asp:Label ID="Label6" runat="server" style="z-index: 1; left: 82%; top: 39%; position: absolute;color: #FF0000; font-size: 14pt; font-family: 楷体;"></asp:Label>
            <asp:Label ID="Label7" runat="server" style="z-index: 1; left: 82%; top: 51%; position: absolute;color: #FF0000; font-size: 14pt; font-family: 楷体;"></asp:Label>
            <asp:Label ID="Label8" runat="server" style="z-index: 1; left: 49%; top: 77%; position: absolute;color: #FF0000; font-size: 14pt; font-family: 楷体;"></asp:Label>
            <asp:Label ID="Label9" runat="server" style="z-index: 1; left: 82%; top: 39%; position: absolute;color: #FF0000; font-size: 14pt; font-family: 楷体;"></asp:Label>
            <asp:Label ID="Label10" runat="server" style="z-index: 1; left: 82%; top: 51%; position: absolute;color: #FF0000; font-size: 14pt; font-family: 楷体;"></asp:Label>
        </asp:Panel>
            <asp:Button ID="Button7" runat="server" style="color: #FFFFFF; font-size: x-large;" Text="CONTACT" BackColor="#090608" BorderColor="#0A0609" BorderStyle="None" CssClass="auto-style1" OnClick="Button7_Click" />
            <asp:Button ID="Button6" runat="server" style="color: #FFFFFF; font-size: x-large;" Text="ABOUT" BackColor="#090608" BorderColor="#0A0609" BorderStyle="None" CssClass="auto-style2" OnClick="Button6_Click" />
    </form>
</body>
</html>
