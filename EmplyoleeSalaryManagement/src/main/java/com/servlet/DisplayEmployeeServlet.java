package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/DisplayEmployeeServlet")
public class DisplayEmployeeServlet extends HttpServlet {
    private EmployeeDAO dao = new EmployeeDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> empList = dao.getAllEmployees();
        request.setAttribute("employeeList", empList);
        request.getRequestDispatcher("empdisplay.jsp").forward(request, response);
    }
}
