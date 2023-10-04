using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Students.Pages
{
    public partial class Users_Pages : System.Web.UI.Page
    {
        Task1Entities db = new Task1Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Gv_User.DataBind();
                hf_IsEdit["hf_IsEdit"] = "0";
            }
        }

        protected void Gv_User_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int id = int.Parse(e.Keys[0].ToString());
            var usre = db.Users.SingleOrDefault(x => x.ID == id);
            if (usre != null)
            {
                db.Users.Remove(usre);
                db.SaveChanges();
                e.Cancel = true;
            }
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            string User_Name = txt_UserName.Text.Trim();
            string Password = txt_UserPassword.Text.Trim();
            var Active = Chk_Active.Checked;
            if (hf_IsEdit["hf_IsEdit"].ToString() != "0")
            {
                int userId = Convert.ToInt32(hf_IsEdit["hf_IsEdit"].ToString());
                var User = db.Users.FirstOrDefault(x => x.ID == userId);
                User.UserName = User_Name;
                User.Password = Password;
                User.is_active = Active;
                hf_IsEdit["hf_IsEdit"] = "0";
            }
            else
            {
                var NewUser = new User
                {
                    UserName = User_Name,
                    Password = Password,
                    is_active = Active
                };
                db.Users.Add(NewUser);
            }
            db.SaveChanges();
            Gv_User.DataBind();
        }

        protected void Gv_User_DataBinding(object sender, EventArgs e)
        {
            Gv_User.DataSource = db.Users.ToList();
        }


        protected void Gv_User_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "Edit")
            {
                int id = int.Parse(e.KeyValue.ToString());
                var User = db.Users.FirstOrDefault(x => x.ID == id);
                if (User != null)
                {
                    txt_UserName.Text = User.UserName;
                    txt_UserPassword.Text = User.Password;
                    Chk_Active.Checked = User.is_active == true ? true : false;
                    hf_IsEdit["hf_IsEdit"] = User.ID.ToString();
                }
            }
        }
    }
}