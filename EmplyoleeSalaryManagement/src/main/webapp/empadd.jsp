<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Employee - Empayx Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            height: 100vh;
            background:
                linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
                url('https://images.unsplash.com/photo-1519389950473-47ba0277781c?auto=format&fit=crop&w=1470&q=80')
                no-repeat center center fixed;
            background-size: cover;
            color: #e0e0e0;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        .form-container {
            background: rgba(255, 255, 255, 0.12);
            padding: 40px;
            border-radius: 12px;
            max-width: 450px;
            width: 100%;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
            border: 1px solid rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(6px);
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 1.8rem;
            font-weight: 600;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
        }
        input, select {
            width: 100%;
            padding: 10px 14px;
            border: none;
            border-radius: 8px;
            background: rgba(0, 0, 0, 0.7); /* dark background */
            color: #ccc; /* lighter grey text */
            font-size: 1rem;
            margin-bottom: 18px;
        }
        input:focus, select:focus {
            outline: none;
            background: rgba(50, 50, 50, 0.85);
            color: #fff;
        }
        select option {
            background-color: #1f1f1f;
            color: #ccc;
        }
        select option:hover {
            background-color: #333;
            color: #fff;
        }
        .submit-btn {
            background-color: #1f1f1f;
            color: #fff;
            font-weight: 600;
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
            background-color: #2b2b2b;
        }
        .error-msg {
            color: #ff6b6b;
            background-color: rgba(255, 0, 0, 0.1);
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 8px;
            text-align: center;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            font-weight: 500;
            color: #ccc;
            transition: color 0.3s ease;
        }
        .back-link:hover {
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Add New Employee</h2>

        <% String error = (String) request.getAttribute("errorMessage"); %>
        <% if (error != null) { %>
            <div class="error-msg"><%= error %></div>
        <% } %>

        <form action="AddEmployeeServlet" method="post">
            <label for="empno">Employee ID</label>
            <input type="number" name="empno" id="empno" required>

            <label for="empName">Employee Name</label>
            <input type="text" name="empName" id="empName" required>

            <label for="doj">Date of Joining</label>
            <input type="date" name="doj" id="doj" required>

            <label for="gender">Gender</label>
            <select name="gender" id="gender" required>
                <option value="" disabled selected>--Select Gender--</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>

            <label for="bsalary">Basic Salary</label>
            <input type="number" step="0.01" name="bsalary" id="bsalary" required>

            <button type="submit" class="submit-btn">Add Employee</button>
        </form>

        <a href="index.jsp" class="back-link">← Back to Home</a>
    </div>
</body>
</html>
