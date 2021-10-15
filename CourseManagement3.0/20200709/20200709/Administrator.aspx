<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Administrator.aspx.cs" Inherits="_20200709.Administrator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
            font-size: 20pt;
        }
        .auto-style2 {
            text-align: center;
            height: 681px;
        }
        .auto-style3 {
            margin-left: 414px;
        }
        .auto-style4 {
            font-size: 20pt;
        }
        </style>
</head>
<body style="height: 100%;
            width:100%;            
            margin:0;      
            padding:0;
            overflow:hidden;
            background-image: url('image1/441.png');
            background-size: 100% 100%;
            background-repeat:no-repeat; 
            background-attachment: fixed;"">>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
        <div class="auto-style2">
            <br />
            <asp:Button ID="Button2" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 13px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="退出登录" OnClick="Button2_Click1" />
            <asp:Button ID="Button6" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 709px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="选课状态" OnClick="Button6_Click" />
            <br />
            <asp:Button ID="Button3" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 187px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt; right: 1271px;" Text="发布课程" OnClick="Button3_Click1" />
            <br />
            <asp:Button ID="Button5" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 535px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt" Text="修改课程" OnClick="Button5_Click" />
            <br />
            <br />
            <asp:Button ID="Button4" runat="server" BackColor="Black" BorderColor="Black" BorderStyle="None" style="z-index: 1; left: 361px; top: 40px; position: absolute; color: #FFFFFF; font-size: 18pt; right: 1079px;" Text="删除课程" OnClick="Button4_Click1" />
            <br />
            <br />
            <span class="auto-style4">
            <br />
            课头号：</span><asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="120px" CssClass="auto-style4"></asp:TextBox>
            <span class="auto-style4">&nbsp;用户名：</span><asp:TextBox ID="TextBox2" runat="server" Height="25px" Width="141px" CssClass="auto-style4"></asp:TextBox>
            <span class="auto-style4">&nbsp;选课状态：<asp:DropDownList ID="DropDownList1" runat="server" CssClass="auto-style1" Height="38px" Width="178px">
                <asp:ListItem>待审核</asp:ListItem>
                <asp:ListItem>成功</asp:ListItem>
                <asp:ListItem>失败</asp:ListItem>
            </asp:DropDownList>
&nbsp;&nbsp;</span><asp:Button ID="Button1" runat="server" Height="50px" OnClick="Button1_Click" Text="查询" CssClass="auto-style4" />
            <br />
            <br />
&nbsp;<br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Height="481px" OnDataBound="GridView1_DataBound" Width="1066px" CssClass="auto-style3">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="课头号" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="cname" HeaderText="课程名" SortExpression="cname" />
                    <asp:BoundField DataField="account" HeaderText="用户名" SortExpression="account" />
                    <asp:BoundField DataField="state" HeaderText="选课状态" SortExpression="state" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Select" OnClick="LinkButton1_Click" Text="同意"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="false" CommandName="Select" OnClick="LinkButton2_Click" Text="拒绝"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:sqlcon %>" SelectCommand="SELECT [id], [cname], [account], [state] FROM [application2] WHERE (([state] = @state) AND ([id] = @id)) ORDER BY [account]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="state" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="TextBox1" Name="id" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:sqlcon %>" SelectCommand="SELECT [id], [cname], [account], [state] FROM [application2] WHERE (([state] = @state) AND ([id] = @id) AND ([account] = @account))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="state" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="TextBox1" Name="id" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox2" Name="account" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:sqlcon %>" SelectCommand="SELECT [id], [cname], [account], [state] FROM [application2] WHERE (([state] = @state) AND ([account] = @account)) ORDER BY [id]">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="state" PropertyName="SelectedValue" Type="String" />
                    <asp:ControlParameter ControlID="TextBox2" Name="account" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:sqlcon %>" SelectCommand="SELECT [id], [cname], [account], [state] FROM [application2] WHERE ([state] = @state)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="state" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
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
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
