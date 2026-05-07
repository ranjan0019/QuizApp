using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineQuizApp.Models
{
    public class QuizModel
    {
        public int QuizId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public int TotalQuestions { get; set; }
        public int TotalMarks { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}