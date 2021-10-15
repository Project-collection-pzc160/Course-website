<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GeneralCourse.aspx.cs" Inherits="_20200709.GeneralCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style3 {
            margin-left: 67px;
            margin-top: 22px;
        }
        .auto-style4 {
            width: 1261px;
            height: 722px;
        }
        .auto-style5 {
            width: 80%;
            height: 63%;
            position: absolute;
            left: 68%;
            top: 30%;
        }
        .auto-style7 {
            width: 95%;
            left: 6%;
            top:28%;
            height: 15%;
            position: absolute;
            font-size: 20pt;
        }
        .auto-style16 {
            font-family: Arial;
            font-size: large;
        }
         .auto-style20 {
            width: 458px;
            height: 128px;
            position: absolute;
            left: 1011px;
            top: 6px;
            margin-bottom: 3px;
        }
        .auto-style22 {
            color: #000000;
            }
        .auto-style23 {
            text-align: justify;
        }
        .auto-style24 {
            font-size: 24pt;
            font-weight: bold;
        }
    </style>
</head>
<body style="height: 100%;
            width:100%;            
            margin:0;      
            padding:0;
            overflow:hidden;
            background-image: url('image1/334.png');
            background-size: 100% 100%;
            background-repeat:no-repeat; 
            background-attachment: fixed;">
    <form id="form1" runat="server">
        <div class="auto-style4">
            <asp:Button ID="Button2" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 13px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="退出登录" OnClick="Button2_Click" />
            <br />
            <div class="auto-style20">
                &nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;
                </div>
            <asp:Button ID="Button3" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 204px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt; right: 1584px;" Text="已选课程" OnClick="Button3_Click" />
            <asp:Label ID="Label4" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 30px; top: 4px; position: absolute; color: #FFFFFF; font-size: 18pt; font-family: 楷体; margin-top: 0px;"></asp:Label>
            <br />
            <asp:Button ID="Button4" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 411px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="专业课选课" OnClick="Button4_Click" />
            <asp:Button ID="Button5" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 637px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="通识课选课" OnClick="Button5_Click" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" style="z-index: 1; left:28%; top: 21%; position: absolute; font-size:28pt" Text="选课-通识课"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:sqlcon %>" SelectCommand="SELECT [id], [cname], [credit], [tname], [academy] FROM [gcourses] WHERE (([school] = @school) AND ([cname] LIKE '%' + @cname + '%'))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="school" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="TextBox1" Name="cname" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sqlcon %>" SelectCommand="SELECT [id], [cname], [credit], [tname], [academy] FROM [gcourses] WHERE ([school] = @school)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="school" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:sqlcon %>" SelectCommand="SELECT [id], [cname], [credit], [tname], [academy] FROM [gcourses] WHERE (([school] = @school) AND ([tname] LIKE '%' + @tname + '%'))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="school" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="TextBox1" Name="tname" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <div class="auto-style7">
                <br />
                <span class="auto-style22">学校</span>&nbsp; 
                <asp:DropDownList ID="DropDownList1" runat="server" style="font-size: 20pt">
                    <asp:ListItem>武汉大学</asp:ListItem>
                    <asp:ListItem>哈尔滨工业大学</asp:ListItem>
                    <asp:ListItem>上海交通大学</asp:ListItem>
                    <asp:ListItem>中国海洋大学</asp:ListItem>
                </asp:DropDownList>
                &nbsp; 课程名/教师名&nbsp; 
                <asp:TextBox ID="TextBox1" runat="server" style="font-size: 20pt"></asp:TextBox>
&nbsp;
                <asp:Button ID="Button1" runat="server" BackColor="#99CCFF" Text="查询" OnClick="Button1_Click" style="font-size: 20pt; font-weight: 700" />
                </div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="auto-style3" DataKeyNames="id" DataSourceID="SqlDataSource1"  OnDataBound="GridView1_DataBound" style="left:2%; top:38%;width:55%;height:50%;position:absolute; font-size: 14pt;" >
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="课头号" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="cname" HeaderText="课程名" SortExpression="cname" />
                    <asp:BoundField DataField="credit" HeaderText="学分" SortExpression="credit" />
                    <asp:BoundField DataField="tname" HeaderText="教师名" SortExpression="tname" />
                    <asp:BoundField DataField="academy" HeaderText="授课学院" SortExpression="academy" />
                    <asp:TemplateField HeaderText="选课">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="Select" OnClick="Button1_Click1" Text="选课" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="操作" ShowHeader="True" Text="查看详情" />
                </Columns>
            </asp:GridView>
            &nbsp;&nbsp;<br />
            <div class="auto-style5">
                <div class="auto-style23">
                <br />
&nbsp;&nbsp;&nbsp;<span class="auto-style24">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 选课申请(通识课）</span><br />
                <br />
                </div>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource4" Height="107px" Width="481px" OnDataBound="GridView2_DataBound" style="margin-left: 0px">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="课头号" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="cname" HeaderText="课程名" SortExpression="cname" />
                        <asp:BoundField DataField="state" HeaderText="状态" SortExpression="state" />
                        <asp:TemplateField HeaderText="操作">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Select" OnClick="LinkButton1_Click" Text="删除"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:sqlcon %>" SelectCommand="SELECT [id], [cname], [state] FROM [application2] WHERE (([account] = @account) AND ([type] = @type))">
                    <SelectParameters>
                        <asp:SessionParameter Name="account" SessionField="account" Type="String" />
                        <asp:Parameter DefaultValue="通识课" Name="type" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <font class="auto-style16" color="#ff0000" name="promptTitle" style="margin: 0px; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;">
                <br />
                <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 29px; top: 569px; position: absolute; text-align: left; width: 466px;" Text="提示:&nbsp;选课成功的部分已存在于您的课表中，请确认！"></asp:Label>
                </font></div>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
