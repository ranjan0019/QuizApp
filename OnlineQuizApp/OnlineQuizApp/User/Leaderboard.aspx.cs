using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineQuizApp.BAL;

namespace OnlineQuizApp.User
{
    public partial class Leaderboard : System.Web.UI.Page
    {
        private ResultBAL resultBAL = new ResultBAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || Session["Role"] == null || Session["Role"].ToString() != "Student")
            {
                Response.Redirect("~/User/UserLogin.aspx");
            }

            if (!IsPostBack)
            {
                LoadLeaderboard();
            }
        }

        private void LoadLeaderboard()
        {
            try
            {
                gvLeaderboard.DataSource = resultBAL.GetLeaderboard();
                gvLeaderboard.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading leaderboard: " + ex.Message;
            }
        }
    }
}