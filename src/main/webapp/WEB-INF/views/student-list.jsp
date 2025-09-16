<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>SVS Tutorials - Student List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f4f4;
        }
        header {
            background: linear-gradient(to right, #0066cc, #003366);
            color: white;
            text-align: center;
            padding: 40px;
        }
        header h1 {
            margin: 0;
            font-size: 36px;
            letter-spacing: 2px;
        }
        header p {
            margin: 5px 0 0;
            font-size: 18px;
        }
        .container {
            margin: 50px auto;
            max-width: 900px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        h2 {
            margin-bottom: 20px;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #0066cc;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .action-btn, .add-btn {
            padding: 8px 15px;
            text-decoration: none;
            color: white;
            border-radius: 5px;
            transition: 0.3s;
        }
        .action-btn {
            background: #0066cc;
            margin: 0 3px;
        }
        .action-btn:hover {
            background: #003366;
        }
        .add-btn {
            background: #28a745;
            margin-bottom: 15px;
            display: inline-block;
        }
        .add-btn:hover {
            background: #1e7e34;
        }
    </style>
</head>
<body>

    <!-- Banner -->
    <header>
        <h1>SVS Tutorials</h1>
        <p>Servlet CRUD Demo (Tomcat 9 + JSP)</p>
    </header>

    <div class="container">
        <h2>List of Students</h2>

        <a href="new" class="add-btn">Add New Student</a> <a href="/servletWelcomController" class="add-btn">Home </a>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Course</th>
                <th>Country</th>
                <th>Actions</th>
            </tr>

            <c:forEach var="student" items="${listStudent}">
                <tr>
                    <td>${student.id}</td>
                    <td>${student.name}</td>
                    <td>${student.email}</td>
                    <td>${student.course}</td>
                    <td>${student.country}</td>
                    <td>
                        <a href="edit?id=${student.id}" class="action-btn">Edit</a>
                        <a href="delete?id=${student.id}" class="action-btn" onclick="return confirm('Are you sure?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

</body>
</html>
