using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineQuizApp.BAL;
using OnlineQuizApp.Models;

namespace OnlineQuizApp.Admin
{
    public partial class CreateQuiz : System.Web.UI.Page
    {
        QuizBAL quizBAL = new QuizBAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("~/Admin/AdminLogin.aspx");
            }
        }

        protected void btnCreateQuiz_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtTitle.Text))
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Please enter quiz title.";
                    return;
                }

                QuizModel quiz = new QuizModel();
                quiz.Title = txtTitle.Text.Trim();
                quiz.Description = txtDescription.Text.Trim();
                quiz.CreatedBy = Convert.ToInt32(Session["UserId"]);

                int quizId = quizBAL.AddQuiz(quiz);

                if (quizId > 0)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Quiz created successfully. Quiz ID: " + quizId;

                    txtTitle.Text = "";
                    txtDescription.Text = "";
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Quiz creation failed.";
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