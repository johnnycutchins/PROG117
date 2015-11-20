using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JohnnyCutchinsCapitals
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCapitalsList();
            }
            SqlDataReader reader;
            string connectionString = ConfigurationManager.ConnectionStrings["Countries"].ConnectionString;
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand comm = new SqlCommand("SELECT CountryID, Country, Capital FROM CapitalsTable", conn);
            try
            {
                conn.Open();
                reader = comm.ExecuteReader();
                CountriesList.DataSource = reader;
                CountriesList.DataBind();
                reader.Close();
            }

            catch
            {
                LabelError.Text = "Error Loading Capitals<br />";
            }

            finally
            {
                conn.Close();
            }

        }

        private void LoadCapitalsList()
        {
            SqlConnection conn;
            SqlCommand comm;
            SqlDataReader reader;
            string connectionString = ConfigurationManager.ConnectionStrings["Countries"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("SELECT CountryID FROM CapitalsTable", conn);
            try
            {
                conn.Open();
                reader = comm.ExecuteReader();
                CapitalsList.DataSource = reader;
                CapitalsList.DataValueField = "CountryID"; //  binding to use the ID

                CapitalsList.DataTextField = "CountryID"; // part that shows

                CapitalsList.DataBind();
                reader.Close();
            }
            catch
            {
                LabelError.Text = "Error Loading The List Of Countries <br />";
            }
            finally
            {
                conn.Close();                
            }
            
        }

        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            SqlConnection conn;
            SqlCommand comm;
            string connectionString = ConfigurationManager.ConnectionStrings["Countries"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("DELETE FROM CapitalsTable WHERE CountryID = @CountryID", conn);
            comm.Parameters.Add("@CountryID", System.Data.SqlDbType.Int);
            comm.Parameters["@CountryID"].Value = CapitalsList.Text;
            try
            {
                conn.Open();
                comm.ExecuteNonQuery();
            }
            catch
            {
                LabelError.Text = "Error Deleting Capital <br />";
            }
            finally
            {
                conn.Close();
            }
            Response.Redirect("default.aspx");

        }
    }
}