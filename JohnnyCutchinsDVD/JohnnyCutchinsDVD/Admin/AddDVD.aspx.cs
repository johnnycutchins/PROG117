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
    public partial class AddDVD : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            ButtonAddAnother.Visible = false;
        }



        protected void addMovie_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                long insertedId = 0;
                SqlConnection conn;
                SqlCommand comm;
                SqlCommand comm1;

                string connectionString = ConfigurationManager.ConnectionStrings["DVDconnstring"].ConnectionString;
                conn = new SqlConnection(connectionString);

                comm = new SqlCommand("INSERT into DVDtable(DVDtitle, DVDartist, DVDrating, DVDprice) VALUES(@DVDtitle, " +
                    " @DVDartist, @DVDrating, @DVDprice) SELECT SCOPE_IDENTITY()", conn);
                
                comm.Parameters.Add("@DVDtitle", System.Data.SqlDbType.NVarChar, 50);
                comm.Parameters["@DVDtitle"].Value = title.Text;
                comm.Parameters.Add("@DVDartist", System.Data.SqlDbType.NVarChar, 50);
                comm.Parameters["@DVDartist"].Value = artist.Text;
                comm.Parameters.Add("@DVDrating", System.Data.SqlDbType.Int);
                comm.Parameters["@DVDrating"].Value = rating.Text;
                comm.Parameters.Add("@DVDprice", System.Data.SqlDbType.Money);
                comm.Parameters["@DVDprice"].Value = price.Text;

                try
                {
                    conn.Open();
                    insertedId = Convert.ToInt64(comm.ExecuteScalar()); // new db request that returns a value (the new primary key)
                }
                catch
                {
                    
                    dbErrorLabel.Text = "Database error adding DVD. <br />";
                }
                finally
                {
                    conn.Close();
                }


                comm1 = new SqlCommand("INSERT into Details(DVDID, Description, PicURL) VALUES(@dvdid, @Description, " +
                   " @PicURL)", conn);

                comm1.Parameters.Add("@dvdid", System.Data.SqlDbType.Int);
                comm1.Parameters["@dvdid"].Value = insertedId;
                comm1.Parameters.Add("@Description", System.Data.SqlDbType.NVarChar, 500);
                comm1.Parameters["@Description"].Value = description.Text;
                comm1.Parameters.Add("@PicURL", System.Data.SqlDbType.NVarChar, 100);
                comm1.Parameters["@PicURL"].Value = imageURL.Text;

                try
                {
                    conn.Open();
                    comm1.ExecuteNonQuery();
                }

                catch
                {
                    dbErrorLabel.Text = "Database error adding DVD Description and Picture. <br />";
                }

                finally
                {
                    conn.Close();
                    ButtonAddAnother.Visible = true;
                    dbErrorLabel.Text = "<h2><strong style='color: red; font-size: 25px;'>The DVD has been added to the Store</strong></h2><br />";
                    textBlock.Visible = false;
                }

            }
        }

        protected void ButtonLogoff_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/default.aspx");
        }

        protected void ButtonAddAnother_Click(object sender, EventArgs e)
        {
            ButtonAddAnother.Visible = false;
            Response.Redirect("AddDVD.aspx");
        }
    }
}