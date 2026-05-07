<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="OnlineQuizApp.Admin.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard - OnlineQuizApp</title>
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

        .dashboard-title {
            font-size: 32px;
            font-weight: bold;
        }

        .welcome-text {
            font-size: 16px;
            opacity: 0.95;
        }

        .card-box {
            border: none;
            border-radius: 16px;
            box-shadow: 0 0 15px rgba(0,0,0,0.08);
            transition: 0.3s;
            height: 100%;
        }

        .card-box:hover {
            transform: translateY(-5px);
        }

        .stat-number {
            font-size: 32px;
            font-weight: bold;
        }

        .action-card {
            border: none;
            border-radius: 16px;
            box-shadow: 0 0 12px rgba(0,0,0,0.08);
            transition: 0.3s;
            height: 100%;
        }

        .action-card:hover {
            transform: translateY(-4px);
        }

        .action-icon {
            font-size: 36px;
            margin-bottom: 15px;
        }

        .section-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 25px;
        }

        .overview-box {
            background: white;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 0 12px rgba(0,0,0,0.08);
        }

        .logout-btn {
            border-radius: 30px;
            font-weight: 600;
            padding: 10px 25px;
        }

        .footer-note {
            text-align: center;
            color: #6c757d;
            margin-top: 35px;
            font-size: 14px;
        }

        .link-card {
            text-decoration: none !important;
            color: inherit !important;
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Top Header -->
        <div class="top-header">
            <div class="container d-flex justify-content-between align-items-center">
                <div>
                    <div class="dashboard-title">Admin Dashboard</div>
                    <div class="welcome-text">Welcome, Admin | Manage your OnlineQuizApp system efficiently</div>
                </div>
                <div>
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger logout-btn" OnClick="btnLogout_Click" />
                </div>
            </div>
        </div>

        <div class="container">

            <!-- Dashboard Overview -->
            <h3 class="section-title">Dashboard Overview</h3>
            <div class="row g-4 mb-5">
                <div class="col-md-3">
                    <div class="card card-box text-center p-4 bg-primary text-white">
                        <div class="stat-number">25+</div>
                        <h5>Total Users</h5>
                        <p class="mb-0">Registered students on platform</p>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card card-box text-center p-4 bg-success text-white">
                        <div class="stat-number">10+</div>
                        <h5>Total Quizzes</h5>
                        <p class="mb-0">Available quiz sets created</p>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card card-box text-center p-4 bg-warning text-dark">
                        <div class="stat-number">50+</div>
                        <h5>Total Questions</h5>
                        <p class="mb-0">Questions across all quizzes</p>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="card card-box text-center p-4 bg-dark text-white">
                        <div class="stat-number">100+</div>
                        <h5>Total Results</h5>
                        <p class="mb-0">Quiz attempts and result records</p>
                    </div>
                </div>
            </div>

            <!-- Quick Actions -->
            <h3 class="section-title">Quick Actions</h3>
            <div class="row g-4 mb-5">

                <!-- Manage Users -->
                <div class="col-md-4">
                    <a href="ManageUsers.aspx" class="link-card">
                        <div class="card action-card p-4 text-center">
                            <div class="action-icon">👥</div>
                            <h5>Manage Users</h5>
                            <p class="mb-0">View and monitor all registered students.</p>
                        </div>
                    </a>
                </div>

                <!-- Create Quiz -->
                <div class="col-md-4">
                    <a href="CreateQuiz.aspx" class="link-card">
                        <div class="card action-card p-4 text-center">
                            <div class="action-icon">📝</div>
                            <h5>Create Quiz</h5>
                            <p class="mb-0">Create new quizzes for student assessments.</p>
                        </div>
                    </a>
                </div>

                <!-- Add Questions -->
                <div class="col-md-4">
                    <a href="AddQuestion.aspx" class="link-card">
                        <div class="card action-card p-4 text-center">
                            <div class="action-icon">❓</div>
                            <h5>Add Questions</h5>
                            <p class="mb-0">Add multiple questions and options to quizzes.</p>
                        </div>
                    </a>
                </div>

                <!-- Manage Quizzes -->
                <div class="col-md-4">
                    <a href="ManageQuizzes.aspx" class="link-card">
                        <div class="card action-card p-4 text-center">
                            <div class="action-icon">📚</div>
                            <h5>Manage Quizzes</h5>
                            <p class="mb-0">View all quizzes with question count and total marks.</p>
                        </div>
                    </a>
                </div>

                <!-- View Results -->
                <div class="col-md-4">
                    <a href="ViewResults.aspx" class="link-card">
                        <div class="card action-card p-4 text-center">
                            <div class="action-icon">📊</div>
                            <h5>View Results</h5>
                            <p class="mb-0">Analyze all students' quiz scores and performance.</p>
                        </div>
                    </a>
                </div>

                <!-- Leaderboard -->
                <div class="col-md-4">
                    <a href="Leaderboard.aspx" class="link-card">
                        <div class="card action-card p-4 text-center">
                            <div class="action-icon">🏆</div>
                            <h5>Leaderboard</h5>
                            <p class="mb-0">Track top performers across all quizzes.</p>
                        </div>
                    </a>
                </div>

                <!-- Back to Home -->
                <div class="col-md-4">
                    <a href="../Default.aspx" class="link-card">
                        <div class="card action-card p-4 text-center">
                            <div class="action-icon">🏠</div>
                            <h5>Back to Home</h5>
                            <p class="mb-0">Return to the main landing page.</p>
                        </div>
                    </a>
                </div>
            </div>

            <!-- System Overview -->
            <h3 class="section-title">System Overview</h3>
            <div class="overview-box">
                <p>
                    <strong>OnlineQuizApp Admin Panel</strong> is the control center of the system where the administrator can manage users,
                    create and organize quizzes, add questions and answer options, review student performance, and monitor the leaderboard.
                </p>
                <p>
                    This dashboard is designed to provide a clean, user-friendly, and efficient way to manage the entire quiz platform.
                    It improves administrative control and helps maintain a structured online examination environment.
                </p>
                <p class="mb-0">
                    <strong>Current Status:</strong> Manage Users, Create Quiz, Add Questions, Manage Quizzes, View Results, and Leaderboard are connected and working.
                </p>
            </div>

            <!-- Footer -->
            <div class="footer-note">
                OnlineQuizApp Admin Control Panel | Developed by Khitish Ranjan Jena
            </div>

        </div>

    </form>
</body>
</html>