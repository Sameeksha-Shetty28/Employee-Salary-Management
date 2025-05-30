package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {
    private EmployeeDAO dao = new EmployeeDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int empno = Integer.parseInt(request.getParameter("empno"));
            String empName = request.getParameter("empName");
            Date doj = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("doj"));
            String gender = request.getParameter("gender");
            double bsalary = Double.parseDouble(request.getParameter("bsalary"));

            Employee emp = new Employee(empno, empName, doj, gender, bsalary);
            dao.updateEmployee(emp);
            response.sendRedirect("empdisplay.jsp");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
