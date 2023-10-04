using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Windows;
namespace Students.Pages
{
    public partial class Students : System.Web.UI.Page
    {

        Task1Entities db = new Task1Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Gv_Students.DataBind();
                FillControlls();
                Hf_IsEdit["Hf_IsEdit"] = "0";
            }
        }
        public void FillControlls()
        {
            Cmb_Level1.DataSource = db.Levels.ToList();
            Cmb_Level1.ValueField = "ID";
            Cmb_Level1.TextField = "LevelName";
            Cmb_Level1.DataBind();

            Cmb_Row1.DataSource = db.Rows.ToList();
            Cmb_Row1.ValueField = "ID";
            Cmb_Row1.TextField = "RowName";
            Cmb_Row1.DataBind();
        }
        protected void Gv_Students_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int id = Convert.ToInt32(e.Keys[0].ToString());
            var student = db.Students.FirstOrDefault(x => x.Student_ID == id);
            if (student != null)
            {
                db.Students.Remove(student);
                db.SaveChanges();
                e.Cancel = true;
                Gv_Students.DataBind();
            }
        }
        protected void btn_Save_Click(object sender, EventArgs e)
        {
            string Student_Name = tXt_Name.Text.Trim();
            string Student_IDNumber = tXt_NationalID.Text.Trim();
            int? Level = Convert.ToInt32(Cmb_Level1.SelectedItem?.Value);
            int? Row = Convert.ToInt32(Cmb_Row1.SelectedItem?.Value);
            Lbl_Messagebox.ForeColor = System.Drawing.Color.Red;

            if (string.IsNullOrEmpty(Student_Name))
            {
                Lbl_Messagebox.Text = "لم يتم إدخال اسم الطالب ";
                Clear();
                return;
            }

            if (string.IsNullOrEmpty(Student_IDNumber))
            {
                Lbl_Messagebox.Text = "لم يتم إدخال الرقم القومي";
                Clear();
                return;
            }

            if (Level == 0 )
            {
                Lbl_Messagebox.Text = "لم يتم إدخال اسم المرحلة";
                Clear();
                return;
            }

            if (Row == 0)
            {
                Lbl_Messagebox.Text = "لم يتم إدخال اسم الصف";
                Clear();
                return;
            }

            if (Hf_IsEdit["Hf_IsEdit"].ToString() != "0")
            {
                int studentid = Convert.ToInt32(Hf_IsEdit["Hf_IsEdit"].ToString());
                var student = db.Students.FirstOrDefault(x => x.Student_ID == studentid);

                student.Student_Name = Student_Name;
                student.RowIID = Row;
                student.LevelID = Level;

                // Check if Student_IDNumber is being changed to a value that already exists
                if (student.Student_ID != studentid && db.Students.Any(x => x.Student_IDNumber == Student_IDNumber))
                {
                    Lbl_Messagebox.Text = "الرقم القومي مكرر، يرجى إدخال رقم قومي آخر";
                    Clear();
                    return;
                }

                student.Student_IDNumber = Student_IDNumber;
                Hf_IsEdit["Hf_IsEdit"] = "0";
            }
            else
            {
                if (db.Students.Any(x => x.Student_IDNumber == Student_IDNumber))
                {
                    Lbl_Messagebox.Text = "الرقم القومي مكرر، يرجى إدخال رقم قومي آخر";
                    Clear();
                    return;
                }

                var Newstudent = new Student
                {
                    Student_Name = Student_Name,
                    Student_IDNumber = Student_IDNumber,
                    RowIID = Row,
                    LevelID = Level
                };
                db.Students.Add(Newstudent);
                Lbl_Messagebox.Text = "تم الحفظ بنجاح";
                Lbl_Messagebox.ForeColor = System.Drawing.Color.Green;
            }
            db.SaveChanges();
            Gv_Students.DataBind();
            Clear();
        }
        protected void Gv_Students_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "Edit")
            {
                int id = int.Parse(e.KeyValue.ToString());
                var student = db.Students.FirstOrDefault(x => x.Student_ID == id);
                if (student != null)
                {
                    tXt_Name.Text = student.Student_Name;
                    tXt_NationalID.Text = student.Student_IDNumber;
                    Cmb_Level1.Value = student.LevelID.ToString();
                    Cmb_Row1.Value = student.RowIID.ToString();
                    Hf_IsEdit["Hf_IsEdit"] = student.Student_ID.ToString();
                }
            }
        }
        protected void Gv_Students_DataBinding(object sender, EventArgs e)
        {
            Gv_Students.DataSource = db.Students.Include(x => x.Row).Include(x => x.Level).Select(x => new StudentNewModel
            {
                Student_ID = x.Student_ID,
                LevelName = x.Level.LevelName ?? "",
                RowName = x.Row.RowName ?? "",
                Student_IDNumber = x.Student_IDNumber,
                Student_Name = x.Student_Name
            }).ToList();
        }
        public void Clear()
        {
            Cmb_Level1.SelectedItem = null;
            Cmb_Row1.SelectedItem = null;
            tXt_NationalID.Text = null;
            tXt_Name.Text = "";
        }
    }
}