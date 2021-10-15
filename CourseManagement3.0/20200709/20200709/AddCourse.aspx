<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCourse.aspx.cs" Inherits="_20200709.AddCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
            margin-top: 0px;
            width: 639px;
            height: 782px;
            position: absolute;
            top: 348px;
            left: 348px;
            z-index: 1;
            font-size: 18pt;
            line-height:11pt;
            text-align: right;
        }
        .auto-style4 {
            text-align: center;
        }
        .auto-style6 {
            text-align: left;
            height: 798px;
        }
        .auto-style8 {
            width: 415px;
            height: 30px;
            position: absolute;
            top: 292px;
            left: 987px;
            z-index: 1;
            font-size: 20pt;
        }
        .auto-style9 {
            position: absolute;
            top: 300px;
            left: 635px;
            z-index: 1;
            width: 334px;
            right: 997px;
            height: 24px;
            font-size: 20pt;
        }
    </style>
</head>
<body  style="height: 100%;
            width:100%;            
            margin:0;      
            padding:0;
            overflow:hidden;
            background-image: url('image1/442.png');
            background-size: 100% 100%;
            background-repeat:no-repeat; 
            background-attachment: fixed;">
    <form id="form1" runat="server">
        <div class="auto-style4">
            <div class="auto-style6">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal" CssClass="auto-style8">
                    <asp:ListItem>通识课</asp:ListItem>
                    <asp:ListItem>专业课</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <br />
            <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" CssClass="auto-style9" Text="选择发布的课程类型："></asp:Label>
                <asp:Button ID="Button2" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 13px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="退出登录" OnClick="Button2_Click" />
                <asp:Button ID="Button3" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 187px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt; right: 1584px;" Text="发布课程" OnClick="Button3_Click" />
                <asp:Button ID="Button4" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 535px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="修改课程" OnClick="Button4_Click" />
                <asp:Button ID="Button5" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 361px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="删除课程" OnClick="Button5_Click" />
                <asp:Button ID="Button6" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 709px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="选课状态" OnClick="Button6_Click" />
            </div>
            <asp:Panel ID="Panel1" runat="server" CssClass="auto-style1">
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Text=" 课头号："></asp:Label>
                &nbsp;&nbsp;<asp:TextBox ID="TextBox1" runat="server" Height="35px"  Width="255px"></asp:TextBox>
                <br />
&nbsp;<br />
                <asp:Label ID="Label4" runat="server" Text="课程名："></asp:Label>
                &nbsp;
                <asp:TextBox ID="TextBox2" runat="server" Height="35px" Width="255px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label5" runat="server" Text="学分："></asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="TextBox3" runat="server" Height="35px" Width="255px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="教师名："></asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="TextBox4" runat="server" Height="35px" Width="255px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label7" runat="server" Text="授课学院："></asp:Label>
                &nbsp; &nbsp;<asp:TextBox ID="TextBox5" runat="server" Height="35px" Width="255px"></asp:TextBox>
                <br />
                <br />
                <asp:Panel ID="Panel2" runat="server">
                    <asp:Label ID="Label8" runat="server" Text="专业："></asp:Label>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="TextBox6" runat="server" Height="35px" Width="255px"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label9" runat="server" Text="年级："></asp:Label>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="TextBox7" runat="server" Height="35px" Width="255px"></asp:TextBox>
                </asp:Panel>
                <br />
                <asp:Label ID="Label10" runat="server" Text=" 学年："></asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="TextBox8" runat="server" Height="35px" Width="255px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label11" runat="server" Text=" 学期："></asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="TextBox9" runat="server" Height="35px" Width="255px"></asp:TextBox>
                <br />
                <br />
                <asp:Label ID="Label12" runat="server" Text="学校："></asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="TextBox10" runat="server" Height="35px" Width="255px"></asp:TextBox>
                <br />
                <br />
                <br />
                <br />
            </asp:Panel>
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click1" style="z-index: 1; left: 1141px; top: 764px; position: absolute; height: 117px; width: 209px; font-size: 24pt" Text="发布课程" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
