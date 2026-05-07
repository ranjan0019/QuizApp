using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineQuizApp.BAL;
using OnlineQuizApp.Models;

namespace OnlineQuizApp.Admin
{
    public partial class AddQuestion : System.Web.UI.Page
    {
        private QuestionBAL questionBAL = new QuestionBAL();
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
                List<QuizModel> quizzes = quizBAL.GetAllQuizzes();

                ddlQuiz.DataSource = quizzes;
                ddlQuiz.DataTextField = "Title";
                ddlQuiz.DataValueField = "QuizId";
                ddlQuiz.DataBind();

                ddlQuiz.Items.Insert(0, new ListItem("-- Select Quiz --", "0"));
            }
            catch (Exception ex)
            {
                lblMessage.ForeColor = System.Drawing.Color.Red;
                lblMessage.Text = "Error loading quizzes: " + ex.Message;
            }
        }

        protected void btnAddQuestion_Click(object sender, EventArgs e)
        {
            try
            {
                // Validate quiz selection
                if (ddlQuiz.SelectedValue == "0")
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Please select a quiz.";
                    return;
                }

                // Validate empty fields
                if (string.IsNullOrWhiteSpace(txtQuestionText.Text) ||
                    string.IsNullOrWhiteSpace(txtOptionA.Text) ||
                    string.IsNullOrWhiteSpace(txtOptionB.Text) ||
                    string.IsNullOrWhiteSpace(txtOptionC.Text) ||
                    string.IsNullOrWhiteSpace(txtOptionD.Text) ||
                    string.IsNullOrWhiteSpace(txtCorrectAnswer.Text) ||
                    string.IsNullOrWhiteSpace(txtMarks.Text))
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Please fill all fields.";
                    return;
                }

                // Validate question text length (max 300 chars)
                if (txtQuestionText.Text.Trim().Length > 300)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Question Text cannot exceed 300 characters.";
                    return;
                }

                // Trim all values
                string questionText = txtQuestionText.Text.Trim();
                string optionA = txtOptionA.Text.Trim();
                string optionB = txtOptionB.Text.Trim();
                string optionC = txtOptionC.Text.Trim();
                string optionD = txtOptionD.Text.Trim();
                string correctAnswer = txtCorrectAnswer.Text.Trim();

                // Validate marks
                int marks;
                if (!int.TryParse(txtMarks.Text.Trim(), out marks) || marks <= 0)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Please enter valid marks greater than 0.";
                    return;
                }

                // Validate correct answer must match one of the options
                bool isCorrectAnswerValid =
                    correctAnswer.Equals(optionA, StringComparison.OrdinalIgnoreCase) ||
                    correctAnswer.Equals(optionB, StringComparison.OrdinalIgnoreCase) ||
                    correctAnswer.Equals(optionC, StringComparison.OrdinalIgnoreCase) ||
                    correctAnswer.Equals(optionD, StringComparison.OrdinalIgnoreCase);

                if (!isCorrectAnswerValid)
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Correct Answer must exactly match one of Option A, B, C, or D.";
                    return;
                }

                // Create question object
                QuestionModel question = new QuestionModel
                {
                    QuizId = Convert.ToInt32(ddlQuiz.SelectedValue),
                    QuestionText = questionText,
                    QuestionType = ddlQuestionType.SelectedValue,
                    CorrectAnswer = correctAnswer,
                    Marks = marks
                };

                // Insert question
                int questionId = questionBAL.AddQuestion(question);

                if (questionId > 0)
                {
                    // Insert 4 options
                    questionBAL.AddQuestionOption(new QuestionOptionModel
                    {
                        QuestionId = questionId,
                        OptionText = optionA
                    });

                    questionBAL.AddQuestionOption(new QuestionOptionModel
                    {
                        QuestionId = questionId,
                        OptionText = optionB
                    });

                    questionBAL.AddQuestionOption(new QuestionOptionModel
                    {
                        QuestionId = questionId,
                        OptionText = optionC
                    });

                    questionBAL.AddQuestionOption(new QuestionOptionModel
                    {
                        QuestionId = questionId,
                        OptionText = optionD
                    });

                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    lblMessage.Text = "Question and 4 options added successfully. Question ID: " + questionId;

                    // Clear form
                    ddlQuiz.SelectedIndex = 0;
                    txtQuestionText.Text = "";
                    txtOptionA.Text = "";
                    txtOptionB.Text = "";
                    txtOptionC.Text = "";
                    txtOptionD.Text = "";
                    txtCorrectAnswer.Text = "";
                    txtMarks.Text = "";
                    ddlQuestionType.SelectedIndex = 0;
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "Failed to add question.";
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