using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using OnlineQuizApp.Models;

namespace OnlineQuizApp.DAL
{
    public class QuestionDAL
    {
        private DBHelper db = new DBHelper();

        public int AddQuestion(QuestionModel question)
        {
            using (SqlConnection con = db.GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand("sp_AddQuestion", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@QuizId", question.QuizId);
                    cmd.Parameters.AddWithValue("@QuestionText", question.QuestionText);
                    cmd.Parameters.AddWithValue("@QuestionType", question.QuestionType);
                    cmd.Parameters.AddWithValue("@CorrectAnswer", question.CorrectAnswer);
                    cmd.Parameters.AddWithValue("@Marks", question.Marks);

                    con.Open();
                    object result = cmd.ExecuteScalar();

                    if (result != null)
                    {
                        return Convert.ToInt32(result);
                    }

                    return 0;
                }
            }
        }

        public int AddQuestionOption(QuestionOptionModel option)
        {
            using (SqlConnection con = db.GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand("sp_AddQuestionOption", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@QuestionId", option.QuestionId);
                    cmd.Parameters.AddWithValue("@OptionText", option.OptionText);

                    con.Open();
                    object result = cmd.ExecuteScalar();

                    if (result != null)
                    {
                        return Convert.ToInt32(result);
                    }

                    return 0;
                }
            }
        }

        public List<QuestionModel> GetQuestionsByQuizId(int quizId)
        {
            List<QuestionModel> questions = new List<QuestionModel>();

            using (SqlConnection con = db.GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetQuestionsByQuizId", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@QuizId", quizId);

                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            questions.Add(new QuestionModel
                            {
                                QuestionId = Convert.ToInt32(reader["QuestionId"]),
                                QuizId = Convert.ToInt32(reader["QuizId"]),
                                QuestionText = reader["QuestionText"].ToString(),
                                QuestionType = reader["QuestionType"].ToString(),
                                CorrectAnswer = reader["CorrectAnswer"].ToString(),
                                Marks = Convert.ToInt32(reader["Marks"])
                            });
                        }
                    }
                }
            }

            return questions;
        }

        public List<QuestionOptionModel> GetOptionsByQuestionId(int questionId)
        {
            List<QuestionOptionModel> options = new List<QuestionOptionModel>();

            using (SqlConnection con = db.GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetOptionsByQuestionId", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@QuestionId", questionId);

                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            options.Add(new QuestionOptionModel
                            {
                                OptionId = Convert.ToInt32(reader["OptionId"]),
                                QuestionId = Convert.ToInt32(reader["QuestionId"]),
                                OptionText = reader["OptionText"].ToString()
                            });
                        }
                    }
                }
            }

            return options;
        }
    }
}