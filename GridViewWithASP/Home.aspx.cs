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
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["DotNETConnectionString"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            String sessionUser = (string)Session["user"];
            if (sessionUser != null)
                lbChao.Text = "Xin chào thành viên: " + sessionUser;
            else
                Response.Redirect("Login.aspx");
        }
        protected void LoadDuLieu()
        {
            conn.Open();
            String sql = "select *from SinhVien";
            SqlCommand cm = new SqlCommand(sql, conn);
            cm.CommandType = CommandType.Text;
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cm);
            try
            {
                da.Fill(dt);
                GridView1.DataSource = dt;
            }
            catch (Exception ex)
            {
                lbLoi.Text = "Dữ liệu hiển thị thất bại.";
                lbLoi.ForeColor = System.Drawing.Color.Red;
            }
            conn.Close();
        }
        protected void btnThoat_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            conn.Open();
            String sql = "INSERT INTO SinhVien(MaSV, HoVaTen, NgaySinh, QueQuan, Diem) VALUES('" + textBoxMaSV.Text + "',N'" + textBoxHoTen.Text + "', '" + textBoxNgaySinh.Text + "',N'" + textBoxQueQuan.Text + "','" + textBoxDiem.Text + "')";
            try
            {
                if (Convert.ToInt32(textBoxDiem.Text) >= 0 && Convert.ToInt32(textBoxDiem.Text) <= 10)
                {
                    SqlCommand cm = new SqlCommand(sql, conn);
                    try
                    {
                        cm.ExecuteNonQuery();
                        Response.Redirect("Home.aspx");
                    }
                    catch (Exception ex)
                    {
                        lbLoi.Text = "Thêm dữ liệu thất bại";
                        lbLoi.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lbLoi.Text = "Dữ liệu điểm không đúng";
                    lbLoi.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lbLoi.Text = "Thêm dữ liệu thất bại";
                lbLoi.ForeColor = System.Drawing.Color.Red;
            }
            conn.Close();
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            conn.Open();
            String sql = "delete from SinhVien where MaSV='" + textBoxMaSV.Text + "'";
            if(textBoxMaSV.Text!="")
            {
                SqlCommand cm = new SqlCommand(sql, conn);
                try
                {
                    cm.ExecuteNonQuery();
                    Response.Redirect("Home.aspx");
                }
                catch (Exception ex)
                {
                    lbLoi.Text = "Xóa dữ liệu thất bại";
                    lbLoi.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lbLoi.Text = "Chưa nhập Mã SV";
                lbLoi.ForeColor = System.Drawing.Color.Red;
            }
            conn.Close();
        }

        protected void btnSua_Click(object sender, EventArgs e)
        {
            conn.Open();
            String sql = "update SinhVien set HoVaTen=N'" + textBoxHoTen.Text + "', NgaySinh='" + textBoxNgaySinh.Text + "', QueQuan=N'" + textBoxQueQuan.Text + "', Diem='" + textBoxDiem.Text + "' where MaSV='" + textBoxMaSV.Text + "'";
            try
            {
                if ((int.Parse(textBoxDiem.Text) >= 0 && int.Parse(textBoxDiem.Text) <= 10) || (float.Parse(textBoxDiem.Text) >= 0 && int.Parse(textBoxDiem.Text) <= 10))
                {
                    SqlCommand cm = new SqlCommand(sql, conn);
                    try
                    {
                        cm.ExecuteNonQuery();
                        Response.Redirect("Home.aspx");
                    }
                    catch (Exception ex)
                    {
                        lbLoi.Text = "Cập nhật dữ liệu thất bại";
                        lbLoi.ForeColor = System.Drawing.Color.Red;
                    }
                }
                else
                {
                    lbLoi.Text = "Dữ liệu điểm không đúng";
                    lbLoi.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lbLoi.Text = "Cập nhật dữ liệu thất bại";
                lbLoi.ForeColor = System.Drawing.Color.Red;
            }
            conn.Close();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int d = GridView1.SelectedIndex;
            textBoxMaSV.Text = GridView1.Rows[d].Cells[1].Text.Trim();
            textBoxHoTen.Text = HttpUtility.HtmlDecode((string)GridView1.Rows[d].Cells[2].Text.ToString());
            textBoxNgaySinh.Text = GridView1.Rows[d].Cells[3].Text.Trim();
            textBoxQueQuan.Text = HttpUtility.HtmlDecode((string)GridView1.Rows[d].Cells[4].Text.ToString());
            textBoxDiem.Text = GridView1.Rows[d].Cells[5].Text.Trim();
        }
    }
}