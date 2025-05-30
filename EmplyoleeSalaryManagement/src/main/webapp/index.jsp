<!DOCTYPE html>
<html>
<head>
    <title>Employee Management Home - Empayx Portal</title>
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
            text-align: center;
        }
        .container {
            background: rgba(255, 255, 255, 0.12);
            padding: 40px 50px;
            border-radius: 12px;
            max-width: 400px;
            width: 100%;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
            border: 1px solid rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(6px);
            -webkit-backdrop-filter: blur(6px);
        }
        h2 {
            font-weight: 600;
            font-size: 2rem;
            margin-bottom: 30px;
            color: #f5f5f5;
            letter-spacing: 0.7px;
        }
        ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        ul li {
            margin: 14px 0;
        }
        ul li a {
            display: block;
            padding: 14px 0;
            background-color: #1f1f1f;
            color: #f0f0f0;
            font-weight: 600;
            border-radius: 8px;
            text-decoration: none;
            font-size: 1.1rem;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.6);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
        }
        ul li a:hover, ul li a:focus {
            background-color: #2b2b2b;
            box-shadow: 0 6px 18px rgba(43, 43, 43, 0.7);
            outline: none;
        }
        @media (max-width: 480px) {
            .container {
                padding: 30px 25px;
                max-width: 90vw;
            }
            h2 {
                font-size: 1.6rem;
            }
            ul li a {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome to Empayx Portal</h2>
        <ul>
            <li><a href="empadd.jsp">Add Employee</a></li>
            <li><a href="empupdate.jsp">Update Employee</a></li>
            <li><a href="empdelete.jsp">Delete Employee</a></li>
            <li><a href="empdisplay.jsp">Display Employee</a></li>
            <li><a href="reports.jsp">Reports</a></li>
        </ul>
    </div>
</body>
</html>
