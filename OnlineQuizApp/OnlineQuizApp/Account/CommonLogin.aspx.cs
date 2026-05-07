using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineQuizApp.BAL;
using OnlineQuizApp.Models;


namespace OnlineQuizApp.Account
{
    public partial class CommonLogin : System.Web.UI.Page
    {
        UserBAL userBAL = new UserBAL();

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string role = ddlRole.SelectedValue;
                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text.Trim();

                if (string.IsNullOrEmpty(role))
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Please select a role.";
                    return;
                }

                if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Please enter email and password.";
                    return;
                }

                UserModel user = userBAL.LoginUser(email, password);

                if (user != null)
                {
                    if (user.Role.Equals(role, StringComparison.OrdinalIgnoreCase))
                    {
                        Session["UserId"] = user.UserId;
                        Session["FullName"] = user.FullName;
                        Session["Email"] = user.Email;
                        Session["Role"] = user.Role;

                        if (user.Role.Equals("Admin", StringComparison.OrdinalIgnoreCase))
                        {
                            Response.Redirect("~/Admin/AdminDashboard.aspx");
                        }
                        else if (user.Role.Equals("Student", StringComparison.OrdinalIgnoreCase))
                        {
                            Response.Redirect("~/User/UserDashboard.aspx");
                        }
                    }
                    else
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Selected role does not match your account.";
                    }
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Invalid email or password.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}