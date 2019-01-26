using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FiaFlow
{
    public partial class posts : System.Web.UI.Page
    {

        //https://github.com/Dani1234567890123
        string userID;
        SqlConnection con = new SqlConnection("Data Source=Vaio;Initial Catalog=fiaflow;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PnlNew.Visible = false;
            }
            if (Session["Login"] == null)
            {
                Response.Redirect("default.aspx");
            }
            else
            {
                userID = (string)Session["Login"];
                
            }
        }
        protected void BtnNeu_Click(object sender, ImageClickEventArgs e)
        {
            PnlNew.Visible = true;
        }
        

        protected void BtnSenden_Click(object sender, EventArgs e)
        {
            int id;
            int ok = 0;
            Int32.TryParse(userID, out id);
            if (TxtNew.Text == String.Empty)
            {
                LblAlert.Text = "Bitte gib 'nen Text ein...";
            }
            else
            {
                string text = TxtNew.Text;
                string statement = $"INSERT INTO [Post] ([Text], [Date], [User]) VALUES (@text, @date, @user)";
                SqlCommand cmd = new SqlCommand(statement, con);
                cmd.Parameters.AddWithValue("@user", id);
                cmd.Parameters.AddWithValue("@date", DateTime.Now);
                cmd.Parameters.AddWithValue("@text", text);
                try
                {
                    con.Open();
                    ok = cmd.ExecuteNonQuery();
                    con.Close();
                }
                catch (Exception)
                {
                    LblAlert.Text = "Klappt nicht";
                }

                if (ok > 0)
                {
                    Response.Redirect("posts.aspx");
                    DL.DataBind();
                }
                else
                {
                    LblAlert.Text = "Senden fehlgeschlagen";
                }
            }
        }

       
        protected void BtnLogout_Click1(object sender, ImageClickEventArgs e)
        {
            Session["Login"] = null;
            Response.Redirect("default.aspx");
        }
    }
}