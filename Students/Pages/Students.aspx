<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="Students.aspx.cs" Inherits="Students.Pages.Students" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.5.0, Culture=neutral,
    PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<head runat="server">
    <title></title>
    <header>
        <h1>مرحباً بك في شاشة إضافة الطلاب</h1>
    </header>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            direction: rtl;
        }

        header {
            background-color: #007bff;
            color: #fff;
            text-align: center;
            padding: 18px;
        }

        .StudentsForm {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
    </style>
</head>
   
<body>
    <form id="form1" runat="server">
        <center class="StudentsForm">
            <div style="display:flex; margin-left:10px">

                <dx:ASPxHiddenField ID="Hf_IsEdit" runat="server"></dx:ASPxHiddenField>

                <dx:ASPxTextBox ID="tXt_Name" runat="server" NullText="اســــم الطــــالب"
                    style="margin-right:20px; border-radius:5px;font-size: 18px" Width="190px" Height="40px">
                </dx:ASPxTextBox>

                 <dx:ASPxTextBox ID="tXt_NationalID" max="5" runat="server" NullText="الرقم القومي" 
                    style="margin-right:20px; border-radius:5px;font-size: 18px" Width="190px" Height="40px" MaxLength="14">
                </dx:ASPxTextBox>

                  <dx:ASPxComboBox ID="Cmb_Row1" runat="server" NullText="الصــــف"
                        style="margin-right:20px; border-radius:5px;font-size: 18px" Width="190px" Height="40px">
                      </dx:ASPxComboBox>

                <dx:ASPxComboBox ID="Cmb_Level1" runat="server" NullText="المرحلــــة"
                        style="margin-right:20px; border-radius:5px;font-size: 18px" Width="190px" Height="40px">
                      </dx:ASPxComboBox>

                <dx:ASPxButton ID="btn_Save" runat="server"  OnClick="btn_Save_Click" Text="حفـــظ"
                Style="margin-right: 20px; background: #76f376; border-radius: 5px;font-size: 18px"
                     Width="150px" Height="40px" Font-Bold="True"></dx:ASPxButton>

                <dx:ASPxLabel ID="Lbl_Messagebox" runat="server" Text="" Style="margin-right: 22px;font-size:22px">
                </dx:ASPxLabel>

                </div>  
            <br />
       <dx:ASPxGridView  ID="Gv_Students" runat="server" KeyFieldName="Student_ID"
           OnDataBinding="Gv_Students_DataBinding"  OnRowDeleting="Gv_Students_RowDeleting" 
        SettingsText-CommandDelete="حذف" SettingText-CommandDelete="تعديل" OnRowCommand="Gv_Students_RowCommand"
        style="font-size:16px;width:99vw;margin-right:10px;margin-left:10px">
    <Columns>
        <dx:GridViewDataTextColumn VisibleIndex="0" FieldName="Student_ID" Visible="false"></dx:GridViewDataTextColumn>

         <dx:GridViewDataTextColumn FieldName="RowName" Name="Row" Caption="الصف"
            VisibleIndex="3" Width="20%">
            <CellStyle HorizontalAlign="Center" />
            <HeaderStyle HorizontalAlign="Center" />
        </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="LevelName" Name="Level" Caption="المرحلة"
            VisibleIndex="4" Width="20%">
            <CellStyle HorizontalAlign="Center" />
            <HeaderStyle HorizontalAlign="Center" />
        </dx:GridViewDataTextColumn>
      
        <dx:GridViewDataTextColumn FieldName="Student_IDNumber" Name="Student_IDNumber" Caption="الرقم القومي"
            VisibleIndex="2" Width="20%">
            <CellStyle HorizontalAlign="Center"/>
            <HeaderStyle HorizontalAlign="Center"/>
        </dx:GridViewDataTextColumn>

        <dx:GridViewDataTextColumn FieldName="Student_Name" Name="Name" 
            Caption="اسم الطالب" VisibleIndex="1" Width="20%">
            <CellStyle HorizontalAlign="Center" />
            <HeaderStyle HorizontalAlign="Center" />
        </dx:GridViewDataTextColumn>

        <dx:GridViewCommandColumn 
            ShowDeleteButton="true" VisibleIndex="6"  Caption="حـــذف">
            <HeaderStyle HorizontalAlign="Center"/>
        </dx:GridViewCommandColumn>     
        
           <dx:GridViewDataTextColumn Caption="تعديــل">
                 <DataItemTemplate>
                 <dx:ASPxButton ID="btn_Edit" runat="server" Text="تعديل" CommandName="Edit" VisibleIndex="5" 
                     Style="border-radius:5px;">
                 </dx:ASPxButton>
                 </DataItemTemplate>
                     <CellStyle HorizontalAlign="Center" />
                     <HeaderStyle HorizontalAlign="Center" />
           </dx:GridViewDataTextColumn>
    </Columns> 
  </dx:ASPxGridView> 
        </center>
    </form>
</body>

