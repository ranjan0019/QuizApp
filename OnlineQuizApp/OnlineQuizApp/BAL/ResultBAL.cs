using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OnlineQuizApp.DAL;
using OnlineQuizApp.Models;
using System.Data;

namespace OnlineQuizApp.BAL
{
    public class ResultBAL
    {
        private ResultDAL resultDAL = new ResultDAL();

        public int SaveResult(ResultModel result)
        {
            return resultDAL.SaveResult(result);
        }

        public List<ResultModel> GetResultsByUserId(int userId)
        {
            return resultDAL.GetResultsByUserId(userId);
        }

        public DataTable GetAllResults()
        {
            return resultDAL.GetAllResults();
        }

        public DataTable GetLeaderboard()
        {
            return resultDAL.GetLeaderboard();
        }
    }
}