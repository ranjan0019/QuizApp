using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineQuizApp.Models
{
    public class QuestionOptionModel
    {
        public int OptionId { get; set; }
        public int QuestionId { get; set; }
        public string OptionText { get; set; }
    }
}