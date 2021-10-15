<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="_20200709.zhuce" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 1166px;
        }
        .auto-style2 {
            z-index: 1;
            left: 19%;
            top: 4%;
            position: absolute;
            width: 129px;
            height: 53px;
            right: 1388px;
        }
        .auto-style1 {
            z-index: 1;
            left: 28%;
            top: 4%;
            position: absolute;
            width: 142px;
            height: 52px;
        }
        </style>
    <script type="text/javascript">
        function doButton()
        {
            if (event.keyCode == 13)
            {
                document.getElementById("Button3").click();
                return false;
            }
        }
    </script>

</head>
<body  style="height: 100%;
            width:100%;            
            margin:0;      
            padding:0;
            background-image:url('image1/register2.png');
            background-size: 100% 100%;
            background-repeat:no-repeat; 
            background-attachment: fixed;">
    <form id="form1" runat="server">
        <asp:Panel ID="Panel1" runat="server" style="z-index: 1; left: 45%; top: 10%; position: absolute; height: 80%; width: 55%;" >
            <asp:Label ID="Label1" runat="server" style="z-index: 1; left: 25%; top: 32.5%; position: absolute; font-weight: 400; font-size: 24pt; font-family: 楷体;" Text="用户名"></asp:Label>
            <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 28.5%; top: 44.5%; position: absolute; font-weight: 400; font-size: 24pt; font-family: 楷体;" Text="密码"></asp:Label>
            <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 21%; top: 56.5%; position: absolute; font-weight: 400; font-size: 24pt; font-family: 楷体;" Text="确认密码"></asp:Label>
           
            <asp:TextBox ID="TextBox1" runat="server" style="z-index: 1; left: 39%; top: 30%; position: absolute; height: 10%; width: 35%;
background-image:url('image1/5.jpg');background-size: 100% 100%;background-repeat:no-repeat;text-indent:1em; font-size: 24pt; font-family: 宋体; 
font-weight: 700;border-radius:10px;" BackColor="#5EC8CD" BorderColor="#51C4C9" BorderStyle="None" ToolTip="用户名不得超过15位" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" style="z-index: 1; left: 39%; top: 42%; position: absolute; height: 10%; width: 35%; 
background-image:url('image1/5.jpg');background-size: 100% 100%;background-repeat:no-repeat;text-indent:1em; font-size: 24pt; font-family: 宋体; 
font-weight: 700;border-radius:10px;" BackColor="#5EC8CD" BorderColor="#51C4C9" BorderStyle="None" ToolTip="密码不得超过20位" OnTextChanged="TextBox2_TextChanged" AutoPostBack="True"></asp:TextBox>
            <asp:TextBox ID="TextBox3" runat="server" style="z-index: 1; left: 39%; top: 54%; position: absolute; height: 10%; width: 35%;
background-image:url('image1/5.jpg');background-size: 100% 100%;background-repeat:no-repeat;text-indent:1em; font-size: 24pt; font-family: 宋体; 
font-weight: 700;border-radius:10px;" BackColor="#5EC8CD" BorderColor="#51C4C9" BorderStyle="None" ToolTip="请确认两次密码是否一致" OnTextChanged="TextBox3_TextChanged" AutoPostBack="True"></asp:TextBox>
           
            <asp:Label ID="Label4" runat="server" style="z-index: 1; left: 76%; top: 33%; position: absolute; color: #FF0000; font-size: 14pt; font-family: 楷体;"></asp:Label>
            <asp:Label ID="Label5" runat="server" style="z-index: 1; left: 76%; top: 45%; position: absolute; color: #FF0000; font-size: 14pt; font-family: 楷体;"></asp:Label>
            <asp:Label ID="Label6" runat="server" style="z-index: 1; left: 76%; top: 57%; position: absolute; color: #FF0000; font-size: 14pt; font-family: 楷体;"></asp:Label>
            <asp:Label ID="Label7" runat="server" style="z-index: 1; left: 50%; top: 100%; position: absolute; color: #FF0000; font-size: 14pt; font-family: 楷体;"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label8" runat="server" style="z-index: 1; left: 28.5%; top: 68.5%; position: absolute; font-weight: 400; font-size: 24pt; font-family: 楷体;" Text="邮箱"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" style="z-index: 1; left: 39%; top:66%; position: absolute; height: 10%; width: 25%;
background-image:url('image1/5.jpg');background-size: 100% 100%;background-repeat:no-repeat;text-indent:1em; font-size: 24pt; font-family: 宋体; 
font-weight: 700;border-radius:10px;" BackColor="#5EC8CD" BorderColor="#51C4C9" BorderStyle="None" ToolTip="请输入邮箱"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" style="z-index: 1; left: 65%; top: 66%; position: absolute; height: 10%; width: 8%; font-size: 24pt; font-family: 楷体;" Text="发送" BackColor="#51C4C9" BorderColor="#56C6CB" BorderStyle="None" />
            <br />
            <asp:Label ID="Label9" runat="server" style="z-index: 1; left:25%; top: 80.5%; position: absolute; font-weight: 400; font-size: 24pt; font-family: 楷体;" Text="验证码"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label11" runat="server" style="z-index: 1; left: 76%; top: 81%; position: absolute; color: #FF0000; font-size: 14pt; font-family: 楷体;"></asp:Label>
            <br />
            &nbsp;&nbsp;<asp:Button ID="Button4" runat="server" BackColor="#60C9CD" BorderColor="#52C4C9" BorderStyle="None" OnClick="Button4_Click" Text="返回" style="z-index: 1;left:60%; top: 94%; position: absolute; font-size: 14pt; font-family: 楷体; text-decoration: underline" />
            &nbsp;&nbsp;
            <br />
            &nbsp;<asp:TextBox ID="TextBox5" runat="server" style="z-index: 1; left:39%; top: 78%; position: absolute; height: 10%; width: 35%;
background-image:url('image1/5.jpg');background-size: 100% 100%;background-repeat:no-repeat;text-indent:1em; font-size: 24pt; font-family: 宋体; 
font-weight: 700;border-radius:10px;" BackColor="#5EC8CD" BorderColor="#51C4C9" BorderStyle="None" ToolTip="请输入邮箱验证码" OnTextChanged="TextBox5_TextChanged" AutoPostBack="True"></asp:TextBox>
            <asp:Label ID="Label10" runat="server" style="z-index: 1; left: 76%; top: 69%; position: absolute; color: #FF0000; font-size: 14pt; font-family: 楷体;"></asp:Label>
            <asp:Button ID="Button3" runat="server" BackColor="#57C6CA" BorderColor="#51C4CA" BorderStyle="None" OnClick="Button3_Click" style="z-index: 1; left: 40%; top: 92%; position: absolute; height: 42px; width: 96px;font-size: 24pt; font-weight: 700; font-family: 楷体" Text="注册" />
        </asp:Panel>
            <asp:Button ID="Button6" runat="server" style="color: #FFFFFF; font-size: x-large;" Text="ABOUT" BackColor="#090608" BorderColor="#0A0609" BorderStyle="None" CssClass="auto-style2" OnClick="Button6_Click" />
            <asp:Button ID="Button7" runat="server" style="color: #FFFFFF; font-size: x-large;" Text="CONTACT" BackColor="#090608" BorderColor="#0A0609" BorderStyle="None" CssClass="auto-style1" OnClick="Button7_Click" />
    </form>
</body>
</html>
