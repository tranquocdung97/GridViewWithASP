<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BaiTapChuong4.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center>
                <table>
                <tr>
                    <td colspan="3" align="center">
                        <asp:Label ID="lbChao" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="3">
                        <asp:Button ID="btnThoat" runat="server" BackColor="Aqua" BorderStyle="Solid" Font-Bold="True" Font-Size="Small" ForeColor="Red" OnClick="btnThoat_Click" Text="Đăng xuất" Font-Names="Tahoma" />
                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label6" runat="server" Text="Mã SV:"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="textBoxMaSV" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label2" runat="server" Text="Họ Tên:"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="textBoxHoTen" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="Label3" runat="server" Text="Ngày Sinh:"></asp:Label>
                    </td>
                    <td colspan="2">
                        <asp:TextBox ID="textBoxNgaySinh" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right">

                        <asp:Label ID="Label4" runat="server" Text="Quê Quán:"></asp:Label>

                    </td>
                    <td colspan="2">

                        <asp:TextBox ID="textBoxQueQuan" runat="server"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td align="right">

                        <asp:Label ID="Label5" runat="server" Text="Điểm:"></asp:Label>

                    </td>
                    <td colspan="2">

                        <asp:TextBox ID="textBoxDiem" runat="server"></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnThem" runat="server" Text="Thêm" Width="80px" OnClick="btnThem_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btnSua" runat="server" Text="Cập nhật" Width="80px" OnClick="btnSua_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btnXoa" runat="server" Text="Xóa" Width="80px" OnClick="btnXoa_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <asp:Label ID="lbLoi" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            </center>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="MaSV" DataSourceID="SqlDataSource1" GridLines="Vertical" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="MaSV" HeaderText="Mã SV" ReadOnly="True" SortExpression="MaSV" />
                <asp:BoundField DataField="HoVaTen" HeaderText="Họ Tên" SortExpression="HoVaTen" />
                <asp:BoundField DataField="NgaySinh" HeaderText="Ngày Sinh" SortExpression="NgaySinh" />
                <asp:BoundField DataField="QueQuan" HeaderText="Quê Quán" SortExpression="QueQuan" />
                <asp:BoundField DataField="Diem" HeaderText="Điểm" SortExpression="Diem" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DotNETConnectionString %>" SelectCommand="SELECT * FROM [SinhVien]"></asp:SqlDataSource>
    </form>
</body>
</html>
