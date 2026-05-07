<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewResults.aspx.cs" Inherits="OnlineQuizApp.Admin.ViewResults" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Results - OnlineQuizApp</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f6f9;
            font-family: Arial, sans-serif;
        }

        .top-header {
            background: linear-gradient(90deg, #6f42c1, #5a32a3);
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
            background: #f3ecff;
            border-left: 5px solid #6f42c1;
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
            text-align: center;
        }

        .table thead th {
            background-color: #6f42c1;
            color: white;
        }

        .table tbody tr:hover {
            background-color: #f8f3ff;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="top-header">
            <div class="container d-flex justify-content-between align-items-center">
                <div>
                    <div class="page-title">View Results</div>
                    <div class="page-subtitle">View all students' quiz results and performance</div>
                </div>
                <div>
                    <a href="AdminDashboard.aspx" class="btn btn-light btn-custom">Back to Dashboard</a>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="content-card">
                <h3 class="section-title">All Student Results</h3>

                <div class="info-box">
                    <strong>Admin Note:</strong> This page shows all quiz attempts made by all students with score, total marks, percentage, and attempt date.
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger d-block text-center mb-3 fw-bold"></asp:Label>

                <div class="grid-container">
                    <asp:GridView ID="gvResults" runat="server"
                        CssClass="table table-bordered table-striped table-hover"
                        AutoGenerateColumns="True"
                        EmptyDataText="No result records found."
                        GridLines="None">
                    </asp:GridView>
                </div>
            </div>

            <div class="footer-note">
                OnlineQuizApp Result Analysis Panel | Developed by Khitish Ranjan Jena
            </div>
        </div>

    </form>
</body>
</html>