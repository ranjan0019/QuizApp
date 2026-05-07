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
    public partial class TakeQuiz : System.Web.UI.Page
    {
        private QuestionBAL questionBAL = new QuestionBAL();
        private ResultBAL resultBAL = new ResultBAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || Session["Role"] == null || Session["Role"].ToString() != "Student")
            {
                Response.Redirect("~/User/UserLogin.aspx");
            }

            if (!IsPostBack)
            {
                if (Request.QueryString["QuizId"] != null)
                {
                    int quizId = Convert.ToInt32(Request.QueryString["QuizId"]);
                    LoadQuestions(quizId);
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Invalid Quiz ID.";
                    btnSubmitQuiz.Enabled = false;
                }
            }
        }

        private void LoadQuestions(int quizId)
        {
            try
            {
                List<QuestionModel> questions = questionBAL.GetQuestionsByQuizId(quizId);

                if (questions != null && questions.Count > 0)
                {
                    rptQuestions.DataSource = questions;
                    rptQuestions.DataBind();
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "No questions found for this quiz.";
                    btnSubmitQuiz.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error loading questions: " + ex.Message;
                btnSubmitQuiz.Enabled = false;
            }
        }

        protected void rptQuestions_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                QuestionModel question = (QuestionModel)e.Item.DataItem;

                RadioButtonList rblOptions = (RadioButtonList)e.Item.FindControl("rblOptions");

                List<QuestionOptionModel> options = questionBAL.GetOptionsByQuestionId(question.QuestionId);

                rblOptions.DataSource = options;
                rblOptions.DataTextField = "OptionText";
                rblOptions.DataValueField = "OptionText";
                rblOptions.DataBind();
            }
        }

        protected void btnSubmitQuiz_Click(object sender, EventArgs e)
        {
            int totalScore = 0;
            int totalMarks = 0;

            try
            {
                foreach (RepeaterItem item in rptQuestions.Items)
                {
                    HiddenField hfCorrectAnswer = (HiddenField)item.FindControl("hfCorrectAnswer");
                    HiddenField hfMarks = (HiddenField)item.FindControl("hfMarks");
                    RadioButtonList rblOptions = (RadioButtonList)item.FindControl("rblOptions");

                    string correctAnswer = hfCorrectAnswer.Value.Trim();
                    int marks = Convert.ToInt32(hfMarks.Value);

                    totalMarks += marks;

                    if (rblOptions.SelectedItem != null)
                    {
                        string selectedAnswer = rblOptions.SelectedValue.Trim();

                        if (selectedAnswer.Equals(correctAnswer, StringComparison.OrdinalIgnoreCase))
                        {
                            totalScore += marks;
                        }
                    }
                }

                if (Request.QueryString["QuizId"] != null)
                {
                    ResultModel result = new ResultModel
                    {
                        UserId = Convert.ToInt32(Session["UserId"]),
                        QuizId = Convert.ToInt32(Request.QueryString["QuizId"]),
                        Score = totalScore,
                        TotalMarks = totalMarks
                    };

                    int resultId = resultBAL.SaveResult(result);

                    if (resultId <= 0)
                    {
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                        lblMessage.Text = "Quiz submitted, but result could not be saved.";
                        btnSubmitQuiz.Enabled = false;
                        return;
                    }
                }

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Quiz submitted successfully! Your Score: " + totalScore + " / " + totalMarks;

                btnSubmitQuiz.Enabled = false;
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error submitting quiz: " + ex.Message;
            }
        }
    }
}