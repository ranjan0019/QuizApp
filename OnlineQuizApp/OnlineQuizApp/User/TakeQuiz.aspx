<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TakeQuiz.aspx.cs" Inherits="OnlineQuizApp.User.TakeQuiz" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Take Quiz - OnlineQuizApp</title>
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

        .quiz-container {
            background: #ffffff;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 0 15px rgba(0,0,0,0.08);
            margin-bottom: 30px;
        }

        .question-card {
            border: 1px solid #e9ecef;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 20px;
            background-color: #fafafa;
            box-shadow: 0 0 8px rgba(0,0,0,0.03);
        }

        .question-text {
            font-weight: bold;
            margin-bottom: 15px;
            font-size: 18px;
            color: #212529;
        }

        .option-item {
            margin-top: 10px;
        }

        .info-box {
            background: #e7f1ff;
            border-left: 5px solid #0d6efd;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        .btn-custom {
            border-radius: 30px;
            font-weight: 600;
            padding: 10px 30px;
        }

        .footer-note {
            text-align: center;
            color: #6c757d;
            margin-top: 20px;
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
                    <div class="page-title">Take Quiz</div>
                    <div class="page-subtitle">Read each question carefully and choose the correct answer</div>
                </div>
                <div>
                    <a href="AvailableQuizzes.aspx" class="btn btn-light btn-custom">Back to Quizzes</a>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="quiz-container">

                <div class="info-box">
                    <strong>Instructions:</strong> Select one option for each question and click <strong>Submit Quiz</strong> after completing all answers.
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="d-block text-center mb-3 fw-bold"></asp:Label>

                <asp:Repeater ID="rptQuestions" runat="server" OnItemDataBound="rptQuestions_ItemDataBound">
                    <ItemTemplate>
                        <div class="question-card">
                            <div class="question-text">
                                Q<%# Container.ItemIndex + 1 %>. <%# Eval("QuestionText") %>
                            </div>

                            <asp:HiddenField ID="hfQuestionId" runat="server" Value='<%# Eval("QuestionId") %>' />
                            <asp:HiddenField ID="hfCorrectAnswer" runat="server" Value='<%# Eval("CorrectAnswer") %>' />
                            <asp:HiddenField ID="hfMarks" runat="server" Value='<%# Eval("Marks") %>' />

                            <asp:RadioButtonList ID="rblOptions" runat="server" CssClass="option-item"></asp:RadioButtonList>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

                <div class="text-center mt-4">
                    <asp:Button ID="btnSubmitQuiz" runat="server" Text="Submit Quiz" CssClass="btn btn-success btn-custom" OnClick="btnSubmitQuiz_Click" />
                </div>

            </div>

            <div class="footer-note">
                OnlineQuizApp Quiz Attempt Panel | Developed by Khitish Ranjan Jena and Deepali Priyadarshini Rout
            </div>
        </div>

    </form>
</body>
</html>