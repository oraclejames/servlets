package servletWelcomController.dao;


import java.sql.*;
import java.util.*;

import servletWelcomController.model.Student;

public class StudentDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/studentdb?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "admin";

    private static final String INSERT_STUDENT = "INSERT INTO student (name,email,course,country) VALUES (?, ?, ?, ?)";
    private static final String SELECT_STUDENT_BY_ID = "SELECT id,name,email,course,country FROM student WHERE id=?";
    private static final String SELECT_ALL_STUDENTS = "SELECT * FROM student";
    private static final String DELETE_STUDENT = "DELETE FROM student WHERE id=?";
    private static final String UPDATE_STUDENT = "UPDATE student SET name=?, email=?, course=?, country=? WHERE id=?";
    private static final String SELECT_STUDENT_BY_EMAIL = "SELECT * FROM student WHERE email = ?";
    
    protected Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void insertStudent(Student student) throws SQLException {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_STUDENT)) {
            ps.setString(1, student.getName());
            ps.setString(2, student.getEmail());
            ps.setString(3, student.getCourse());
            ps.setString(4, student.getCountry());
            ps.executeUpdate();
        }
    }

    public Student selectStudent(int id) throws SQLException {
        Student student = null;
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_STUDENT_BY_ID)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                student = new Student(
                    id,
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("course"),
                    rs.getString("country")
                );
            }
        }
        return student;
    }

    public List<Student> selectAllStudents() throws SQLException {
        List<Student> students = new ArrayList<>();
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_ALL_STUDENTS)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                students.add(new Student(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("course"),
                    rs.getString("country")
                ));
            }
        }
        return students;
    }

    public boolean deleteStudent(int id) throws SQLException {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(DELETE_STUDENT)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }

    public boolean updateStudent(Student student) throws SQLException {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(UPDATE_STUDENT)) {
            ps.setString(1, student.getName());
            ps.setString(2, student.getEmail());
            ps.setString(3, student.getCourse());
            ps.setString(4, student.getCountry());
            ps.setInt(5, student.getId());
            return ps.executeUpdate() > 0;
        }
    }
    
    public boolean isEmailExist(String email) throws SQLException {
        boolean exist = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_STUDENT_BY_EMAIL)) {
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                exist = true;
            }
        }
        return exist;
    }
    
}

