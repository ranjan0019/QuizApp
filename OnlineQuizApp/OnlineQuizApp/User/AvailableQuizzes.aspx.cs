using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineQuizApp.BAL;


namespace OnlineQuizApp.User
{
    public partial class AvailableQuizzes : System.Web.UI.Page
    {
        private QuizBAL quizBAL = new QuizBAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || Session["Role"] == null || Session["Role"].ToString() != "Student")
            {
                Response.Redirect("~/User/UserLogin.aspx");
            }

            if (!IsPostBack)
            {
                LoadAvailableQuizzes();
            }
        }

        private void LoadAvailableQuizzes()
        {
            try
            {
                gvAvailableQuizzes.DataSource = quizBAL.GetAllQuizzes();
                gvAvailableQuizzes.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading quizzes: " + ex.Message;
            }
        }

        protected void gvAvailableQuizzes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "StartQuiz")
            {
                int quizId = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("~/User/TakeQuiz.aspx?QuizId=" + quizId);
            }
        }
    }
}