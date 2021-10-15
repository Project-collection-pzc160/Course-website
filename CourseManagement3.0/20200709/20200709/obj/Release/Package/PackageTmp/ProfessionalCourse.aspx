<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProfessionalCourse.aspx.cs" Inherits="_20200709.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #Text1 {
            height: 88px;
            width: 582px;
        }
        .auto-style6 {
            margin-left: 326px;
            font-size: 20pt;
        }
        .auto-style7 {
            margin-left: 78px;
            font-size: 14pt;
        }
        .auto-style8 {
            height: 957px;
            margin-top: 0px;
            width: 1489px;
        }
        .auto-style10 {
            width: 52%;
            height: 54%;
            position: absolute;
            left: 68%;
            top: 30%;
        }
        .auto-style11 {
            text-align: justify;
        }
        .auto-style12 {
            text-align: justify;
            width: 1039px;
            margin-left: 162px;
            left:3%;
        }
        .auto-style13 {
            text-align: justify;
            margin-left: 108px;
            left:1%;
        }
        .auto-style15 {
            font-size: x-large;
            font-weight: bold;
        }
        .auto-style16 {
            font-family: Arial;
            font-size: large;
        }
        .auto-style21 {
            font-size: 20pt;
            left:2%;
        }
        .auto-style22 {
            font-size: 24pt;
            font-weight: bold;
        }
        </style>
