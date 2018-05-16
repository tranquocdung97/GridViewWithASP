using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
namespace BaiTapChuong4
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn= new SqlConnection(WebConfigurationManager.ConnectionStrings["DotNETConnectionString"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            String sessionUser =(string) Session["user"];
            if (sessionUser != null)
                Response.Redirect("Home.aspx");
        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            conn.Open();
            String tk, mk;
            tk = textBoxUser.Text;
            mk=textBoxPassword.Text;
            String sql = "select * from ThanhVien where TenNguoiDung='"+tk+"'";
            SqlCommand cm = new SqlCommand(sql,conn);
            SqlDataReader rd= cm.ExecuteReader();
            if(rd.Read())
            {
                String mkSver =rd["MatKhau"].ToString();
                if(mk.Equals(mkSver.Trim()))
                {
                    Session["user"] = textBoxUser.Text;
                    Response.Redirect("Home.aspx");                  
                }
                else
                {
                    lbLoi.Text = "Sai mật khẩu";
                    lbLoi.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lbLoi.Text = "Sai tài khoản";
                lbLoi.ForeColor = System.Drawing.Color.Red;
            }
            conn.Close();
        }
    }
}