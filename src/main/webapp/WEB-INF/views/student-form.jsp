<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>SVS Tutorials - Student Form</title>
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
            max-width: 600px;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .container h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 6px;
            color: #333;
        }
        input[type="text"], input[type="email"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-sizing: border-box;
        }
        input[type="submit"], .back-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 25px;
            font-size: 16px;
            text-decoration: none;
            color: white;
            background: #0066cc;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }
        input[type="submit"]:hover, .back-btn:hover {
            background: #003366;
        }
        .back-btn {
            margin-left: 15px;
        }
         .error {
            color: red;       /* Text in red */
            font-weight: bold; /* Optional: make it bold */
            margin-bottom: 10px; /* Optional spacing */
        }
    </style>
</head>
<body>

    <!-- Banner -->
    <header>
        <h1>SVS Tutorials</h1>
        <p>Servlet CRUD Demo (Tomcat 9 + JSP)</p>
    </header>
<!-- Display error message if exists -->
    <c:if test="${not empty errorMessage}">
        <div class="error">${errorMessage}</div>
    </c:if>
    <!-- Form Container -->
    
    <div class="container">
        <h2>
            <c:if test="${student != null}">Edit Student</c:if>
            <c:if test="${student == null}">Add New Student</c:if>  
        </h2>
        
        <form action="${student == null ? 'insert' : 'update'}" method="post">
            <c:if test="${student != null}">
                <input type="hidden" name="id" value="${student.id}"/>
            </c:if>

            <div class="form-group">
                <label>Name:</label>
                <input type="text" name="name" value="${student.name}" required/>
            </div>
            
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" value="${student.email}" required/>
            </div>

            <div class="form-group">
                <label>Course:</label>
                <input type="text" name="course" value="${student.course}" required/>
            </div>

            <div class="form-group">
                <label>Country:</label>
                <input type="text" name="country" value="${student.country}" required/>
            </div>

            <input type="submit" value="Save"/>
            <a href="list" class="back-btn">Back</a>
        </form>
    </div>

</body>
</html>
