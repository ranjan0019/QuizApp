using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OnlineQuizApp.Models;
using System.Data;
using System.Data.SqlClient;

namespace OnlineQuizApp.DAL
{
    public class UserDAL
    {
        private DBHelper db = new DBHelper();

        public int RegisterUser(UserModel user)
        {
            using (SqlConnection con = db.GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand("sp_RegisterUser", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@FullName", user.FullName);
                    cmd.Parameters.AddWithValue("@Email", user.Email);
                    cmd.Parameters.AddWithValue("@Password", user.Password);
                    cmd.Parameters.AddWithValue("@Role", user.Role);

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

        public UserModel LoginUser(string email, string password)
        {
            using (SqlConnection con = db.GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand("sp_LoginUser", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);

                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            return new UserModel
                            {
                                UserId = Convert.ToInt32(reader["UserId"]),
                                FullName = reader["FullName"].ToString(),
                                Email = reader["Email"].ToString(),
                                Role = reader["Role"].ToString()
                            };
                        }
                    }
                }
            }

            return null;
        }

        public List<UserModel> GetAllUsers()
        {
            List<UserModel> users = new List<UserModel>();

            using (SqlConnection con = db.GetConnection())
            {
                using (SqlCommand cmd = new SqlCommand("sp_GetAllUsers", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            users.Add(new UserModel
                            {
                                UserId = Convert.ToInt32(reader["UserId"]),
                                FullName = reader["FullName"].ToString(),
                                Email = reader["Email"].ToString(),
                                Role = reader["Role"].ToString(),
                                CreatedDate = Convert.ToDateTime(reader["CreatedDate"])
                            });
                        }
                    }
                }
            }

            return users;
        }
    }
}