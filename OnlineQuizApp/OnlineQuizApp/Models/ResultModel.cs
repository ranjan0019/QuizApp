using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineQuizApp.Models
{
    public class ResultModel
    {
        public int ResultId { get; set; }
        public int UserId { get; set; }
        public int QuizId { get; set; }
        public string QuizTitle { get; set; }
        public int Score { get; set; }
        public int TotalMarks { get; set; }
        public DateTime AttemptDate { get; set; }
    }
}