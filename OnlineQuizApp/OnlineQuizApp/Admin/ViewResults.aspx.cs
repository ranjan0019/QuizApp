using OnlineQuizApp.BAL;
using OnlineQuizApp.User;
using System;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineQuizApp.Admin
{
    public partial class ViewResults : System.Web.UI.Page
    {
        private ResultBAL resultBAL = new ResultBAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check Admin Login
            if (Session["UserId"] == null || Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/Admin/AdminLogin.aspx");
            }

            if (!IsPostBack)
            {
                LoadAllResults();
            }
        }

        private void LoadAllResults()
        {
            try
            {
                gvResults.DataSource = resultBAL.GetAllResults();
                gvResults.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading results: " + ex.Message;
            }
        }
    }
}