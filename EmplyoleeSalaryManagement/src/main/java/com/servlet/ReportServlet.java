package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
    private EmployeeDAO dao = new EmployeeDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reportType = request.getParameter("reportType");
        try {
            List<Employee> result = null;
            switch (reportType) {
                case "name":
                    String letterParam = request.getParameter("letter");
                    if (letterParam != null && letterParam.length() > 0) {
                        char letter = letterParam.charAt(0);
                        result = dao.getEmployeesByStartingLetter(letter);
                    }
                    break;
                case "service":
                    int years = Integer.parseInt(request.getParameter("years"));
                    result = dao.getEmployeesByYearsOfService(years);
                    break;
                case "salary":
                    double salary = Double.parseDouble(request.getParameter("salary"));
                    result = dao.getEmployeesBySalary(salary);
                    break;
                default:
                    result = null;
            }
            request.setAttribute("result", result);
            request.getRequestDispatcher("report_result.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
