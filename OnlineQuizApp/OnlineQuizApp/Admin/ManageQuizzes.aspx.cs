using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineQuizApp.BAL;


namespace OnlineQuizApp.Admin
{
    public partial class ManageQuizzes : System.Web.UI.Page
    {
        private QuizBAL quizBAL = new QuizBAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/Admin/AdminLogin.aspx");
            }

            if (!IsPostBack)
            {
                LoadQuizzes();
            }
        }

        private void LoadQuizzes()
        {
            try
            {
                gvQuizzes.DataSource = quizBAL.GetAllQuizzes();
                gvQuizzes.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading quizzes: " + ex.Message;
            }
        }
    }
}