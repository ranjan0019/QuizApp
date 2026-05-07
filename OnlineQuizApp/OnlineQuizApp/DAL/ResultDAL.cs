using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OnlineQuizApp.Models;
using System.Data;
using System.Data.SqlClient;

namespace OnlineQuizApp.DAL
{
    public class ResultDAL
    {
        private DBHelper db = new DBHelper();

        public int SaveResult(ResultModel result)
        {
            using (SqlConnection con = db.GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand("sp_SaveResult", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserId", result.UserId);
                    cmd.Parameters.AddWithValue("@QuizId", result.QuizId);
                    cmd.Parameters.AddWithValue("@Score", result.Score);
                    cmd.Parameters.AddWithValue("@TotalMarks", result.TotalMarks);

                    con.Open();
                    object resultId = cmd.ExecuteScalar();

                    if (resultId != null)
                    {
                        return Convert.ToInt32(resultId);
                    }

                    return 0;
                }
            }
        }

        public List<ResultModel> GetResultsByUserId(int userId)
        {
            List<ResultModel> results = new List<ResultModel>();

            using (SqlConnection con = db.GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetResultsByUserId", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            results.Add(new ResultModel
                            {
                                ResultId = Convert.ToInt32(reader["ResultId"]),
                                UserId = Convert.ToInt32(reader["UserId"]),
                                QuizId = Convert.ToInt32(reader["QuizId"]),
                                QuizTitle = reader["QuizTitle"].ToString(),
                                Score = Convert.ToInt32(reader["Score"]),
                                TotalMarks = Convert.ToInt32(reader["TotalMarks"]),
                                AttemptDate = Convert.ToDateTime(reader["AttemptDate"])
                            });
                        }
                    }
                }
            }

            return results;
        }

        public DataTable GetAllResults()
        {
            DataTable dt = new DataTable();

            using (SqlConnection con = db.GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetAllResults", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }

            return dt;
        }

        public DataTable GetLeaderboard()
        {
            DataTable dt = new DataTable();

            using (SqlConnection con = db.GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetLeaderboard", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }

            return dt;
        }
    }
}