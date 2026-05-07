<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewResults.aspx.cs" Inherits="OnlineQuizApp.User.ViewResults" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Results - OnlineQuizApp</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container-box {
            width: 1100px;
            margin: 40px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        .page-title {
            text-align: center;
            margin-bottom: 25px;
            font-weight: bold;
        }

        .back-link {
            margin-top: 20px;
            text-align: center;
        }

        .table td, .table th {
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-box">
            <h2 class="page-title">My Quiz Results</h2>

            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger d-block text-center mb-3"></asp:Label>

            <asp:GridView ID="gvResults" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" EmptyDataText="No results found.">
                <Columns>
                    <asp:BoundField DataField="ResultId" HeaderText="Result ID" />
                    <asp:BoundField DataField="QuizTitle" HeaderText="Quiz Title" />
                    <asp:BoundField DataField="Score" HeaderText="Score" />
                    <asp:BoundField DataField="TotalMarks" HeaderText="Total Marks" />
                    <asp:BoundField DataField="AttemptDate" HeaderText="Attempt Date" DataFormatString="{0:dd-MM-yyyy hh:mm tt}" />
                </Columns>
            </asp:GridView>

            <div class="back-link">
                <a href="UserDashboard.aspx" class="btn btn-secondary">Back to Dashboard</a>
            </div>
        </div>
    </form>
</body>
</html>