<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserCourse.aspx.cs" Inherits="_20200709.selected_courses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            margin-left: 379px;
            font-size: 14pt;
        }
         .auto-style5 {
            width: 458px;
            height: 128px;
            position: absolute;
            left: 1412px;
            top: 0;
            margin-bottom: 3px;
        }
        .auto-style6 {
            font-size: 28pt;
            font-weight: bold;
        }
        .auto-style7 {
            font-size: 20pt;
        }
    </style>
</head>
<body style="background-image: url('image1/335.png');
            background-size: 100% 100%;
            background-repeat:no-repeat; 
            background-attachment: fixed;"">
    <form id="form1" runat="server">
        <div>
                <asp:Label ID="Label1" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 30px; top: 4px; position: absolute; color: #FFFFFF; font-size: 18pt; font-family: 楷体; margin-top: 0px;"></asp:Label>
            <div class="auto-style5">
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;
                </div>
            <br />
            <br />
            <br />
            <br />
                <asp:Button ID="Button3" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 411px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="专业课选课" OnClick="Button3_Click" />
                <asp:Button ID="Button5" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 204px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt; right: 1584px;" Text="已选课程" OnClick="Button5_Click" />
            <br />
                <asp:Button ID="Button4" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 637px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="通识课选课" OnClick="Button4_Click" />
            <br />
                <asp:Button ID="Button2" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 13px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="退出登录" OnClick="Button2_Click" />
                <div class="auto-style2">
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style6">&nbsp;&nbsp; 已选课程表</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            <br />
            <br />
            <div class="auto-style2">
            <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                <span class="auto-style7">
                <br />
                学校&nbsp;</span><asp:DropDownList ID="DropDownList3" runat="server" CssClass="auto-style7" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                    <asp:ListItem>全部</asp:ListItem>
                    <asp:ListItem>武汉大学</asp:ListItem>
                    <asp:ListItem>华中科技大学</asp:ListItem>
                    <asp:ListItem>北京大学</asp:ListItem>
                    <asp:ListItem>清华大学</asp:ListItem>
                </asp:DropDownList>
                <span class="auto-style7">&nbsp; 学年 
            </span> 
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style7">
                <asp:ListItem>2019-2020</asp:ListItem>
                <asp:ListItem>2018-2019</asp:ListItem>
                <asp:ListItem>2017-2018</asp:ListItem>
                <asp:ListItem>2016-2017</asp:ListItem>
            </asp:DropDownList>
                <span class="auto-style7">&nbsp; 学期 
            </span> 
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="auto-style7">
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
            </asp:DropDownList>
                <span class="auto-style7">&nbsp;&nbsp;
            </span>
            <asp:Button ID="Button1" runat="server" Text="查询" BackColor="#99CCFF" OnClick="Button1_Click" CssClass="auto-style7" />
                <br />
            <br />
            <br />
            </div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" Width="1142px" CssClass="auto-style3" PageSize="15">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="课头号" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="cname" HeaderText="课程名" SortExpression="cname" />
                    <asp:BoundField DataField="credit" HeaderText="学分" SortExpression="credit" />
                    <asp:BoundField DataField="school" HeaderText="学校" SortExpression="school" />
                    <asp:BoundField DataField="type" HeaderText="类型" SortExpression="type" />
                    <asp:BoundField DataField="academy" HeaderText="学院" SortExpression="academy" />
                    <asp:BoundField DataField="major" HeaderText="专业" SortExpression="major" />
                    <asp:BoundField DataField="tname" HeaderText="教师名" SortExpression="tname" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="false" CommandName="Select" OnClick="Button1_Click2" Text="撤课" OnClientClick="return confirm('是否确定撤掉该课程吗？')" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:sqlcon %>" SelectCommand="SELECT [id], [cname], [credit], [school], [type], [academy], [major], [tname] FROM [ucourses] WHERE (([schoolyear] = @schoolyear) AND ([schoolterm] = @schoolterm) AND ([account] = @account))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="schoolyear" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList2" Name="schoolterm" PropertyName="SelectedValue" Type="Int32" />
                    <asp:SessionParameter Name="account" SessionField="account" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:sqlcon %>" SelectCommand="SELECT [id], [cname], [credit], [school], [type], [academy], [major], [tname] FROM [ucourses] WHERE (([school] = @school) AND ([schoolyear] = @schoolyear) AND ([schoolterm] = @schoolterm) AND ([account] = @account))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList3" Name="school" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="schoolyear" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList2" Name="schoolterm" PropertyName="SelectedValue" Type="Int32" />
                    <asp:SessionParameter Name="account" SessionField="account" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
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
