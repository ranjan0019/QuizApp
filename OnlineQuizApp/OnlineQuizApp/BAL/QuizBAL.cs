using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OnlineQuizApp.DAL;
using OnlineQuizApp.Models;

namespace OnlineQuizApp.BAL
{
    public class QuizBAL
    {
        private QuizDAL quizDAL = new QuizDAL();

        public int AddQuiz(QuizModel quiz)
        {
            return quizDAL.AddQuiz(quiz);
        }

        public List<QuizModel> GetAllQuizzes()
        {
            return quizDAL.GetAllQuizzes();
        }
    }
}