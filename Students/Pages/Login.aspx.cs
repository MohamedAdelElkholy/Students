using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using Students;

namespace ProjectDevExpress.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        Task1Entities db = new Task1Entities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {

            string username = txt_UserName.Text;
            string password = txt_Password.Text; 
            var UsersList = db.Users.ToList();
            if (UsersList.FirstOrDefault(x => x.UserName == txt_UserName.Text && x.Password == txt_Password.Text) != null)
            {
                Response.Redirect("~/pages/MasterPage.aspx");
            }
            else
            {
                LbL_outputMassage.Text = "اسم المستخدم أو كلمة المرور غير صحيحة";
                LbL_outputMassage.ForeColor=System.Drawing.Color.Red;
            }

        }

    }

}
