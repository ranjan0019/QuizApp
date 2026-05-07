using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OnlineQuizApp.DAL;
using OnlineQuizApp.Models;

namespace OnlineQuizApp.BAL
{
    public class UserBAL
    {
        private UserDAL userDAL = new UserDAL();

        public int RegisterUser(UserModel user)
        {
            return userDAL.RegisterUser(user);
        }

        public UserModel LoginUser(string email, string password)
        {
            return userDAL.LoginUser(email, password);
        }

        public List<UserModel> GetAllUsers()
        {
            return userDAL.GetAllUsers();
        }
    }
}