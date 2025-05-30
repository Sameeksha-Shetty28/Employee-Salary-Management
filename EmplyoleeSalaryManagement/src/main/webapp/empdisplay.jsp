<%@ page import="com.dao.EmployeeDAO,com.model.Employee" %> 
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee List - Empayx Portal</title>
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
            min-height: 100vh;
            box-sizing: border-box;
        }
        .table-container {
            background: rgba(255,255,255,0.12);
            padding: 30px;
            border-radius: 12px;
            width: 100%;
            max-width: 1000px;
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            color: #f0f0f0;
        }
        th, td {
            padding: 12px 16px;
            text-align: left;
            border-bottom: 1px solid rgba(255,255,255,0.2);
        }
        th {
            background-color: rgba(0,0,0,0.6);
            color: #ffffff;
            font-weight: 600;
        }
        tr:nth-child(even) {
            background-color: rgba(255,255,255,0.05);
        }
        tr:hover {
            background-color: rgba(255,255,255,0.08);
        }
        .button-container {
            margin-top: 30px;
            text-align: center;
        }
        .btn {
            padding: 12px 22px;
            font-size: 1rem;
            background-color: #1f1f1f;
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            margin: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.6);
            transition: background-color 0.3s ease;
        }
        .btn:hover {
            background-color: #444444;
        }
        a {
            text-decoration: none;
            color: inherit;
        }
    </style>
</head>
<body>

<div class="table-container">
    <h2>Employee List</h2>

    <%
        EmployeeDAO dao = new EmployeeDAO();
        List<Employee> list = dao.getAllEmployees();
    %>

    <table>
        <tr>
            <th>Empno</th>
            <th>Name</th>
            <th>Date of Joining</th>
            <th>Gender</th>
            <th>Basic Salary</th>
        </tr>
        <% for(Employee e : list) { %>
        <tr>
            <td><%= e.getEmpno() %></td>
            <td><%= e.getEmpName() %></td>
            <td><%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(e.getDoj()) %></td>
            <td><%= e.getGender() %></td>
            <td><%= e.getBsalary() %></td>
        </tr>
        <% } %>
        <% if (list == null || list.isEmpty()) { %>
        <tr>
            <td colspan="5" style="text-align:center; color: #ff6b6b;">No employee records found.</td>
        </tr>
        <% } %>
    </table>

    <div class="button-container">
        <form action="empadd.jsp" method="get" style="display:inline;">
            <button type="submit" class="btn">Add Another Employee</button>
        </form>
        <form action="index.jsp" method="get" style="display:inline;">
            <button type="submit" class="btn">Go Back to Home</button>
        </form>
    </div>
</div>

</body>
</html>
