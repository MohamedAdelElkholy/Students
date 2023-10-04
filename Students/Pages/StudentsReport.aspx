<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="StudentsReport.aspx.cs" Inherits="Students.Pages.StudentsReport" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <header>
            <h1>مرحباً بك في شاشة تقارير الطلاب</h1>
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
                background-color: #767d0b;
                color: #fff;
                text-align: center;
                padding: 18px;
            }

            .StudentsReportForm {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            }
        </style>
    </head>
<body>
    <form id="form1" runat="server">
        <center class="StudentsReportForm">
        <div style="display:flex; margin-left:10px">

            <dx:ASPxComboBox ID="Cmb_Name" runat="server" NullText="اســم الطــالب"  ValueType="System.String"
                style="margin-right:10px; border-radius:5px;font-size: 18px" Width="190px" Height="40px"
                IncrementalFilteringMode="StartsWith" DropDownStyle="DropDown">
            </dx:ASPxComboBox>

            <dx:ASPxComboBox ID="Cmb_Row1" runat="server" NullText="الصـــف" ValueType="System.String"
               style="margin-right:10px; border-radius:5px;font-size: 18px" Width="190px" Height="40px">
               </dx:ASPxComboBox>

            <dx:ASPxComboBox ID="Cmb_Level" runat="server" NullText="المرحلــة" 
                style="margin-right:10px; border-radius:5px;font-size: 18px" Width="190px" Height="40px">
               </dx:ASPxComboBox>

            <dx:ASPxTextBox ID="txt_Name" runat="server" Width="170px"  style="margin-right:10px;border-radius:5px;">
            </dx:ASPxTextBox>

        <dx:ASPxButton ID="btn_Search" runat="server" OnClick="btn_Search_Click"  Text="بحـــث"
            style="margin-right:10px;background:#76f376; border-radius:5px;font-size: 18px" Width="190px" Height="40px"
            Font-Bold="True"> 
        </dx:ASPxButton>
            <dx:ASPxLabel ID="Lbl_MesSearch" runat="server" Text="" Style="margin-right: 22px;font-size:22px">
                </dx:ASPxLabel>
       </div>
        <div>
            <br />
            <dx:ASPxGridView ID="Gv_StudentsReborts"  runat="server" 
                style="font-size:16px; width:99vw; margin-right:10px; margin-left:10px;">
                <Columns> 

                    <dx:GridViewDataTextColumn FieldName="Student_Name" Name="Name" 
                        Caption="اسم الطالب" VisibleIndex="1" Width="20%">
                        <CellStyle HorizontalAlign="Center" />
                        <HeaderStyle HorizontalAlign="Center" />
                    </dx:GridViewDataTextColumn>

                     <dx:GridViewDataTextColumn FieldName="RowName" Name="Row" 
                        Caption="الصف" VisibleIndex="2" Width="20%">
                         <CellStyle HorizontalAlign="Center" />
                         <HeaderStyle HorizontalAlign ="Center" />
                    </dx:GridViewDataTextColumn>

                    <dx:GridViewDataTextColumn FieldName="LevelName" Name="Level" 
                        Caption="المرحله" VisibleIndex="3" Width="20%">
                        <CellStyle HorizontalAlign="Center" />
                         <HeaderStyle HorizontalAlign ="Center" />
                    </dx:GridViewDataTextColumn>
             
                </Columns> 
            </dx:ASPxGridView>
            </div>
             </center>

    </form>
</body>
</html>
