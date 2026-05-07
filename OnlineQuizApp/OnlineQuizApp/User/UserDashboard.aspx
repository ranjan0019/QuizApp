<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="OnlineQuizApp.User.UserDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Dashboard - OnlineQuizApp</title>
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

        .highlight-box {
            background: linear-gradient(135deg, #198754, #20c997);
            color: white;
            border-radius: 16px;
            padding: 25px;
            box-shadow: 0 0 15px rgba(0,0,0,0.08);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Top Header -->
        <div class="top-header">
            <div class="container d-flex justify-content-between align-items-center">
                <div>
                    <div class="dashboard-title">User Dashboard</div>
                    <div class="welcome-text">
                        Welcome, 
                        <asp:Label ID="lblUserName" runat="server" Text="Student"></asp:Label>
                        | Access quizzes, results, and leaderboard
                    </div>
                </div>
                <div>
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger logout-btn" OnClick="btnLogout_Click" />
                </div>
            </div>
        </div>

        <div class="container">

            <!-- Highlight Welcome Box -->
            <div class="highlight-box mb-5">
                <h4>Welcome to Your Quiz Portal</h4>
                <p class="mb-0">
                    Attempt quizzes, check your results, monitor your progress, and compete with others on the leaderboard.
                </p>
            </div>

            <!-- Dashboard Overview -->
            <h3 class="section-title">My Dashboard Overview</h3>
            <div class="row g-4 mb-5">
                <div class="col-md-4">
                    <div class="card card-box text-center p-4 bg-success text-white">
                        <div class="stat-number">5+</div>
                        <h5>Available Quizzes</h5>
                        <p class="mb-0">Quizzes ready for participation</p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card card-box text-center p-4 bg-primary text-white">
                        <div class="stat-number">3+</div>
                        <h5>My Attempts</h5>
                        <p class="mb-0">Total quizzes attempted so far</p>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card card-box text-center p-4 bg-dark text-white">
                        <div class="stat-number">85%</div>
                        <h5>Performance</h5>
                        <p class="mb-0">Average quiz performance level</p>
                    </div>
                </div>
            </div>

            <!-- Quick Actions -->
            <h3 class="section-title">Quick Actions</h3>
            <div class="row g-4 mb-5">

                <!-- Take Quiz -->
                <div class="col-md-4">
                    <a href="AvailableQuizzes.aspx" class="link-card">
                        <div class="card action-card p-4 text-center">
                            <div class="action-icon">📝</div>
                            <h5>Take Quiz</h5>
                            <p class="mb-0">Start and attempt available quizzes.</p>
                        </div>
                    </a>
                </div>

                <!-- My Results -->
                <div class="col-md-4">
                    <a href="MyResults.aspx" class="link-card">
                        <div class="card action-card p-4 text-center">
                            <div class="action-icon">📊</div>
                            <h5>My Results</h5>
                            <p class="mb-0">View scores, marks, and percentage.</p>
                        </div>
                    </a>
                </div>

                <!-- Leaderboard -->
                <div class="col-md-4">
                    <a href="Leaderboard.aspx" class="link-card">
                        <div class="card action-card p-4 text-center">
                            <div class="action-icon">🏆</div>
                            <h5>Leaderboard</h5>
                            <p class="mb-0">See top performers and rankings.</p>
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

                <!-- Available Quizzes -->
                <div class="col-md-4">
                    <a href="AvailableQuizzes.aspx" class="link-card">
                        <div class="card action-card p-4 text-center">
                            <div class="action-icon">📚</div>
                            <h5>Available Quizzes</h5>
                            <p class="mb-0">Browse quiz list before attempting.</p>
                        </div>
                    </a>
                </div>

                <!-- My Profile (placeholder) -->
                <div class="col-md-4">
                    <a href="#" class="link-card">
                        <div class="card action-card p-4 text-center">
                            <div class="action-icon">👤</div>
                            <h5>My Profile</h5>
                            <p class="mb-0">View your user details and activity.</p>
                        </div>
                    </a>
                </div>
            </div>

            <!-- User Overview -->
            <h3 class="section-title">User Overview</h3>
            <div class="overview-box">
                <p>
                    <strong>OnlineQuizApp User Panel</strong> allows students to participate in quizzes, track performance, and stay updated with their progress.
                    This dashboard provides a clean and user-friendly environment for quiz participation and result analysis.
                </p>
                <p>
                    Students can access available quizzes, attempt questions, review previous results, and compare rankings using the leaderboard system.
                </p>
                <p class="mb-0">
                    <strong>Current Status:</strong> User dashboard, available quizzes, quiz attempt flow, results, and leaderboard are connected successfully.
                </p>
            </div>

            <!-- Footer -->
            <div class="footer-note">
                OnlineQuizApp User Dashboard | Developed by Khitish Ranjan Jena and Deepali Priyadarshini Rout
            </div>

        </div>

    </form>
</body>
</html>