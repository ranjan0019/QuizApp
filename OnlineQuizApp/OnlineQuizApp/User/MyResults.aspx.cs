using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineQuizApp.BAL;


namespace OnlineQuizApp.User
{
    public partial class MyResults : System.Web.UI.Page
    {
        private ResultBAL resultBAL = new ResultBAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || Session["Role"] == null || Session["Role"].ToString() != "Student")
            {
                Response.Redirect("~/User/UserLogin.aspx");
            }

            if (!IsPostBack)
            {
                LoadMyResults();
            }
        }

        private void LoadMyResults()
        {
            try
            {
                int userId = Convert.ToInt32(Session["UserId"]);
                gvMyResults.DataSource = resultBAL.GetResultsByUserId(userId);
                gvMyResults.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading results: " + ex.Message;
            }
        }
    }
}