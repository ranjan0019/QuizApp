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
    public partial class UserRegister : System.Web.UI.Page
    {
        UserBAL userBAL = new UserBAL();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                UserModel user = new UserModel();
                user.FullName = txtFullName.Text.Trim();
                user.Email = txtEmail.Text.Trim();
                user.Password = txtPassword.Text.Trim();
                user.Role = "Student";

                int result = userBAL.RegisterUser(user);

                if (result > 0)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Registration successful.";
                    txtFullName.Text = "";
                    txtEmail.Text = "";
                    txtPassword.Text = "";
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Registration failed.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;

                if (ex.Message.Contains("UNIQUE"))
                {
                    lblMessage.Text = "Email already exists. Please use another email.";
                }
                else
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }
    }
}