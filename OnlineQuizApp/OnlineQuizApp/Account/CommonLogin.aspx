<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommonLogin.aspx.cs" Inherits="OnlineQuizApp.Account.CommonLogin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - OnlineQuizApp</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }

        .login-container {
            width: 450px;
            margin: 70px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        .login-title {
            text-align: center;
            margin-bottom: 25px;
            font-weight: bold;
        }

        .bottom-links {
            text-align: center;
            margin-top: 15px;
        }

        .bottom-links a {
            text-decoration: none;
            margin: 0 8px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2 class="login-title">Common Login</h2>

            <div class="mb-3">
                <label>Select Role</label>
                <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-control">
                    <asp:ListItem Text="-- Select Role --" Value=""></asp:ListItem>
                    <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                    <asp:ListItem Text="Student" Value="Student"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="mb-3">
                <label>Email</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
            </div>

            <div class="mb-3">
                <label>Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            </div>

            <div class="mb-3">
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary w-100" OnClick="btnLogin_Click" />
            </div>

            <div class="mb-3 text-center">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </div>

            <div class="bottom-links">
                <a href="../User/UserRegister.aspx">New Student? Register</a>
            </div>
        </div>
    </form>
</body>
</html>