</head>
<body style="height: 100%;
            width:100%;            
            margin:0;      
            padding:0;
            overflow:hidden ;
            background-image: url('image1/334.png');            
            background-size: 100% 100%;
            background-repeat:no-repeat; 
            background-attachment: fixed;"">
    <form id="form1" runat="server">
        <div class="auto-style8">
                <asp:Label ID="Label1" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 30px; top: 4px; position: absolute; color: #FFFFFF; font-size: 18pt; font-family: 楷体; margin-top: 0px;"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
            <br />
            <br />
            <br />
            <asp:Button ID="Button3" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 13px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="退出登录" OnClick="Button3_Click" />
            <asp:Button ID="Button4" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 411px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="专业课选课" OnClick="Button4_Click" />
            <asp:Button ID="Button6" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 204px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt; right: 1584px;" Text="已选课程" OnClick="Button6_Click" />
            <br />
            <asp:Button ID="Button5" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 637px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="通识课选课" OnClick="Button5_Click" />
            <br />
            <br />
            <br />
            &nbsp;<br />
                <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 1338px; top: 839px; position: absolute; color: #FF0000; width: 497px" Text="提示:&nbsp;选课成功的部分已存在于您的课表中，请确认！"></asp:Label>
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" style="z-index: 1; left:28%; top: 21%; position: absolute; font-size:28pt" Text="选课-专业课"></asp:Label>
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <asp:Panel ID="Panel2" runat="server">
                <div class="auto-style11">
                    <br />
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" CssClass="auto-style6" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal" Width="832px">
                        <asp:ListItem>按学院查询</asp:ListItem>
                        <asp:ListItem>按课程名查询</asp:ListItem>
                    </asp:RadioButtonList>
                    <br />
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel3" runat="server" Visible="False">
                <div class="auto-style13">
                    <span class="auto-style21"> 学校&nbsp;</span><asp:DropDownList ID="DropDownList5" runat="server" CssClass="auto-style21" Height="43px" Width="205px">
                        <asp:ListItem>武汉大学</asp:ListItem>
                        <asp:ListItem>哈尔滨工业大学</asp:ListItem>
                        <asp:ListItem>上海交通大学</asp:ListItem>
                        <asp:ListItem>中国海洋大学</asp:ListItem>
                    </asp:DropDownList>
                    <span class="auto-style21">&nbsp;院系 </span>
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style21" Height="45px">
                        <asp:ListItem>计算机学院</asp:ListItem>
                        <asp:ListItem>测绘学院</asp:ListItem>
                        <asp:ListItem>文学院</asp:ListItem>
                        <asp:ListItem>法学院</asp:ListItem>
                    </asp:DropDownList>
                    <span class="auto-style21">&nbsp;专业 </span>
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="auto-style21">
                        <asp:ListItem>计算机科学与技术</asp:ListItem>
                        <asp:ListItem>软件工程</asp:ListItem>
                        <asp:ListItem>计算机类</asp:ListItem>
                    </asp:DropDownList>
                    <span class="auto-style21">&nbsp;年级 </span>
                    <asp:DropDownList ID="DropDownList3" runat="server" CssClass="auto-style21">
                        <asp:ListItem>2018</asp:ListItem>
                        <asp:ListItem>2019</asp:ListItem>
                        <asp:ListItem>2017</asp:ListItem>
                        <asp:ListItem>2016</asp:ListItem>
                    </asp:DropDownList>
                    <span class="auto-style21">&nbsp; </span>
                    <asp:Button ID="Button2" runat="server" BackColor="#99CCFF" Text="查询" OnClick="Button2_Click" CssClass="auto-style21" />
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel4" runat="server" Visible="False">
                <div class="auto-style12">
                    <span class="auto-style21">学校&nbsp;</span><asp:DropDownList ID="DropDownList6" runat="server" CssClass="auto-style21" Width="227px">
                        <asp:ListItem>武汉大学</asp:ListItem>
                        <asp:ListItem>哈尔滨工业大学</asp:ListItem>
                        <asp:ListItem>上海交通大学</asp:ListItem>
                        <asp:ListItem>中国海洋大学</asp:ListItem>
                    </asp:DropDownList>
                    <span class="auto-style21">&nbsp; 年级 </span>
                    <asp:DropDownList ID="DropDownList4" runat="server" CssClass="auto-style21">
                        <asp:ListItem>2018</asp:ListItem>
                        <asp:ListItem>2019</asp:ListItem>
                        <asp:ListItem>2017</asp:ListItem>
                        <asp:ListItem>2016</asp:ListItem>
                    </asp:DropDownList>
                    <span class="auto-style21">&nbsp; 课程名 </span> 
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style21"></asp:TextBox>
                    <span class="auto-style21">&nbsp;&nbsp; </span>
                    <asp:Button ID="Button1" runat="server" BackColor="#99CCFF" Text="查询" OnClick="Button1_Click1" CssClass="auto-style21" />
                </div>
            </asp:Panel>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="auto-style7" DataKeyNames="id" DataSourceID="SqlDataSource2" Width="1083px" OnDataBound="GridView1_DataBound">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="课头号" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="cname" HeaderText="课程名" SortExpression="cname" />
                    <asp:BoundField DataField="credit" HeaderText="学分" SortExpression="credit" />
                    <asp:BoundField DataField="tname" HeaderText="教师名" SortExpression="tname" />
                    <asp:BoundField DataField="academy" HeaderText="授课学院" SortExpression="academy" />
                    <asp:BoundField DataField="major" HeaderText="专业" SortExpression="major" />
                    <asp:BoundField DataField="grade" HeaderText="年级" SortExpression="grade" />
                    <asp:TemplateField HeaderText="选课">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="Select" OnClick="Button1_Click" Text="选课" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ButtonField ButtonType="Button" CommandName="Select" HeaderText="操作" ShowHeader="True" Text="课程详情" />
                </Columns>
            </asp:GridView>
            <div class="auto-style10">
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style15">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </span><span class="auto-style22">选课申请单（专业课）</span><span class="auto-style15"><br />
                </span><br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Height="107px" Width="481px" OnDataBound="GridView2_DataBound">
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sqlcon %>" SelectCommand="SELECT [id], [cname], [state] FROM [application2] WHERE (([account] = @account) AND ([type] = @type))">
                    <SelectParameters>
                        <asp:SessionParameter Name="account" SessionField="account" Type="String" />
                        <asp:Parameter DefaultValue="专业课" Name="type" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp; <font class="auto-style16" color="#ff0000" name="promptTitle" style="margin: 0px; padding: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;">
                <br />
                <br />
                </font><br />
                <br />
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:sqlcon %>" SelectCommand="SELECT [id], [cname], [credit], [tname], [academy], [major], [grade] FROM [pcourses] WHERE (([grade] = @grade) AND ([school] = @school) AND ([cname] LIKE '%' + @cname + '%'))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList4" Name="grade" PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="DropDownList6" Name="school" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="TextBox1" Name="cname" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:sqlcon %>" SelectCommand="SELECT [id], [cname], [credit], [tname], [academy], [major], [grade] FROM [pcourses] WHERE (([academy] = @academy) AND ([major] = @major) AND ([grade] = @grade) AND ([school] = @school))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="academy" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList2" Name="major" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList3" Name="grade" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList5" Name="school" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:sqlcon %>" SelectCommand="SELECT [id], [cname], [credit], [tname], [academy], [major], [grade] FROM [pcourses] WHERE (([grade] = @grade) AND ([school] = @school))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList4" Name="grade" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList6" Name="school" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>
</html>
