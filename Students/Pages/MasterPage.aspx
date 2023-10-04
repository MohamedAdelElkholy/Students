<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MasterPage.aspx.cs" Inherits="Students.MasterPage" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body{
            background-image: url('../imeges/Msater.jpg');
            background-size: cover;
            margin: 0;
            padding: 0;
            direction: rtl;
        }
        .header,.footer{
            padding: 10px;
            background: #000;
            color: #fff;
        }
        .footer{
            position:absolute;
            bottom: 0;
            width: 100%;
            padding: 10px 0;
            text-align: center;
            direction: ltr;
        }
        .footer span{
            color: #f00
        }
        #links{
            margin: 0;
            padding: 0;
            list-style: none;
            display: flex;
        }
        li{
            margin-left: 15px;
            font-size: 18px;
            font-weight: bold;
        }
        li:hover{
            border-bottom: 1px solid #f00;
        }
        li a {
            color: #fff;
            text-decoration:none
        }
        .cards{
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin: 50px auto

        }
        .card{
            padding: 15px;
            border: 2px solid #000;
            flex-grow: 1;
            margin-left: 15px;
            text-align: center;
            border-radius: 5px;
            background-color:#6ab1f7;
            font-size: 20px;
        }
        .card:first-of-type{
            margin-right: 15px;
        }
        .card h4{
            margin: 0
        }
    </style>
</head>
<body>
      
    <div class="header">
        <ul id="links">
            <li><a href="Users_Pages.aspx">المستخدمين</a></li>
            <li><a href="Students.aspx">الطلاب</a></li>
            <li><a href="StudentsReport">تقارير الطلاب</a></li>
        </ul>
    </div>
    <div class="content">
        <div class="cards">
        <div class="card">
            <h4>عـــدد الطــلاب</h4>
            <dx:ASPxLabel ID="Lbl_Students" runat="server" Text="ASPxLabe1" Font-Bold="True"></dx:ASPxLabel>
        </div>
        <div class="card">
            <h4>عـــدد المستخدميـــن</h4>
            <dx:ASPxLabel ID="Lbl_Users" runat="server" Text="ASPxLabe2" Font-Bold="True"></dx:ASPxLabel>
        </div>
        </div>
    </div>
    <div class="footer">
        &copy; Copyright 2023 <span>Mohamed Adel</span>
    </div>
</body>
</html>
