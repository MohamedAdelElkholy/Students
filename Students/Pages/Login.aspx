<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProjectDevExpress.Pages.Login" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            background-image: url('../imeges/School.png');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            height: 100vh;
            margin: 0;
            padding: 0;
            direction:rtl;
        }

        .loginForm 
        {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border: 2px solid #000; /* تعريف حدود بسمك 2 بكسل ولون أسود حول العنصر */
            padding: 20px; /* تعريف هامش داخلي للعنصر */
            border-radius: 10px; /* تعريف زوايا مستديرة */
            background-color: transparent; /* لون خلفية العنصر */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* إضافة ظل للعنصر */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <center class="loginForm">       
            <header>
                <h1>مرحباً بك في موقعك</h1>
            </header>
            <div>
                <dx:ASPxTextBox ID="txt_UserName" runat="server" NullText="أدخل إسم المستخدم"
                    Style="margin-right: 5px; border-radius: 5px;font-size: 18px;border: 2px solid #000;
                    background:transparent" Width="200px" Height="50px">
                </dx:ASPxTextBox>
                <br />
                <dx:ASPxTextBox ID="txt_Password" runat="server" Password="True" NullText=" أدخل كلمة المرور"
                    Style="margin-right: 5px; border-radius: 5px;font-size: 18px;border: 2px solid #000;
                    background:transparent" Width="200px" Height="50px">
                </dx:ASPxTextBox>
            </div>
            <br />
            <div>
                <dx:ASPxButton ID="btn_Login" OnClick="btn_Login_Click" runat="server"
                    Style="margin-right: 5px; background:transparent ;border: 2px solid #000; border-radius: 5px;
                    font-size: 18px" Text="دخــــول" Width="150px" Height="50px" Font-Bold="True">
                </dx:ASPxButton>
                <dx:ASPxLabel ID="LbL_outputMassage" runat="server" Style="margin-right: 10px; border-radius: 5px">
                </dx:ASPxLabel>
            </div>
        </center>
    </form>
</body>
</html>
