<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AvailableQuizzes.aspx.cs" Inherits="OnlineQuizApp.User.AvailableQuizzes" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Available Quizzes - OnlineQuizApp</title>
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
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Top Header -->
        <div class="top-header">
            <div class="container d-flex justify-content-between align-items-center">
                <div>
                    <div class="page-title">Available Quizzes</div>
                    <div class="page-subtitle">Browse all available quizzes and start your attempt</div>
                </div>
                <div>
                    <a href="UserDashboard.aspx" class="btn btn-light btn-custom">Back to Dashboard</a>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="content-card">
                <h3 class="section-title">Quiz List</h3>

                <div class="info-box">
                    <strong>Student Note:</strong> Select any available quiz from the list below and click <strong>Start Quiz</strong> to begin.
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger d-block text-center mb-3 fw-bold"></asp:Label>

                <div class="grid-container">
                    <asp:GridView ID="gvAvailableQuizzes" runat="server"
                        CssClass="table table-bordered table-striped table-hover"
                        AutoGenerateColumns="False"
                        EmptyDataText="No quizzes available."
                        GridLines="None"
                        OnRowCommand="gvAvailableQuizzes_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="QuizId" HeaderText="Quiz ID" />
                            <asp:BoundField DataField="Title" HeaderText="Title" />
                            <asp:BoundField DataField="Description" HeaderText="Description" />
                            <asp:BoundField DataField="TotalQuestions" HeaderText="Total Questions" />
                            <asp:BoundField DataField="TotalMarks" HeaderText="Total Marks" />
                            <asp:BoundField DataField="CreatedDate" HeaderText="Created Date" DataFormatString="{0:dd-MM-yyyy hh:mm tt}" />
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:Button ID="btnStartQuiz" runat="server"
                                        Text="Start Quiz"
                                        CssClass="btn btn-success btn-sm"
                                        CommandName="StartQuiz"
                                        CommandArgument='<%# Eval("QuizId") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <div class="footer-note">
                OnlineQuizApp Available Quiz Panel | Developed by Khitish Ranjan Jena and Deepali Priyadarshni rout
            </div>
        </div>

    </form>
</body>
</html>