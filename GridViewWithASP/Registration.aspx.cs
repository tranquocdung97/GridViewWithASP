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
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DotNETConnectionString"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangKy_Click(object sender, EventArgs e)
        {
            conn.Open();
            String tk, mk, mkconfirm, email, ngaySinh, website;
            tk= textBoxUser.Text;
            mk=textBoxPassword.Text;
            mkconfirm=textBoxPasswordComfirm.Text;
            email=textBoxEmail.Text;
            ngaySinh=textBoxNgaySinh.Text;
            website=textBoxWebsite.Text;
            if(mk.Equals(mkconfirm)){
                String sql = "INSERT INTO ThanhVien VALUES('" + tk + "','" + mk + "', '" + email + "','" + ngaySinh + "', '" + website + "')";
                try
                {
                    SqlCommand cm = new SqlCommand(sql, conn);
                    cm.ExecuteNonQuery();
                    Response.Redirect("Login.aspx");
                }catch(Exception ex){
                    lbLoi.Text = "Đăng ký không thành công. Vui lòng kiểm tra lại dữ liệu đã nhập.";
                    lbLoi.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lbLoi.Text = "Đăng ký không thành công.";
                lbLoi.ForeColor = System.Drawing.Color.Red;
            }
            conn.Close();
        }
    }
}