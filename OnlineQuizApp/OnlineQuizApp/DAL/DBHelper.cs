using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

namespace OnlineQuizApp.DAL
{
    public class DBHelper
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["QuizDBConnection"].ConnectionString;

        public SqlConnection GetConnection()
        {
            SqlConnection con = new SqlConnection(connectionString);
            return con;
        }
    }
}