using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Students.Pages
{
    public partial class StudentsReport : System.Web.UI.Page
    {
        Task1Entities db = new Task1Entities();

        protected void Page_Load(object sender, EventArgs e)
        {
            Gv_Students_DataBinding();
            FillControlls();

        }

        public void FillControlls()
        {
            Cmb_Level.DataSource = db.Levels.ToList();
            Cmb_Level.ValueField = "ID";
            Cmb_Level.TextField = "LevelName";
            Cmb_Level.DataBind();

            Cmb_Row1.DataSource = db.Rows.ToList();
            Cmb_Row1.ValueField = "ID";
            Cmb_Row1.TextField = "RowName";
            Cmb_Row1.DataBind();

            Cmb_Name.DataSource = db.Students.ToList();
            Cmb_Name.ValueField = "Student_ID";
            Cmb_Name.TextField = "Student_Name";
            Cmb_Name.DataBind();
        }
        public void Gv_Students_DataBinding()
        {
            Gv_StudentsReborts.DataSource = db.Students.Select(x => new StudentNewModel
            {
                Student_ID = x.Student_ID,
                LevelName = x.Level.LevelName ?? "",
                RowName = x.Row.RowName ?? "",
                Student_IDNumber = x.Student_IDNumber,
                Student_Name = x.Student_Name,
            }
            ).ToList();
            Gv_StudentsReborts.DataBind();
        }

        protected void btn_Search_Click(object sender, EventArgs e)
        {
            int? level = Convert.ToInt32(Cmb_Level.SelectedItem?.Value);
            int? Row = Convert.ToInt32(Cmb_Row1.SelectedItem?.Value);
            int? IdName = Convert.ToInt32(Cmb_Name.SelectedItem?.Value);
            string searchTerm = btn_Search.Text;
            string Name2 = txt_Name.Text;

            Gv_StudentsReborts.DataSource = db.Students.Where(x => (x.Student_ID == IdName || IdName == 0) && (x.RowIID == Row || Row == 0) && (x.LevelID == level || level == 0) && (Name2 ==""|| x.Student_Name.StartsWith(Name2)))
                .Select(x => new StudentNewModel
                {
                    Student_ID = x.Student_ID,
                    LevelName = x.Level.LevelName ?? "",
                    RowName = x.Row.RowName ?? "",
                    Student_IDNumber = x.Student_IDNumber,
                    Student_Name = x.Student_Name

                }).ToList();
            Gv_StudentsReborts.DataBind();
            Clear();
        }

        public void Clear()
        {
            Cmb_Name.SelectedItem = null;
            Cmb_Row1.SelectedItem = null;
            Cmb_Level.SelectedItem = null;
            txt_Name.Text = "";
        }
    }
}