<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateCourse.aspx.cs" Inherits="_20200709.UpdateCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">

        .auto-style1 {
            margin-left: 0px;
            margin-top: 0px;
            margin-bottom: 2px;
            width: 513px;
            height: 679px;
            position: absolute;
            top: 325px;
            left: 422px;
            z-index: 1;
            text-align: right;
            font-size: 18pt;
        }
        .auto-style2 {
            text-align: center;
        }
        center {
        }
        .auto-style3 {
            text-align: right;
            font-size: 20pt;
            line-height:10pt;
        }
        .auto-style7 {
            position: absolute;
            top: 292px;
            left: 435px;
            z-index: 1;
            width: 416px;
            right: 1115px;
            font-size: 20pt;
        }
        .auto-style8 {
            position: absolute;
            top: 292px;
            left: 862px;
            z-index: 1;
            width: 277px;
            height: 38px;
            right: 819px;
            margin-bottom: 6px;
            font-size: 20pt;
        }
        .auto-style9 {
            position: absolute;
            top: 291px;
            left: 1206px;
            z-index: 1;
            height: 44px;
            width: 110px;
            font-size: 20pt;
        }
        </style>
</head>
<body style="height: 100%;
            width:100%;            
            margin:0;      
            padding:0;
            overflow:hidden;
            background-image: url('image1/445.png');
            background-size: 100% 100%;
            background-repeat:no-repeat; 
            background-attachment: fixed;">
    <form id="form1" runat="server">
        <div class="auto-style3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;<br />
        </div>
    <div class="auto-style2">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" CssClass="auto-style9" OnClick="Button1_Click" Text="查询" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label15" runat="server" CssClass="auto-style7" Text="请输入修改课程的课头号:"></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style8"></asp:TextBox>
&nbsp;
        </div>
        <div class="auto-style2">
            <asp:Panel ID="Panel1" runat="server" CssClass="auto-style1">
                <div class="auto-style3">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="课程名："></asp:Label>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="TextBox2" runat="server" Height="35px" Width="255px" style="font-size: 18pt"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label7" runat="server" Text="学分："></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox3" runat="server" Height="35px" Width="255px" style="font-size: 18pt"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label8" runat="server" Text="教师名："></asp:Label>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="TextBox4" runat="server" Height="35px" Width="255px" style="font-size: 18pt"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label9" runat="server" Text="授课学院："></asp:Label>
                    &nbsp;&nbsp;<asp:TextBox ID="TextBox5" runat="server" Height="35px" Width="255px" style="font-size: 18pt"></asp:TextBox>
                    <br />
                    <br />
                </div>
                <asp:Panel ID="Panel2" runat="server">
                    <div class="auto-style3">
                        <asp:Label ID="Label10" runat="server" Text="专业："></asp:Label>
                        &nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox6" runat="server" Height="35px" Width="255px" style="font-size: 18pt"></asp:TextBox>
                        <br />
                        <br />
                        <asp:Label ID="Label11" runat="server" Text="年级："></asp:Label>
                        &nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox7" runat="server" Height="35px" Width="255px" style="font-size: 18pt"></asp:TextBox>
                    </div>
                </asp:Panel>
                <div class="auto-style3">
                    <br />
                    <asp:Label ID="Label12" runat="server" Text="学年："></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox8" runat="server" Height="35px" Width="255px" style="font-size: 18pt"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label13" runat="server" Text="学期："></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox9" runat="server" Height="35px" Width="255px" style="font-size: 18pt"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="Label14" runat="server" Text="学校："></asp:Label>
                    &nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="TextBox10" runat="server" Height="35px" Width="255px" style="font-size: 18pt"></asp:TextBox>
                    <br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <br />
                </div>
            </asp:Panel>
        </div>
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" style="z-index: 1; left: 1141px; top: 764px; position: absolute; height: 117px; width: 209px; font-size: 24pt" Text="修改课程" />
        <asp:Label ID="Label16" runat="server" style="z-index: 1; left: 676px; top: 339px; position: absolute; font-size: 20pt"></asp:Label>
        <asp:Label ID="Label17" runat="server" style="z-index: 1; left: 676px; top: 384px; position: absolute; font-size: 20pt"></asp:Label>
        <asp:Label ID="Label18" runat="server" style="z-index: 1; left: 539px; top: 339px; position: absolute; font-size: 20pt; right: 1256px" Text="课头号："></asp:Label>
        <asp:Label ID="Label19" runat="server" style="z-index: 1; left: 566px; top: 384px; position: absolute; font-size: 20pt" Text="类型："></asp:Label>
        <asp:Button ID="Button4" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 13px; top: 39px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="退出登录" OnClick="Button4_Click" />
        <asp:Button ID="Button5" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 187px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt; right: 1584px;" Text="发布课程" OnClick="Button5_Click" />
        <asp:Button ID="Button6" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 535px; top: 39px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="修改课程" OnClick="Button6_Click" />
        <asp:Button ID="Button7" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 361px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="删除课程" OnClick="Button7_Click" />
        <asp:Button ID="Button8" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 709px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="选课状态" OnClick="Button8_Click" />
    </form>
    </body>
</html>
