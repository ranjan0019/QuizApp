<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddQuestion.aspx.cs" Inherits="OnlineQuizApp.Admin.AddQuestion" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Question - OnlineQuizApp</title>
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

        .counter-box {
            position: relative;
        }

        .char-counter {
            position: absolute;
            right: 10px;
            bottom: -22px;
            color: #6c757d;
            font-weight: 600;
            font-size: 13px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="top-header">
            <div class="container d-flex justify-content-between align-items-center">
                <div>
                    <div class="page-title">Add Question</div>
                    <div class="page-subtitle">Add MCQ questions and options to a selected quiz</div>
                </div>
                <div>
                    <a href="AdminDashboard.aspx" class="btn btn-light btn-custom">Back to Dashboard</a>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="form-card">
                <h3 class="section-title">Question Details</h3>

                <div class="info-box">
                    <strong>Note:</strong> Select a quiz first, then add the question with 4 options, correct answer, and marks.
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Select Quiz</label>
                    <asp:DropDownList ID="ddlQuiz" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>

                <!-- Question Text with 300 Character Counter -->
                <div class="mb-4">
                    <label class="form-label fw-bold">Question Text</label>

                    <div class="counter-box">
                        <asp:TextBox ID="txtQuestionText" runat="server"
                            CssClass="form-control"
                            TextMode="MultiLine"
                            Rows="4"
                            MaxLength="300"
                            onkeyup="updateQuestionCounter()"
                            oninput="updateQuestionCounter()"
                            placeholder="Enter question text (Maximum 300 characters)">
                        </asp:TextBox>

                        <small id="questionCounter" class="char-counter">300/300</small>
                    </div>

                    <small class="text-muted d-block mt-4">
                        Maximum 300 characters allowed.
                    </small>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Question Type</label>
                    <asp:DropDownList ID="ddlQuestionType" runat="server" CssClass="form-control">
                        <asp:ListItem Text="MCQ" Value="MCQ"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Option A</label>
                    <asp:TextBox ID="txtOptionA" runat="server" CssClass="form-control" placeholder="Enter option A"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Option B</label>
                    <asp:TextBox ID="txtOptionB" runat="server" CssClass="form-control" placeholder="Enter option B"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Option C</label>
                    <asp:TextBox ID="txtOptionC" runat="server" CssClass="form-control" placeholder="Enter option C"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Option D</label>
                    <asp:TextBox ID="txtOptionD" runat="server" CssClass="form-control" placeholder="Enter option D"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Correct Answer</label>
                    <asp:TextBox ID="txtCorrectAnswer" runat="server" CssClass="form-control" placeholder="Enter correct answer exactly as one option"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Marks</label>
                    <asp:TextBox ID="txtMarks" runat="server" CssClass="form-control" TextMode="Number" placeholder="Enter marks"></asp:TextBox>
                </div>

                <div class="mb-3">
                    <asp:Button ID="btnAddQuestion" runat="server" Text="Add Question" CssClass="btn btn-primary btn-custom w-100" OnClick="btnAddQuestion_Click" />
                </div>

                <div class="mb-3 text-center">
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="true"></asp:Label>
                </div>
            </div>

            <div class="footer-note">
                OnlineQuizApp Question Management | Developed by Khitish Ranjan Jena
            </div>
        </div>

    </form>

    <script type="text/javascript">
        function updateQuestionCounter() {
            var txt = document.getElementById('<%= txtQuestionText.ClientID %>');
            var counter = document.getElementById('questionCounter');
            var maxLength = 300;

            if (txt && counter) {
                var currentLength = txt.value.length;
                var remaining = maxLength - currentLength;

                counter.innerHTML = remaining + "/" + maxLength;

                if (remaining <= 50 && remaining > 20) {
                    counter.style.color = "orange";
                }
                else if (remaining <= 20) {
                    counter.style.color = "red";
                }
                else {
                    counter.style.color = "#6c757d";
                }
            }
        }

        window.onload = function () {
            updateQuestionCounter();
        };
    </script>
</body>
</html>