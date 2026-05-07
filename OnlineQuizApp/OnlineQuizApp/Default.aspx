<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineQuizApp.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OnlineQuizApp - Home</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .navbar-custom {
            background: linear-gradient(90deg, #0d6efd, #0a58ca);
            padding: 12px 0;
        }

        .navbar-brand,
        .nav-link {
            color: white !important;
            font-weight: 500;
        }

        .hero-section {
            background: linear-gradient(135deg, #0d6efd, #6ea8fe);
            color: white;
            padding: 80px 0;
        }

        .hero-title {
            font-size: 48px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .hero-text {
            font-size: 18px;
            margin-bottom: 30px;
        }

        .hero-card {
            background: white;
            color: #212529;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 0 20px rgba(0,0,0,0.15);
        }

        .section-title {
            text-align: center;
            font-weight: bold;
            margin-bottom: 40px;
        }

        .feature-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0,0,0,0.08);
            transition: 0.3s;
            height: 100%;
        }

        .feature-card:hover {
            transform: translateY(-5px);
        }

        .feature-icon {
            font-size: 40px;
            margin-bottom: 15px;
        }

        .quick-access {
            background: #ffffff;
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 0 15px rgba(0,0,0,0.08);
        }

        .about-box {
            background: #ffffff;
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 0 15px rgba(0,0,0,0.08);
        }

        .footer {
            background: #212529;
            color: white;
            padding: 20px 0;
            margin-top: 60px;
            text-align: center;
        }

        .btn-custom {
            border-radius: 30px;
            padding: 10px 25px;
            font-weight: 600;
        }

        .stats-box {
            text-align: center;
            padding: 15px;
            border-radius: 12px;
            background-color: #f8f9fa;
            margin-bottom: 15px;
        }

        .stats-number {
            font-size: 28px;
            font-weight: bold;
            color: #0d6efd;
        }

        .how-step {
            background: #ffffff;
            border-radius: 15px;
            padding: 25px;
            box-shadow: 0 0 12px rgba(0,0,0,0.06);
            text-align: center;
            height: 100%;
        }

        .how-step-number {
            width: 50px;
            height: 50px;
            line-height: 50px;
            border-radius: 50%;
            background: #0d6efd;
            color: white;
            font-weight: bold;
            margin: 0 auto 15px auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <nav class="navbar navbar-expand-lg navbar-custom">
            <div class="container">
                <a class="navbar-brand" href="Default.aspx">OnlineQuizApp</a>
                <button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="Default.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="Admin/AdminLogin.aspx">Admin Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="User/UserLogin.aspx">User Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="User/UserRegister.aspx">Register</a></li>
                        <li class="nav-item"><a class="nav-link" href="#aboutSection">About</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <section class="hero-section">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-7">
                        <h1 class="hero-title">Welcome to OnlineQuizApp</h1>
                        <p class="hero-text">
                            Create quizzes, test knowledge, manage students, view scores, and compete on the leaderboard — all in one powerful online quiz platform.
                        </p>
                        <a href="User/UserLogin.aspx" class="btn btn-light btn-custom me-2">Start Quiz</a>
                        <a href="Admin/AdminLogin.aspx" class="btn btn-dark btn-custom me-2">Admin Login</a>
                        <a href="User/UserRegister.aspx" class="btn btn-warning btn-custom">Register Now</a>
                    </div>
                    <div class="col-md-5">
                        <div class="hero-card">
                            <h4 class="mb-4 text-center">Quick Overview</h4>
                            <div class="stats-box">
                                <div class="stats-number">6+</div>
                                <div>Core Modules</div>
                            </div>
                            <div class="stats-box">
                                <div class="stats-number">100%</div>
                                <div>Web Forms Based</div>
                            </div>
                            <div class="stats-box">
                                <div class="stats-number">SQL</div>
                                <div>Stored Procedure Driven</div>
                            </div>
                            <div class="stats-box">
                                <div class="stats-number">MCA</div>
                                <div>Project Ready</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5">
            <div class="container">
                <h2 class="section-title">Core Features</h2>
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="card feature-card p-4 text-center">
                            <div class="feature-icon">👨‍💼</div>
                            <h5>Admin Panel</h5>
                            <p>Admins can manage quizzes, questions, users, and monitor platform activities.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card feature-card p-4 text-center">
                            <div class="feature-icon">📝</div>
                            <h5>User Registration</h5>
                            <p>Students can register securely and access quizzes using their personal login credentials.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card feature-card p-4 text-center">
                            <div class="feature-icon">🔐</div>
                            <h5>Secure Login</h5>
                            <p>Separate login modules for Admin and Users provide better access control and security.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card feature-card p-4 text-center">
                            <div class="feature-icon">❓</div>
                            <h5>Quiz Management</h5>
                            <p>Create quizzes, add multiple questions, define answers, and manage question options easily.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card feature-card p-4 text-center">
                            <div class="feature-icon">📊</div>
                            <h5>Instant Results</h5>
                            <p>Users can instantly view their scores, total marks, percentage, and overall performance.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card feature-card p-4 text-center">
                            <div class="feature-icon">🏆</div>
                            <h5>Leaderboard</h5>
                            <p>Track top performers and compare results across different quizzes and participants.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5 bg-light">
            <div class="container">
                <h2 class="section-title">How It Works</h2>
                <div class="row g-4">
                    <div class="col-md-3">
                        <div class="how-step">
                            <div class="how-step-number">1</div>
                            <h5>Register</h5>
                            <p>Create your account as a student and get access to the platform.</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="how-step">
                            <div class="how-step-number">2</div>
                            <h5>Login</h5>
                            <p>Login using your email and password to access available quizzes.</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="how-step">
                            <div class="how-step-number">3</div>
                            <h5>Take Quiz</h5>
                            <p>Attempt quiz questions and submit your answers securely.</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="how-step">
                            <div class="how-step-number">4</div>
                            <h5>Get Result</h5>
                            <p>View your score, percentage, and leaderboard ranking instantly.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5">
            <div class="container">
                <h2 class="section-title">Quick Access</h2>
                <div class="quick-access text-center">
                    <a href="Admin/AdminLogin.aspx" class="btn btn-primary btn-custom m-2">Admin Login</a>
                    <a href="User/UserLogin.aspx" class="btn btn-success btn-custom m-2">User Login</a>
                    <a href="User/UserRegister.aspx" class="btn btn-warning btn-custom m-2">User Register</a>
                    <a href="#" class="btn btn-dark btn-custom m-2">Leaderboard</a>
                </div>
            </div>
        </section>

        <section class="py-5 bg-light" id="aboutSection">
            <div class="container">
                <h2 class="section-title">About This Project</h2>
                <div class="about-box">
                    <p>
                        <strong>OnlineQuizApp</strong> is a professional web-based quiz management system designed to simplify quiz creation, participation, and performance tracking.
                        This project is built as an academic and practical learning solution for managing online assessments efficiently.
                    </p>
                    <p>
                        <strong>Technologies Used:</strong> ASP.NET Web Forms, C#, SQL Server, Stored Procedures, ADO.NET, Bootstrap.
                    </p>
                    <p>
                        <strong>Project Purpose:</strong> To provide a structured platform for administrators to manage quizzes and for students to register, login, attempt quizzes, and view results.
                    </p>
                </div>
            </div>
        </section>

        <footer class="footer">
            <div class="container">
                <p class="mb-1">© 2026 OnlineQuizApp. All Rights Reserved.</p>
                <p class="mb-0">Developed by Khitish Ranjan Jena And Deepali Priyadarshini Rout| MCA Project</p>
            </div>
        </footer>

    </form>

    <script src="Scripts/jquery-3.7.0.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</body>
</html>