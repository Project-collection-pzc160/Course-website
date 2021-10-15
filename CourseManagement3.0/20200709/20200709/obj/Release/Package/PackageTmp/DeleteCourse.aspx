<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeleteCourse.aspx.cs" Inherits="_20200709.DeleteCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
            margin-top: 0px;
            width: 557px;
            height: 514px;
            position: absolute;
            top: 61px;
            left: 487px;
            z-index: 1;
            font-size: 16pt;
            line-height:18pt;
        }
        .auto-style2 {
            text-align: center;
            top:30%;
            position:absolute;
        }
        .auto-style4 {
            text-align: left;
            font-size: 20pt;
        }
        .auto-style6 {
            position: absolute;
            top: 20px;
            left: 463px;
            z-index: 1;
            width: 410px;
            right: -373px;
            font-size: 20pt;
        }
        .auto-style7 {
            position: absolute;
            top: 13px;
            left: 896px;
            z-index: 1;
            height: 41px;
            width: 345px;
            font-size: 20pt;
        }
        .auto-style8 {
            position: absolute;
            top: 14px;
            left: 1286px;
            z-index: 1;
            width: 121px;
            height: 45px;
            font-size: 20pt;
        }
        </style>
</head>
<body style="height: 100%;
            width:100%;            
            margin:0;      
            padding:0;
            overflow:hidden;
            background-image: url('image1/444.png');
            background-size: 100% 100%;
            background-repeat:no-repeat; 
            background-attachment: fixed;">
    <p>
        <br />
    </p>
    <p>
        &nbsp;</p>
    <form id="form1" runat="server">
        <asp:Button ID="Button3" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 13px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="退出登录" OnClick="Button3_Click" />
    <p>
        &nbsp;</p>
        <div class="auto-style2">
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <br />
            <br />
            <asp:Label ID="Label13" runat="server" CssClass="auto-style6" Text="请输入删除课程的课头号："></asp:Label>
&nbsp;<asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style7"></asp:TextBox>
&nbsp;
            <asp:Button ID="Button1" runat="server" Text="查询" OnClick="Button1_Click" CssClass="auto-style8" />
            <br />
            <div class="auto-style4">
                <p style="line-height: 150%">
            <asp:Panel ID="Panel1" runat="server" CssClass="auto-style1">
                <div class="auto-style4">
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label14" runat="server" Text="课头号："></asp:Label>
                    &nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label15" runat="server" Text="课程名："></asp:Label>
                    &nbsp;<asp:Label ID="Label2" runat="server"></asp:Label>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label16" runat="server" Text=" 学分："></asp:Label>
                    &nbsp;
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label17" runat="server" Text="教师名："></asp:Label>
                    &nbsp;<asp:Label ID="Label4" runat="server"></asp:Label>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label18" runat="server" Text="授课学院："></asp:Label>
                    <asp:Label ID="Label5" runat="server"></asp:Label>
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <asp:Panel ID="Panel2" runat="server">
                    <div class="auto-style4">
                        &nbsp;&nbsp;
                        <asp:Label ID="Label19" runat="server" Text="专业："></asp:Label>
                        &nbsp;
                        <asp:Label ID="Label6" runat="server"></asp:Label>
                        <br />
                        <br />
                        &nbsp;&nbsp;
                        <asp:Label ID="Label20" runat="server" Text="年级："></asp:Label>
                        &nbsp;
                        <asp:Label ID="Label7" runat="server"></asp:Label>
                    </div>
                </asp:Panel>
                <div class="auto-style4">
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label21" runat="server" Text="学年："></asp:Label>
                    &nbsp;
                    <asp:Label ID="Label8" runat="server"></asp:Label>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label22" runat="server" Text="学期："></asp:Label>
                    &nbsp;
                    <asp:Label ID="Label9" runat="server"></asp:Label>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label23" runat="server" Text="类型："></asp:Label>
                    &nbsp;
                    <asp:Label ID="Label10" runat="server"></asp:Label>
                    <br />
                    <br />
                    &nbsp;&nbsp;
                    <asp:Label ID="Label24" runat="server" Text="学校："></asp:Label>
                    &nbsp;
                    <asp:Label ID="Label11" runat="server"></asp:Label>
                    <br />
                    &nbsp;<br />
                    </div>
            </asp:Panel>
                <br />
                <br />
                <br />
            </div>
        </div>
        <asp:Button ID="Button4" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 187px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt; right: 1584px;" Text="发布课程" OnClick="Button4_Click" />
        <asp:Button ID="Button5" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 361px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="删除课程" OnClick="Button5_Click" />
        <asp:Button ID="Button6" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 535px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="修改课程" OnClick="Button6_Click" />
        <p>
            <asp:Button ID="Button8" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 709px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="选课状态" OnClick="Button8_Click" />
        </p>
        <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" style="z-index: 1; left: 1141px; top: 764px; position: absolute; height: 117px; width: 209px; font-size: 24pt" Text="删除课程" />
    </form>
</body>
</html>
