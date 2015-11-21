using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JohnnyCutchinsDVD.Admin
{
    public partial class EditDVE : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDVDlist();
            }
        }

        private void LoadDVDlist()
        {
            SqlConnection conn;
            SqlCommand comm;
            SqlDataReader reader;
            string connectionString = ConfigurationManager.ConnectionStrings["DVDconnstring"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("SELECT DVDID, DVDtitle FROM DVDtable", conn);
            try
            {
                conn.Open();
                reader = comm.ExecuteReader();
                DVDlist.DataSource = reader;
                DVDlist.DataValueField = "DVDID"; //  binding to use the ID

                DVDlist.DataTextField = "DVDtitle"; // part that shows

                DVDlist.DataBind();
                reader.Close();
            }
            catch
            {
                dbErrorLabel.Text = "Error Loading The List Of DVD's <br />";
            }
            finally
            {
                conn.Close();
            }
            SelectDVD.Enabled = true;
            editDVD.Enabled = false;
            DeleteDVD.Enabled = false;


            movieTitle.Text = "";
            movieArtist.Text = "";
            movieRating.Text = "";
            moviePrice.Text = "";
            
        }





        

        protected void editDVD_Click(object sender, EventArgs e)
        {
            SqlConnection conn;
            SqlCommand comm;
            SqlCommand comm1;
            string connectionString = ConfigurationManager.ConnectionStrings["DVDconnstring"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("UPDATE DVDtable SET DVDtitle =@DVDtitle, DVDartist =@DVDartist, " +
                  " DVDrating = @DVDrating, DVDprice = @DVDprice " +
                  " WHERE DVDID = @DVDID", conn);
            comm1 = new SqlCommand("UPDATE Details SET Description =@Description, PicURL = @PicURL " +
                  " WHERE DVDID =@DVDID", conn);


            comm.Parameters.Add("@DVDtitle", System.Data.SqlDbType.NVarChar, 50);
            comm.Parameters["@DVDtitle"].Value = movieTitle.Text;
            comm.Parameters.Add("@DVDartist", System.Data.SqlDbType.NVarChar, 50);
            comm.Parameters["@DVDartist"].Value = movieArtist.Text;
            comm.Parameters.Add("@DVDrating", System.Data.SqlDbType.Int);
            comm.Parameters["@DVDrating"].Value = movieRating.Text;
            comm.Parameters.Add("@DVDprice", System.Data.SqlDbType.Money);
            comm.Parameters["@DVDprice"].Value = moviePrice.Text;

            comm1.Parameters.Add("@Description", System.Data.SqlDbType.NVarChar, 500);
            comm1.Parameters["@Description"].Value = description.Text;
            comm1.Parameters.Add("@PicURL", System.Data.SqlDbType.NVarChar, 100);
            comm1.Parameters["@PicURL"].Value = picURL.Text;


            comm.Parameters.Add("@DVDID", System.Data.SqlDbType.Int);
            comm.Parameters["@DVDID"].Value = DVDlist.SelectedItem.Value;
            try
            {
                conn.Open();
                comm.ExecuteNonQuery();  // Doesn't return any data
                comm1.ExecuteNonQuery();
            }
            catch
            {   dbErrorLabel.Visible = true;
                dbErrorLabel.Text = "Error Updating The DVD Details <br/>";
            }
            finally
            {
                conn.Close();
                movieTitle.Text = "";
                movieArtist.Text = "";
                movieRating.Text = "";
                moviePrice.Text = "";
                description.Text = "";
                picURL.Text = "";
            }

            LoadDVDlist();
            dbErrorLabel.Visible = true;
            dbErrorLabel.Text = "Edits Complete";         
            editDVD.Enabled = false;
            DeleteDVD.Enabled = false;
        }

        protected void DeleteDVD_Click(object sender, EventArgs e)
        {
            SqlConnection conn;
            SqlCommand comm;
            SqlCommand comm1;

            string connectionString = ConfigurationManager.ConnectionStrings["DVDconnstring"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("DELETE FROM DVDtable WHERE DVDID = @DVDID", conn);
            comm1 = new SqlCommand("DELETE FROM Details WHERE  DVDID =@DVDID", conn);
            


            comm.Parameters.Add("@DVDID", System.Data.SqlDbType.Int);
            comm.Parameters["@DVDID"].Value = DVDlist.SelectedItem.Value;

            comm1.Parameters.Add("@DVDID", System.Data.SqlDbType.Int);
            comm1.Parameters["@DVDID"].Value = DVDlist.SelectedItem.Value;


            try
            {
                conn.Open();
                comm.ExecuteNonQuery();
                comm1.ExecuteNonQuery();
            }
            catch
            {
                dbErrorLabel.Visible = true;
                dbErrorLabel.Text = "Error Deleting DVD <br />";
            }
            finally
            {
                conn.Close();
                movieTitle.Text = "";
                movieArtist.Text = "";
                movieRating.Text = "";
                moviePrice.Text = "";
                description.Text = "";
                picURL.Text = "";
            }
            LoadDVDlist();
            dbErrorLabel.Visible = true;
            dbErrorLabel.Text = "The DVD has been Deleted";
            DeleteDVD.Enabled = false;
        }

        protected void SelectDVD_Click(object sender, EventArgs e)
        {
            dbErrorLabel.Visible = false;
            SqlConnection conn;
            SqlCommand comm;
            SqlCommand comm1;
            SqlDataReader reader;
            string connectionString = ConfigurationManager.ConnectionStrings["DVDconnstring"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("SELECT DVDtitle, DVDartist, DVDrating, DVDprice FROM DVDtable " +
                    " WHERE DVDID = @DVDID", conn);    // make a variable @DVDID
            comm1 = new SqlCommand("SELECT Description, PicURL FROM Details " +
                    " WHERE DVDID = @DVDID", conn);


            comm.Parameters.Add("@DVDID", System.Data.SqlDbType.Int);   //  Variable type is INT
            comm.Parameters["@DVDID"].Value = DVDlist.SelectedItem.Value;  // Where it comes from

            comm1.Parameters.Add("@DVDID", System.Data.SqlDbType.Int);   
            comm1.Parameters["@DVDID"].Value = DVDlist.SelectedItem.Value;


            try
            {
                conn.Open();
                reader = comm.ExecuteReader();
                if (reader.Read())
                {
                    movieTitle.Text = reader["DVDtitle"].ToString();
                    movieArtist.Text = reader["DVDartist"].ToString();
                    movieRating.Text = reader["DVDrating"].ToString();
                    moviePrice.Text = reader["DVDprice"].ToString();

                }
                reader.Close();

                reader = comm1.ExecuteReader();
                if (reader.Read())
                {
                    description.Text = reader["Description"].ToString();
                    picURL.Text = reader["PicURL"].ToString();
                }
                reader.Close();

                SelectDVD.Enabled = true;


            }
            catch
            {
                
                dbErrorLabel.Text = "Error Loading The DVD Details <br />";
            }
            finally
            {
                conn.Close();
                editDVD.Enabled = true;
                DeleteDVD.Enabled = true;
            }

            

        }

        protected void ButtonLogoff_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/default.aspx");
        }
    }
}