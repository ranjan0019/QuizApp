using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineQuizApp.BAL;

namespace OnlineQuizApp.User
{
    public partial class ViewResults : System.Web.UI.Page
    {
        ResultBAL resultBAL = new ResultBAL();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null || Session["Role"] == null || Session["Role"].ToString() != "Student")
            {
                Response.Redirect("~/User/UserLogin.aspx");
            }

            if (!IsPostBack)
            {
                LoadResults();
            }
        }

        private void LoadResults()
        {
            try
            {
                int userId = Convert.ToInt32(Session["UserId"]);
                gvResults.DataSource = resultBAL.GetResultsByUserId(userId);
                gvResults.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}