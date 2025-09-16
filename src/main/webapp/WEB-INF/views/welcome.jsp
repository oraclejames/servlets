<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>SVS Tutorials - CRUD Demo</title>
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
        .container {
            margin: 50px auto;
            max-width: 600px;
            text-align: center;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .container h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .crud-btn {
            display: inline-block;
            margin: 10px;
            padding: 15px 30px;
            font-size: 16px;
            text-decoration: none;
            color: white;
            background: #0066cc;
            border-radius: 5px;
            transition: 0.3s;
        }
        .crud-btn:hover {
            background: #003366;
        }
    </style>
</head>
<body>

    <!-- Banner -->
    <header>
        <h1>SVS Tutorials</h1>
        <p>Servlet CRUD Demo (Tomcat 9 + JSP)</p>
    </header>

    <!-- CRUD Menu -->
    <div class="container">
        <h2>Choose CRUD Operation</h2>
        <a href="create" class="crud-btn">Create</a>
        <a href="list" class="crud-btn">Read</a>
        <a href="update" class="crud-btn">Update</a>
        <a href="delete" class="crud-btn">Delete</a>
    </div>

</body>
</html>
