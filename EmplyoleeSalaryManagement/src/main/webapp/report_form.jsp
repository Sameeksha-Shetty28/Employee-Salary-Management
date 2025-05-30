<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="jakarta.servlet.*,jakarta.servlet.http.*" %>
<%
    String reportType = (String) request.getAttribute("reportType");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Report Criteria - Empayx Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            height: 100vh;
            background:
                linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
                url('https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')
                no-repeat center center fixed;
            background-size: cover;
            color: #e0e0e0;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .form-container {
            background: rgba(255,255,255,0.12);
            padding: 40px 50px;
            border-radius: 12px;
            max-width: 450px;
            width: 100%;
            box-shadow: 0 8px 20px rgba(0,0,0,0.5);
            border: 1px solid rgba(255,255,255,0.2);
            backdrop-filter: blur(6px);
            -webkit-backdrop-filter: blur(6px);
            text-align: center;
        }
        h2 {
            margin-bottom: 25px;
            font-size: 2rem;
            font-weight: 600;
            color: #f5f5f5;
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: 600;
            text-align: left;
            color: #ddd;
        }
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background-color: #1f1f1f;
            color: #ffffff;
            font-size: 1rem;
            margin-bottom: 20px;
            box-sizing: border-box;
        }
        input:focus {
            outline: none;
            background-color: #2a2a2a;
        }
        .submit-btn {
            background-color: #1f1f1f;
            color: #fff;
            font-weight: 700;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1.1rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.6);
            transition: background-color 0.3s ease;
        }
        .submit-btn:hover {
            background-color: #444444;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            text-decoration: none;
            font-weight: 500;
            color: #ccc;
            transition: color 0.3s ease;
            font-size: 0.95rem;
        }
        .back-link:hover {
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Enter Report Criteria</h2>
        <form action="ReportServlet" method="post">
            <input type="hidden" name="reportType" value="<%= reportType %>">

            <% if ("name".equals(reportType)) { %>
                <label>Enter starting letter:</label>
                <input type="text" name="letter" maxlength="1" required>
            <% } else if ("service".equals(reportType)) { %>
                <label>Enter minimum years of service:</label>
                <input type="number" name="years" min="0" required>
            <% } else if ("salary".equals(reportType)) { %>
                <label>Enter minimum salary:</label>
                <input type="number" step="0.01" name="salary" min="0" required>
            <% } %>

            <input type="submit" value="Show Report" class="submit-btn">
        </form>
        <a href="reports.jsp" class="back-link">← Back to Reports</a>
        <a href="index.jsp" class="back-link">← Back to Home</a>
    </div>
</body>
</html>
