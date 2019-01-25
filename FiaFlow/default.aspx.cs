using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FiaFlow
{
    public partial class _default : System.Web.UI.Page
    {
        
        SqlConnection con = new SqlConnection("Data Source=Vaio;Initial Catalog=fiaflow;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string pw = TxtPassword.Text;
            string statement = $"SELECT [password] FROM [password] WHERE [PwID] = 1";
            SqlCommand cmd = new SqlCommand(statement, con);
            con.Open();
            string pwDB = (string)cmd.ExecuteScalar();
            con.Close();
            ComparePasswords(pw, pwDB);
        }

        private void ComparePasswords(string pw, string pwDB)
        {
            if (pw == pwDB)
            {
                WeiterleitungZuPosts();
            }
            else
            {
                LblAlert.Text = "Die Anmeldung ist fehlgeschlagen";
            }
        }
        private void WeiterleitungZuPosts()
        {
            string userID = DDLUser.SelectedValue;
            Session["Login"] = userID;
            TxtPassword.Text = String.Empty;
            Response.Redirect("posts.aspx");
        }
        
    }
}