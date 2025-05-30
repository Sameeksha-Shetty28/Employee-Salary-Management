package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.model.Employee;

public class EmployeeDAO {

    private final String jdbcURL = "jdbc:mysql://localhost:3306/employee_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private final String jdbcUsername = "root";         // change to your MySQL username
    private final String jdbcPassword = ""; // change to your MySQL password

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");  // Load MySQL JDBC driver explicitly
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // Add employee
    public boolean addEmployee(Employee emp) {
        String sql = "INSERT INTO Employee (Empno, EmpName, DoJ, Gender, Bsalary) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setInt(1, emp.getEmpno());
            pst.setString(2, emp.getEmpName());
            pst.setDate(3, new java.sql.Date(emp.getDoj().getTime()));
            pst.setString(4, emp.getGender());
            pst.setDouble(5, emp.getBsalary());

            int row = pst.executeUpdate();
            return row > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update employee
    public boolean updateEmployee(Employee emp) {
        String sql = "UPDATE Employee SET EmpName=?, DoJ=?, Gender=?, Bsalary=? WHERE Empno=?";
        try (Connection conn = getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setString(1, emp.getEmpName());
            pst.setDate(2, new java.sql.Date(emp.getDoj().getTime()));
            pst.setString(3, emp.getGender());
            pst.setDouble(4, emp.getBsalary());
            pst.setInt(5, emp.getEmpno());

            int row = pst.executeUpdate();
            return row > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete employee
    public boolean deleteEmployee(int empno) {
        String sql = "DELETE FROM Employee WHERE Empno=?";
        try (Connection conn = getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setInt(1, empno);
            int row = pst.executeUpdate();
            return row > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get employee by Empno
    public Employee getEmployeeById(int empno) {
        String sql = "SELECT * FROM Employee WHERE Empno=?";
        try (Connection conn = getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setInt(1, empno);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                Employee emp = new Employee();
                emp.setEmpno(rs.getInt("Empno"));
                emp.setEmpName(rs.getString("EmpName"));
                emp.setDoj(rs.getDate("DoJ"));
                emp.setGender(rs.getString("Gender"));
                emp.setBsalary(rs.getDouble("Bsalary"));
                return emp;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get all employees
    public List<Employee> getAllEmployees() {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM Employee";
        try (Connection conn = getConnection();
             PreparedStatement pst = conn.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                Employee emp = new Employee();
                emp.setEmpno(rs.getInt("Empno"));
                emp.setEmpName(rs.getString("EmpName"));
                emp.setDoj(rs.getDate("DoJ"));
                emp.setGender(rs.getString("Gender"));
                emp.setBsalary(rs.getDouble("Bsalary"));
                list.add(emp);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Report 1: Employees whose names start with a specific letter
    public List<Employee> getEmployeesByStartingLetter(char letter) {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM Employee WHERE EmpName LIKE ?";
        try (Connection conn = getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setString(1, letter + "%");
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Employee emp = new Employee();
                emp.setEmpno(rs.getInt("Empno"));
                emp.setEmpName(rs.getString("EmpName"));
                emp.setDoj(rs.getDate("DoJ"));
                emp.setGender(rs.getString("Gender"));
                emp.setBsalary(rs.getDouble("Bsalary"));
                list.add(emp);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Report 2: Employees with N or more years of service
    public List<Employee> getEmployeesByYearsOfService(int years) {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM Employee WHERE DoJ <= DATE_SUB(CURDATE(), INTERVAL ? YEAR)";
        try (Connection conn = getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setInt(1, years);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Employee emp = new Employee();
                emp.setEmpno(rs.getInt("Empno"));
                emp.setEmpName(rs.getString("EmpName"));
                emp.setDoj(rs.getDate("DoJ"));
                emp.setGender(rs.getString("Gender"));
                emp.setBsalary(rs.getDouble("Bsalary"));
                list.add(emp);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Report 3: Employees earning more than specified salary
    public List<Employee> getEmployeesBySalary(double salary) {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM Employee WHERE Bsalary > ?";
        try (Connection conn = getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setDouble(1, salary);
            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Employee emp = new Employee();
                emp.setEmpno(rs.getInt("Empno"));
                emp.setEmpName(rs.getString("EmpName"));
                emp.setDoj(rs.getDate("DoJ"));
                emp.setGender(rs.getString("Gender"));
                emp.setBsalary(rs.getDouble("Bsalary"));
                list.add(emp);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return list;
    }
}
