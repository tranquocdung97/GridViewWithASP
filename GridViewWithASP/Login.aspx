<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BaiTapChuong4.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 97px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table align="center">
        <tr>
            <td colspan="2" align="center">
                <asp:label runat="server" Text="ĐĂNG NHẬP" Font-Bold="true" Font-Size="X-Large"></asp:label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label runat="server" Text="Tên người dùng:"></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="textBoxUser"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUser" runat="server" ControlToValidate="textBoxUser" ErrorMessage="Bắt buộc" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                    <asp:Label runat="server" Text="Mật khẩu: "></asp:Label>            
            </td>
            <td>
                <asp:TextBox runat="server" ID="textBoxPassword" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="textBoxPassword" ErrorMessage="Bắt buộc" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Label ID="lbLoi" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <asp:Button runat="server" ID="btnDangNhap" Text="Đăng nhập" style="height: 26px" OnClick="btnDangNhap_Click"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="left">
                <a href="Registration.aspx"><b><u>Đăng ký thành viên</u></b></a>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
