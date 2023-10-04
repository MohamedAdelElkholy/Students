using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Students
{
    public partial class MasterPage : System.Web.UI.Page
    {
        Task1Entities db = new Task1Entities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               Lbl_Students.Text = db.Students.Count().ToString();
               Lbl_Users.Text = db.Users.Count().ToString();
            }
        }
    }
}