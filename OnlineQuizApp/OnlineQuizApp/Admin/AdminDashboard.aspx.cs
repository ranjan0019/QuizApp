using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineQuizApp.Admin
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the logged-in user is Admin
            if (Session["UserId"] == null || Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/Admin/AdminLogin.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            // Clear session and logout
            Session.Clear();
            Session.Abandon();

            // Redirect to Home page
            Response.Redirect("~/Default.aspx");
        }
    }
}