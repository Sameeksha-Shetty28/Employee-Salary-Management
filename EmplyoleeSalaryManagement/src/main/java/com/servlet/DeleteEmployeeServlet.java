package com.servlet;

import com.dao.EmployeeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {
    private EmployeeDAO dao = new EmployeeDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int empno = Integer.parseInt(request.getParameter("empno"));
            dao.deleteEmployee(empno);
            response.sendRedirect("empdisplay.jsp");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
