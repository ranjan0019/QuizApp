using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineQuizApp.BAL;

namespace OnlineQuizApp.Admin
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        private UserBAL userBAL = new UserBAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/Admin/AdminLogin.aspx");
            }

            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        private void LoadUsers()
        {
            try
            {
                gvUsers.DataSource = userBAL.GetAllUsers();
                gvUsers.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error loading users: " + ex.Message;
            }
        }

        protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label lblRole = (Label)e.Row.FindControl("lblRole");

                if (lblRole != null)
                {
                    string role = lblRole.Text.Trim().ToLower();

                    if (role == "admin")
                    {
                        lblRole.CssClass = "badge-role-admin";
                    }
                    else
                    {
                        lblRole.CssClass = "badge-role-student";
                    }
                }
            }
        }
    }
}