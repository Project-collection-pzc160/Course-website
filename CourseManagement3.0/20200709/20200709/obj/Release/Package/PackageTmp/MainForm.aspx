<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainForm.aspx.cs" Inherits="_20200709.MainForm" %>

<meta http-equiv="Page-Enter" content="revealtrans(duration=10.0, transition=8)">

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            z-index: 1;
            left: 27%;
            top: 4%;
            position: absolute;
            width: 189px;
        }
        .auto-style2 {
            z-index: 1;
            left: 19%;
            top: 4%;
            position: absolute;
            width: 153px;
            right: 1368px;
        }
    </style>
</head>
<body style="height: 100%;
            width:100%;            
            margin:0; 
            padding:0;

            background-image:url('image1/mainform3.png');
            background-size: 100% 100%;
            background-repeat:no-repeat; 
            background-attachment: fixed;">
    <form id="form1" runat="server">
        <div style="height: 687px">
            <asp:Button ID="Button1" runat="server" style="color: #FFFFFF; font-size: x-large;" Text="ABOUT" BackColor="#090608" BorderColor="#0A0609" BorderStyle="None" CssClass="auto-style2" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" style="color: #FFFFFF; font-size: x-large;" Text="CONTACT" BackColor="#090608" BorderColor="#0A0609" BorderStyle="None" CssClass="auto-style1" OnClick="Button2_Click" />
        </div>
    </form>
</body>
</html>
