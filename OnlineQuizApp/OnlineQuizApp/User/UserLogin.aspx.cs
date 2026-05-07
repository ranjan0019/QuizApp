using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineQuizApp.BAL;
using OnlineQuizApp.Models;


namespace OnlineQuizApp.User
{
    public partial class UserLogin : System.Web.UI.Page
    {
        UserBAL userBAL = new UserBAL();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            UserModel user = userBAL.LoginUser(email, password);

            if (user != null && user.Role == "Student")
            {
                Session["UserId"] = user.UserId;
                Session["FullName"] = user.FullName;
                Session["Role"] = user.Role;

                Response.Redirect("~/User/UserDashboard.aspx");
            }
            else
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Invalid user email or password.";
            }
        }
    }
}