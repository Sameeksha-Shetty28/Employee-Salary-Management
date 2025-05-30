package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private EmployeeDAO dao = new EmployeeDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Read parameters
            int empno = Integer.parseInt(request.getParameter("empno"));
            String empName = request.getParameter("empName");
            Date doj = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("doj"));
            String gender = request.getParameter("gender");
            double bsalary = Double.parseDouble(request.getParameter("bsalary"));

            // Debug print to server logs
            System.out.println("Received employee: " + empno + ", " + empName + ", " + doj + ", " + gender + ", " + bsalary);

            // Create Employee object
            Employee emp = new Employee(empno, empName, doj, gender, bsalary);

            // Insert into database and check result
            boolean inserted = dao.addEmployee(emp);
            if (inserted) {
                System.out.println("Employee added successfully.");
                response.sendRedirect("empdisplay.jsp");
            } else {
                System.out.println("Failed to add employee. Possible DB error.");
                request.setAttribute("errorMessage", "Failed to add employee. Please check input or try again.");
                request.getRequestDispatcher("empadd.jsp").forward(request, response);
            }

        } catch (Exception e) {
            // Print detailed error to server logs
            e.printStackTrace();

            // Display error to user
            request.setAttribute("errorMessage", "Error: " + e.getMessage());
            request.getRequestDispatcher("empadd.jsp").forward(request, response);
        }
    }
}
