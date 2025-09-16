<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SVS Tutorials - Welcome</title>
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
    .link-btn {
        display: inline-block;
        margin-top: 20px;
        padding: 15px 30px;
        font-size: 16px;
        text-decoration: none;
        color: white;
        background: #0066cc;
        border-radius: 5px;
        transition: 0.3s;
    }
    .link-btn:hover {
        background: #003366;
    }
</style>
</head>
<body>

    <!-- Banner -->
    <header>
        <h1>SVS Tutorials</h1>
        <p>Welcome to Student Management</p>
    </header>

    <!-- Content Container -->
    <div class="container">
        <h2>Welcome Hindu College Student Records.</h2>
        <p>Click the button below to view all student information.</p>
        <a href="/servletWelcomController/welcom" class="link-btn">View Student Records</a>  <a href="/servletWelcomController/interview" class="link-btn">Interview Questions</a>
    </div>

</body>
</html>
