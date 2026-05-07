<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Leaderboard.aspx.cs" Inherits="OnlineQuizApp.User.Leaderboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Leaderboard - OnlineQuizApp</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f6f9;
            font-family: Arial, sans-serif;
        }

        .top-header {
            background: linear-gradient(90deg, #ffc107, #ffb300);
            color: #212529;
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

        .btn-custom {
            border-radius: 30px;
            font-weight: 600;
            padding: 10px 25px;
        }

        .info-box {
            background: #fff8db;
            border-left: 5px solid #ffc107;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .table thead th {
            background-color: #ffc107;
            color: #212529;
            text-align: center;
        }

        .table tbody tr:hover {
            background-color: #fff8db;
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

        <!-- Top Header -->
        <div class="top-header">
            <div class="container d-flex justify-content-between align-items-center">
                <div>
                    <div class="page-title">Leaderboard</div>
                    <div class="page-subtitle">Top performers across quiz attempts</div>
                </div>
                <div>
                    <a href="UserDashboard.aspx" class="btn btn-dark btn-custom">Back to Dashboard</a>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="content-card">

                <div class="info-box">
                    <strong>Leaderboard Note:</strong> This page shows top student performances based on highest percentage, score, and latest attempts.
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger d-block text-center mb-3 fw-bold"></asp:Label>

                <asp:GridView ID="gvLeaderboard" runat="server"
                    CssClass="table table-bordered table-striped table-hover"
                    AutoGenerateColumns="True"
                    EmptyDataText="No leaderboard data found."
                    GridLines="None">
                </asp:GridView>

            </div>

            <div class="footer-note">
                OnlineQuizApp Leaderboard Panel | Developed by Khitish Ranjan Jena and Deepali Priyadarshini Rout
            </div>
        </div>

    </form>
</body>
</html>