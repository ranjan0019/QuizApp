using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OnlineQuizApp.Models;
using System.Data;
using System.Data.SqlClient;

namespace OnlineQuizApp.DAL
{
    public class QuizDAL
    {
        private DBHelper db = new DBHelper();

        public int AddQuiz(QuizModel quiz)
        {
            using (SqlConnection con = db.GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand("sp_AddQuiz", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Title", quiz.Title);
                    cmd.Parameters.AddWithValue("@Description", quiz.Description);
                    cmd.Parameters.AddWithValue("@CreatedBy", quiz.CreatedBy);

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

        public List<QuizModel> GetAllQuizzes()
        {
            List<QuizModel> quizzes = new List<QuizModel>();

            using (SqlConnection con = db.GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetAllQuizzes", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            quizzes.Add(new QuizModel
                            {
                                QuizId = Convert.ToInt32(reader["QuizId"]),
                                Title = reader["Title"].ToString(),
                                Description = reader["Description"].ToString(),
                                TotalQuestions = Convert.ToInt32(reader["TotalQuestions"]),
                                TotalMarks = Convert.ToInt32(reader["TotalMarks"]),
                                CreatedBy = Convert.ToInt32(reader["CreatedBy"]),
                                CreatedDate = Convert.ToDateTime(reader["CreatedDate"])
                            });
                        }
                    }
                }
            }

            return quizzes;
        }
    }
}