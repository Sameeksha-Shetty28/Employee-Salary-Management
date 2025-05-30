<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Employee" %>
<%
    List<Employee> result = (List<Employee>) request.getAttribute("result");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Report Results - Empayx Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            min-height: 100vh;
            background:
                linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
                url('https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80')
                no-repeat center center fixed;
            background-size: cover;
            color: #e0e0e0;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px 20px;
            box-sizing: border-box;
        }
        h2 {
            margin-bottom: 30px;
            font-weight: 600;
            font-size: 2rem;
            color: #f5f5f5;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.7);
        }
        table {
            border-collapse: collapse;
            width: 90%;
            max-width: 1000px;
            background: rgba(255, 255, 255, 0.12);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(6px);
            -webkit-backdrop-filter: blur(6px);
        }
        th, td {
            padding: 14px 18px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            text-align: center;
            color: #e0e0e0;
            font-weight: 500;
        }
        th {
            background-color: rgba(31, 31, 31, 0.7);
            font-weight: 600;
        }
        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.05);
        }
        p {
            font-size: 1.2rem;
            font-weight: 500;
            margin: 30px 0;
            color: #ccc;
            text-shadow: 0 0 5px rgba(0,0,0,0.5);
        }
        .links {
            margin-top: 30px;
        }
        .links a {
            color: #ccc;
            margin: 10px 15px;
            text-decoration: none;
            font-weight: 600;
            font-size: 1rem;
            transition: color 0.3s ease;
        }
        .links a:hover {
            color: #ffffff;
        }
    </style>
</head>
<body>
    <h2>Report Results</h2>

    <% if (result == null || result.isEmpty()) { %>
        <p>No records found matching criteria.</p>
    <% } else { %>
        <table>
            <tr>
                <th>Emp No</th>
                <th>Name</th>
                <th>Date of Joining</th>
                <th>Gender</th>
                <th>Basic Salary</th>
            </tr>
            <% for (Employee e : result) { %>
                <tr>
                    <td><%= e.getEmpno() %></td>
                    <td><%= e.getEmpName() %></td>
                    <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(e.getDoj()) %></td>
                    <td><%= e.getGender() %></td>
                    <td><%= e.getBsalary() %></td>
                </tr>
            <% } %>
        </table>
    <% } %>

    <div class="links">
        <a href="reports.jsp">← Back to Reports</a>
        <a href="index.jsp">← Back to Home</a>
    </div>
</body>
</html>
