<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateQuiz.aspx.cs" Inherits="OnlineQuizApp.Admin.CreateQuiz" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Quiz - OnlineQuizApp</title>
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

        .form-card {
            background: white;
            border-radius: 16px;
            padding: 35px;
            box-shadow: 0 0 15px rgba(0,0,0,0.08);
        }

        .section-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 25px;
        }

        .btn-custom {
            border-radius: 30px;
            font-weight: 600;
            padding: 10px 25px;
        }

        .info-box {
            background: #e9f5ff;
            border-left: 5px solid #0d6efd;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 25px;
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
                    <div class="page-title">Create Quiz</div>
                    <div class="page-subtitle">Create a new quiz for students in OnlineQuizApp</div>
                </div>
                <div>
                    <a href="AdminDashboard.aspx" class="btn btn-light btn-custom">Back to Dashboard</a>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="form-card">
                <h3 class="section-title">New Quiz Details</h3>

                <div class="info-box">
                    <strong>Note:</strong> Total Questions and Total Marks will be automatically updated later when you add questions to this quiz.
                </div>

                <div class="mb-3">
                    <label class="form-label">Quiz Title</label>
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Enter quiz title"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label class="form-label">Description</label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Enter quiz description"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:Button ID="btnCreateQuiz" runat="server" Text="Create Quiz" CssClass="btn btn-primary btn-custom w-100" OnClick="btnCreateQuiz_Click" />
                </div>

                <div class="mb-3 text-center">
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="true"></asp:Label>
                </div>
            </div>

            <div class="footer-note">
                OnlineQuizApp Quiz Management | Developed by Khitish Ranjan Jena
            </div>
        </div>

    </form>
</body>
</html>