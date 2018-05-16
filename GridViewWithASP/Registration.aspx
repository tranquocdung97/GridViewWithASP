<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="BaiTapChuong4.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table align="center">
        <tr>
            <td align="right">
                <asp:Label runat="server" Text="Tên người dùng: "></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="textBoxUser"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" ErrorMessage="Bắt buộc" ControlToValidate="textBoxUser" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label runat="server" Text="Mật khẩu: "></asp:Label>               
            </td>
            <td>
                <asp:TextBox runat="server" ID="textBoxPassword" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ErrorMessage="Bắt buộc" ControlToValidate="textBoxPassword" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right"> 
                <asp:Label runat="server" Text="Nhập lại mật khẩu: "></asp:Label>               
            </td>
            <td>
                <asp:TextBox runat="server" ID="textBoxPasswordComfirm" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidatorPassword" runat="server" ControlToCompare="textBoxPassword" ControlToValidate="textBoxPasswordComfirm" ErrorMessage="Mật khẩu không trùng khớp" ForeColor="Red" Operator="Equal" Type="String"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label runat="server" Text="E-mail: "></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="textBoxEmail"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" ControlToValidate="textBoxEmail" ErrorMessage="Email không hợp lệ" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label runat="server" Text="Ngày sinh: "></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="textBoxNgaySinh"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidatorNgaySinh" runat="server" ControlToValidate="textBoxNgaySinh" ErrorMessage="Ngày sinh không hợp lệ" ForeColor="Red" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label runat="server" Text="Địa chỉ website: "></asp:Label>
            </td>
            <td>
                <asp:TextBox runat="server" ID="textBoxWebsite"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Label ID="lbLoi" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <asp:Button runat="server" ID="btnDangKy" Text="Đăng ký" OnClick="btnDangKy_Click"/>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
