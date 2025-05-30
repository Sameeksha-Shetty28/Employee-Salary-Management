<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Employee - Empayx Portal</title>
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
            max-width: 400px;
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
        input[type="number"] {
            width: 100%;
            padding: 10px 14px;
            border: none;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.15);
            color: #fff;
            font-size: 1rem;
            margin-bottom: 20px;
        }
        input[type="number"]:focus {
            outline: none;
            background: rgba(255, 255, 255, 0.25);
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
        <h2>Delete Employee</h2>
        <form action="DeleteEmployeeServlet" method="post">
            <label for="empno">Employee ID </label>
            <input type="number" name="empno" id="empno" required>

            <input type="submit" value="Delete Employee" class="submit-btn">
        </form>
        <a href="index.jsp" class="back-link">← Back to Home</a>
    </div>
</body>
</html>
