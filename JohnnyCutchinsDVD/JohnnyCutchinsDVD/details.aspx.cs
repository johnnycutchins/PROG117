using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JohnnyCutchinsDVD
{
    public partial class details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // UserID.Visible = false; // only show this after we create it
            DVDIDlabel.Text = Request.QueryString["id"];
            SqlConnection conn;
            SqlCommand comm;
            SqlDataReader reader;
            string connectionString = ConfigurationManager.ConnectionStrings["DVDconnstring"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("SELECT DVDtitle, DVDprice, DVDartist, DVDrating FROM DVDtable WHERE DVDID = @DVDID", conn);
            comm.Parameters.Add("@DVDID", System.Data.SqlDbType.Int);
            comm.Parameters["@DVDID"].Value = Convert.ToInt32(Request.QueryString["id"]); // get the passed DVDID
            try
            {
                conn.Open();
                reader = comm.ExecuteReader();
                if (reader.Read())
                {
                    TitleLabel.Text = reader["DVDtitle"].ToString();
                   // PriceLabel.Text = Convert.ToString(Math.Round(Convert.ToDecimal(reader["DVDprice"]), 2));
                    ArtistLabel.Text = reader["DVDartist"].ToString();
                    RatingLabel.Text = reader["DVDrating"].ToString();
                }
                reader.Close();
            }
            catch
            {
                dbErrorLabel.Text = "Error loading the DVD info";
            }
            finally
            {
                conn.Close();
            }

            DVDIDlabel.Text = Request.QueryString["id"];
            
            SqlCommand comm1;
            
            
            conn = new SqlConnection(connectionString);
            comm1 = new SqlCommand("SELECT Description, PicURL FROM Details WHERE DVDID = @DVDID", conn);
            comm1.Parameters.Add("@DVDID", System.Data.SqlDbType.Int);
            comm1.Parameters["@DVDID"].Value = Convert.ToInt32(Request.QueryString["id"]); // get the passed DVDID
            try
            {
                conn.Open();
                reader = comm1.ExecuteReader();
                if (reader.Read())
                {
                    DescriptionLabel.Text = reader["Description"].ToString();
                    // PriceLabel.Text = Convert.ToString(Math.Round(Convert.ToDecimal(reader["DVDprice"]), 2));
                    PictureLabel.ImageUrl = reader["PicURL"].ToString();

                }
                reader.Close();
            }
            catch
            {
                dbErrorLabel.Text = "Error loading the DVD info";
            }
            finally
            {
                conn.Close();
            }

        }

        protected void ButtonBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/default.aspx");
        }
    }
}