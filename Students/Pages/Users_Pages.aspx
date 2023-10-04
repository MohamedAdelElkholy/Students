<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users_Pages.aspx.cs" Inherits="Students.Pages.Users_Pages" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <header>
        <h1>مرحباً بك في شاشة تسجيل المستخدمين</h1>
    </header>
    <style>
        body
        {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            direction: rtl;
        }

        header
        {
            background-color: rebeccapurple;
            color: #fff;
            text-align: center;
            padding: 18px;
        }

        .UsersForm 
        {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <center class="UsersForm">
        <div style="display:flex">
            <dx:ASPxHiddenField runat="server" ID="hf_IsEdit"></dx:ASPxHiddenField>
            <dx:ASPxTextBox ID="txt_UserName" runat="server" NullText="اســم المستخــدم"   
               style="margin-right:20px; border-radius:5px;font-size: 18px" Width="190px" Height="40px">
            </dx:ASPxTextBox>

            <dx:ASPxTextBox ID="txt_UserPassword" runat="server" NullText="كلمــة المــرور"   
               style="margin-right:20px ; border-radius:5px ; font-size: 18px ;" Width="190px" Height="40px">
            </dx:ASPxTextBox>

            <div style="text-align: center;font-size: 18px">
               <label for="Chk_Active" style="display: block; margin-bottom: 5px; margin-right:20px">مفعل </label>
               <asp:CheckBox ID="Chk_Active" runat="server" style="margin-right: 10px; border-radius: 5px;" />
            </div>
             
            <dx:ASPxButton ID="btn_Save" runat="server" Text="حفظ" OnClick="btn_Save_Click"
                 Style="margin-right: 20px; background: #76f376; border-radius: 5px;font-size: 18px"
                     Width="150px" Height="40px" Font-Bold="True">
            </dx:ASPxButton>
            </div>    
            
            <div>
                <br />
             <dx:ASPxGridView ID="Gv_User" runat="server" KeyFieldName="ID" OnRowDeleting="Gv_User_RowDeleting"
                  SettingsText-CommandDelete="حذف" SettingsText-CommandUpdate="تعديل" OnDataBinding="Gv_User_DataBinding" 
                   OnRowCommand="Gv_User_RowCommand"
                 style="font-size:16px;width:99vw;margin-right:10px;margin-left:10px">
                <Columns>
                    <dx:GridViewDataTextColumn VisibleIndex="0" FieldName="ID" Visible="false"></dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn FieldName="UserName" Name="Name" Caption="اسم المستخدم" VisibleIndex="1" Width="25%">                       
                        <CellStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn FieldName="Password" Name="Password" Caption="كلمة المرور" VisibleIndex="2" Width="25%">
                        <CellStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn FieldName="is_active" Name="active" Caption="مفعل / غير مفعل" VisibleIndex="3" Width="25%">
                        <CellStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </dx:GridViewDataTextColumn>

                  <dx:GridViewCommandColumn ShowDeleteButton="true" VisibleIndex="5" Caption="حذف" Width="15%">
                        <CellStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" />
                  </dx:GridViewCommandColumn>  
                    
                  <dx:GridViewDataTextColumn Caption="تعديل">
                     <DataItemTemplate>
                     <dx:ASPxButton ID="btn_Edit" runat="server" Text="تعديل" CommandName="Edit" VisibleIndex="4" 
                         Style="border-radius:5px;">
                     </dx:ASPxButton>
                       </DataItemTemplate>
                       <CellStyle HorizontalAlign="Center" />
                       <HeaderStyle HorizontalAlign="Center" />
                  </dx:GridViewDataTextColumn>

                </Columns> 
            </dx:ASPxGridView>    
           </div>    
        </center>
    </form>
</body>
</html>
