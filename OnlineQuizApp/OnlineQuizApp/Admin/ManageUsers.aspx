<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="OnlineQuizApp.Admin.ManageUsers" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Users - OnlineQuizApp</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f6f9;
            font-family: Arial, sans-serif;
        }

        .top-header {
            background: linear-gradient(90deg, #198754, #157347);
            color: white;
            padding: 25px 0;
            margin-bottom: 30px;
        }

        .page-title {
            font-size: 30px;
            font-weight: bold;
        }

        .page-subtitle {
            font-size: 15px;
            opacity: 0.95;
        }

        .content-card {
            background: white;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 0 15px rgba(0,0,0,0.08);
        }

        .section-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .info-box {
            background: #eaf7ee;
            border-left: 5px solid #198754;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .btn-custom {
            border-radius: 30px;
            font-weight: 600;
            padding: 10px 25px;
        }

        .table td, .table th {
            vertical-align: middle;
        }

        .table thead th {
            background-color: #198754;
            color: white;
            text-align: center;
        }

        .table tbody tr:hover {
            background-color: #f1f9f4;
        }

        .grid-container {
            overflow-x: auto;
        }

        .footer-note {
            text-align: center;
            color: #6c757d;
            margin-top: 30px;
            font-size: 14px;
        }

        .badge-role-admin {
            background-color: #dc3545;
            color: white;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .badge-role-student {
            background-color: #0d6efd;
            color: white;
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Top Header -->
        <div class="top-header">
            <div class="container d-flex justify-content-between align-items-center">
                <div>
                    <div class="page-title">Manage Users</div>
                    <div class="page-subtitle">View all registered users in the system</div>
                </div>
                <div>
                    <a href="AdminDashboard.aspx" class="btn btn-light btn-custom">Back to Dashboard</a>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="content-card">
                <h3 class="section-title">Registered Users List</h3>

                <div class="info-box">
                    <strong>Admin Note:</strong> This page displays all registered users including Admins and Students.
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger d-block text-center mb-3 fw-bold"></asp:Label>

                <div class="grid-container">
                    <asp:GridView ID="gvUsers" runat="server"
                        CssClass="table table-bordered table-striped table-hover"
                        AutoGenerateColumns="False"
                        EmptyDataText="No users found."
                        GridLines="None"
                        OnRowDataBound="gvUsers_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="UserId" HeaderText="User ID" />
                            <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                            <asp:BoundField DataField="Email" HeaderText="Email" />

                            <asp:TemplateField HeaderText="Role">
                                <ItemTemplate>
                                    <asp:Label ID="lblRole" runat="server" Text='<%# Eval("Role") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="CreatedDate" HeaderText="Created Date" DataFormatString="{0:dd-MM-yyyy hh:mm tt}" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <div class="footer-note">
                OnlineQuizApp User Management Panel | Developed by Khitish Ranjan Jena
            </div>
        </div>

    </form>
</body>
</html>