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
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/default.aspx");
        }

        protected void ButtonCustomers_Click(object sender, EventArgs e)
        {
            SqlConnection conn;
            SqlCommand comm;
            SqlDataReader reader;
            string connectionString = ConfigurationManager.ConnectionStrings["DVDconnstring"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("SELECT CustomerID, FirstName, LastName FROM Customers", conn);
            try
            {
                conn.Open();
                reader = comm.ExecuteReader();
                GetCustomer.DataSource = reader;
                GetCustomer.DataBind();
                reader.Close();
            }

            catch
            {
                dbErrorLabel.Text = "Error getting Customer Info<br />";
            }

            finally
            {
                conn.Close();
            }
        }

        protected void OrdersButton_Click(object sender, EventArgs e)
        {
            SqlConnection conn;
            SqlCommand comm;
            SqlDataReader reader;
            string connectionString = ConfigurationManager.ConnectionStrings["DVDconnstring"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("SELECT Orders.OrderID, Orders.CustomerID, DVDsOrdered.DVDID, DVDtable.DVDtitle FROM Orders  " +
                " INNER JOIN DVDsOrdered ON DVDsOrdered.OrderID = Orders.OrderID " +
                " INNER JOIN DVDtable ON DVDsOrdered.DVDID = DVDtable.DVDID " +
                 " WHERE CustomerID = @CustomerID", conn);

            comm.Parameters.Add("@CustomerID", System.Data.SqlDbType.Int);
            comm.Parameters["@CustomerID"].Value = CustNumTextbox.Text;

            try
            {
                conn.Open();
                reader = comm.ExecuteReader();
                GetOrders.DataSource = reader;
                GetOrders.DataBind();
                reader.Close();
            }

            catch
            {
                dbErrorLabel.Text = "Error getting Order Info<br />";
            }

            finally
            {
                conn.Close();
            }
        }
    }
}