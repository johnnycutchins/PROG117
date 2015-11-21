using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JohnnyCutchinsDVD
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            usernameTextBox.Focus();
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            if (FormsAuthentication.Authenticate(usernameTextBox.Text, passwordTextBox.Text))
            {
                FormsAuthentication.RedirectFromLoginPage(usernameTextBox.Text, false); // false Logs you out when the browsing session is over
            }
            else
            {
                usernameTextBox.Focus();
                usernameTextBox.Text = "";
                passwordTextBox.Text = "";
            }
        }
    }
}