<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyResults.aspx.cs" Inherits="OnlineQuizApp.User.MyResults" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Results - OnlineQuizApp</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f4f6f9;
            font-family: Arial, sans-serif;
        }

        .top-header {
            background: linear-gradient(90deg, #0d6efd, #0a58ca);
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

        .btn-custom {
            border-radius: 30px;
            font-weight: 600;
            padding: 10px 25px;
        }

        .info-box {
            background: #e7f1ff;
            border-left: 5px solid #0d6efd;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .table thead th {
            background-color: #0d6efd;
            color: white;
            text-align: center;
        }

        .table tbody tr:hover {
            background-color: #eef5ff;
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
                    <div class="page-title">My Results</div>
                    <div class="page-subtitle">View all your quiz attempts and scores</div>
                </div>
                <div>
                    <a href="UserDashboard.aspx" class="btn btn-light btn-custom">Back to Dashboard</a>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="content-card">

                <div class="info-box">
                    <strong>Student Note:</strong> This page shows all quiz attempts completed by you, along with marks and attempt date.
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger d-block text-center mb-3 fw-bold"></asp:Label>

                <asp:GridView ID="gvMyResults" runat="server"
                    CssClass="table table-bordered table-striped table-hover"
                    AutoGenerateColumns="False"
                    EmptyDataText="No results found."
                    GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="ResultId" HeaderText="Result ID" />
                        <asp:BoundField DataField="QuizTitle" HeaderText="Quiz Title" />
                        <asp:BoundField DataField="Score" HeaderText="Score" />
                        <asp:BoundField DataField="TotalMarks" HeaderText="Total Marks" />
                        <asp:BoundField DataField="AttemptDate" HeaderText="Attempt Date" DataFormatString="{0:dd-MM-yyyy hh:mm tt}" />
                    </Columns>
                </asp:GridView>

            </div>

            <div class="footer-note">
                OnlineQuizApp My Results Panel | Developed by Khitish Ranjan Jena and Deepali Priyadarshini Rout
            </div>
        </div>

    </form>
</body>
</html>