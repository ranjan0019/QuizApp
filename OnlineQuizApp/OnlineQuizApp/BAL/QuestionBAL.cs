using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OnlineQuizApp.DAL;
using OnlineQuizApp.Models;

namespace OnlineQuizApp.BAL
{
    public class QuestionBAL
    {
        private QuestionDAL questionDAL = new QuestionDAL();

        public int AddQuestion(QuestionModel question)
        {
            return questionDAL.AddQuestion(question);
        }

        public int AddQuestionOption(QuestionOptionModel option)
        {
            return questionDAL.AddQuestionOption(option);
        }

        public List<QuestionModel> GetQuestionsByQuizId(int quizId)
        {
            return questionDAL.GetQuestionsByQuizId(quizId);
        }

        public List<QuestionOptionModel> GetOptionsByQuestionId(int questionId)
        {
            return questionDAL.GetOptionsByQuestionId(questionId);
        }
    }
}