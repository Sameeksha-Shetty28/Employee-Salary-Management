<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Reports - Empayx Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
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
            height: 100vh;
            box-sizing: border-box;
        }
        .form-container {
            background: rgba(255,255,255,0.12);
            padding: 40px;
            border-radius: 12px;
            max-width: 500px;
            width: 100%;
            box-shadow: 0 8px 20px rgba(0,0,0,0.5);
            border: 1px solid rgba(255,255,255,0.2);
            backdrop-filter: blur(6px);
            -webkit-backdrop-filter: blur(6px);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 2rem;
            font-weight: 500;
            color: #fff;
        }
        label {
            font-weight: 600;
            display: block;
            margin-top: 20px;
            color: #e0e0e0;
        }
        select {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: none;
            background-color: #1f1f1f;
            color: #ffffff;
            font-size: 1rem;
            margin-top: 8px;
            appearance: none;
            cursor: pointer;
        }
        option {
            background-color: #1f1f1f;
            color: #ffffff;
        }
        input[type="submit"] {
            margin-top: 30px;
            padding: 12px;
            width: 100%;
            background-color: #1f1f1f;
            color: #f0f0f0;
            font-weight: 700;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #444444;
        }
        .back-link {
            display: block;
            margin-top: 20px;
            text-align: center;
            color: #ccc;
            text-decoration: none;
            font-size: 0.95rem;
        }
        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Employee Reports</h2>
        <form action="ReportCriteriaServlet" method="post">
            <label for="reportType">Select Report Type:</label>
            <select name="reportType" id="reportType" required>
                <option value="" disabled selected>Select a report</option>
                <option value="name">Employees whose names start with a specific letter</option>
                <option value="service">Employees with N or more years of service</option>
                <option value="salary">Employees earning more than a specified salary</option>
            </select>
            <input type="submit" value="Proceed">
        </form>
        <a href="index.jsp" class="back-link">← Back to Home</a>
    </div>
</body>
</html>
