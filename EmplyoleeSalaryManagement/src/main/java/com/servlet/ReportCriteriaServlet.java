package com.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/ReportCriteriaServlet")
public class ReportCriteriaServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reportType = request.getParameter("reportType");
        request.setAttribute("reportType", reportType);

        switch (reportType) {
            case "name":
                request.getRequestDispatcher("report_form.jsp").forward(request, response);
                break;
            case "service":
                request.getRequestDispatcher("report_form.jsp").forward(request, response);
                break;
            case "salary":
                request.getRequestDispatcher("report_form.jsp").forward(request, response);
                break;
            default:
                response.sendRedirect("reports.jsp");
        }
    }
}
