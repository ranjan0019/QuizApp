using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineQuizApp.Models
{
    public class QuestionModel
    {
        public int QuestionId { get; set; }
        public int QuizId { get; set; }
        public string QuestionText { get; set; }
        public string QuestionType { get; set; }
        public string CorrectAnswer { get; set; }
        public int Marks { get; set; }
    }
}