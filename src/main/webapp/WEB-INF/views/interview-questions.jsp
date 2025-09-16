<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Servlet Interview Questions - SVS Tutorials</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('banner.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            color: #333;
        }
        header {
            background: rgba(0, 0, 0, 0.6);
            color: #fff;
            padding: 20px;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            letter-spacing: 2px;
        }
        .container {
            width: 80%;
            margin: 30px auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0px 4px 8px rgba(0,0,0,0.2);
        }
        details {
            margin-bottom: 15px;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background: #f9f9f9;
        }
        summary {
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
        }
        code, pre {
            background: #272822;
            color: #f8f8f2;
            padding: 8px;
            display: block;
            border-radius: 5px;
            overflow-x: auto;
            margin-top: 8px;
        }
    </style>
</head>
<body>
    <header>🔥 SVS Tutorials – Servlet Interview Questions</header>

    <div class="container">
        <!-- Question 1 -->
        <details>
            <summary>Q1. What is a Servlet?</summary>
            <p>A Servlet is a Java class that runs on a server, handles requests and responses, and generates dynamic web content.</p>
            <pre><code>
@WebServlet("/hello")
public class HelloServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        resp.getWriter().println("Hello, Servlet!");
    }
}
            </code></pre>
        </details>

        <!-- Question 2 -->
        <details>
            <summary>Q2. What is the lifecycle of a Servlet?</summary>
            <p>Lifecycle methods:</p>
            <ul>
                <li><b>init()</b> → Called once when servlet is loaded.</li>
                <li><b>service()</b> → Called for every request.</li>
                <li><b>destroy()</b> → Called when servlet is removed.</li>
            </ul>
        </details>

        <!-- Question 3 -->
        <details>
            <summary>Q3. Difference between Servlet and CGI?</summary>
            <p>
                <b>CGI:</b> Creates a new process per request (slow).<br>
                <b>Servlet:</b> Multi-threaded, runs inside JVM (fast).
            </p>
        </details>

        <!-- Question 4 -->
        <details>
            <summary>Q4. What are Filters in Servlets?</summary>
            <p>Filters intercept requests before reaching servlets or JSP. Commonly used for authentication, logging, compression.</p>
            <pre><code>
@WebFilter("/*")
public class AuthFilter implements Filter {
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {
        System.out.println("Request intercepted");
        chain.doFilter(req, res);
    }
}
            </code></pre>
        </details>

        <!-- Question 5 -->
        <details>
            <summary>Q5. How do you manage sessions in Servlets?</summary>
            <p>Using <code>HttpSession</code> object:</p>
            <pre><code>
HttpSession session = request.getSession();
session.setAttribute("user", "John Doe");
String name = (String) session.getAttribute("user");
            </code></pre>
        </details>

        <!-- Question 6 -->
        <details>
            <summary>Q6. Difference between forward() and sendRedirect()?</summary>
            <ul>
                <li><b>forward()</b>: Server-side, URL not changed, faster.</li>
                <li><b>sendRedirect()</b>: Client-side, URL changes, slower but flexible.</li>
            </ul>
        </details>

        <!-- Question 7 -->
        <details>
            <summary>Q7. What is ServletConfig vs ServletContext?</summary>
            <p>
                <b>ServletConfig:</b> Config for one servlet (init params).<br>
                <b>ServletContext:</b> Shared config for entire app.
            </p>
        </details>

        <!-- Question 8 -->
        <details>
            <summary>Q8. Example of file upload in Servlets?</summary>
            <pre><code>
@WebServlet("/upload")
@MultipartConfig
public class UploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        Part filePart = request.getPart("file");
        filePart.write("D:/uploads/" + filePart.getSubmittedFileName());
    }
}
            </code></pre>
        </details>

        <!-- Question 9 -->
        <details>
            <summary>Q9. How do you secure Servlets?</summary>
            <ul>
                <li>Use HTTPS</li>
                <li>Validate inputs</li>
                <li>Use session timeout</li>
                <li>Role-based access in <code>web.xml</code></li>
            </ul>
        </details>

        <!-- Question 10 -->
        <details>
            <summary>Q10. What are Servlet Listeners?</summary>
            <p>Listeners monitor events in a servlet context, session, or request.</p>
            <pre><code>
@WebListener
public class SessionListener implements HttpSessionListener {
    public void sessionCreated(HttpSessionEvent se) {
        System.out.println("Session created: " + se.getSession().getId());
    }
}
            </code></pre>
        </details>

        <!-- Add More (You can repeat until Q100) -->
                <!-- Question 11 -->
        <details>
            <summary>Q11. Difference between GenericServlet and HttpServlet?</summary>
            <ul>
                <li><b>GenericServlet:</b> Protocol independent (abstract class).</li>
                <li><b>HttpServlet:</b> Extends GenericServlet, specific for HTTP protocol.</li>
            </ul>
        </details>

        <!-- Question 12 -->
        <details>
            <summary>Q12. What is the difference between GET and POST?</summary>
            <p>
                <b>GET:</b> Data appended in URL, limited length, not secure.<br>
                <b>POST:</b> Data in request body, no length limit, more secure.
            </p>
        </details>

        <!-- Question 13 -->
        <details>
            <summary>Q13. How to handle exceptions in Servlets?</summary>
            <p>By defining error pages in <code>web.xml</code>:</p>
            <pre><code>
<error-page>
   <exception-type>java.lang.Exception</exception-type>
   <location>/error.jsp</location>
</error-page>
            </code></pre>
        </details>

        <!-- Question 14 -->
        <details>
            <summary>Q14. What is URL Rewriting?</summary>
            <p>Appending session ID to the URL when cookies are disabled.</p>
            <pre><code>
String url = response.encodeURL("dashboard");
            </code></pre>
        </details>

        <!-- Question 15 -->
        <details>
            <summary>Q15. Difference between Cookies and HttpSession?</summary>
            <ul>
                <li><b>Cookies:</b> Stored on client-side, less secure.</li>
                <li><b>HttpSession:</b> Stored on server-side, more secure.</li>
            </ul>
        </details>

        <!-- Question 16 -->
        <details>
            <summary>Q16. How do you call a servlet from another servlet?</summary>
            <pre><code>
RequestDispatcher rd = request.getRequestDispatcher("NextServlet");
rd.forward(request, response);
            </code></pre>
        </details>

        <!-- Question 17 -->
        <details>
            <summary>Q17. What are asynchronous Servlets?</summary>
            <p>Servlets that handle long-running tasks without blocking request threads.</p>
            <pre><code>
@WebServlet(value="/async", asyncSupported=true)
public class AsyncServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        AsyncContext ctx = req.startAsync();
        ctx.start(() -> {
            try {
                res.getWriter().println("Processed asynchronously");
                ctx.complete();
            } catch (IOException e) {}
        });
    }
}
            </code></pre>
        </details>

        <!-- Question 18 -->
        <details>
            <summary>Q18. How can we share data between servlets?</summary>
            <ul>
                <li>Request attributes</li>
                <li>Session attributes</li>
                <li>ServletContext attributes</li>
            </ul>
        </details>

        <!-- Question 19 -->
        <details>
            <summary>Q19. How to prevent multiple form submissions?</summary>
            <ul>
                <li>Use tokens in session.</li>
                <li>Disable submit button after click.</li>
            </ul>
        </details>

        <!-- Question 20 -->
        <details>
            <summary>Q20. What is the difference between JSP and Servlet?</summary>
            <p>
                <b>Servlet:</b> Java code → HTML.<br>
                <b>JSP:</b> HTML → Java code (easier for UI).
            </p>
        </details>

        <!-- Question 21 -->
        <details>
            <summary>Q21. What is load-on-startup in servlet?</summary>
            <p>Defines whether a servlet should be loaded at startup or on first request.</p>
            <pre><code>
<servlet>
  <servlet-name>MyServlet</servlet-name>
  <servlet-class>com.svs.MyServlet</servlet-class>
  <load-on-startup>1</load-on-startup>
</servlet>
            </code></pre>
        </details>

        <!-- Question 22 -->
        <details>
            <summary>Q22. How do you send JSON response from a servlet?</summary>
            <pre><code>
response.setContentType("application/json");
PrintWriter out = response.getWriter();
out.print("{\"name\":\"SVS\"}");
out.flush();
            </code></pre>
        </details>

        <!-- Question 23 -->
        <details>
            <summary>Q23. What is DispatcherServlet?</summary>
            <p>It is part of Spring MVC, not core servlet, but acts as a <b>Front Controller</b> for handling web requests.</p>
        </details>

        <!-- Question 24 -->
        <details>
            <summary>Q24. Difference between Servlet 3.0 annotations and web.xml config?</summary>
            <p>
                <b>Annotations:</b> Easier, less XML.<br>
                <b>web.xml:</b> Centralized config, better for large projects.
            </p>
        </details>

        <!-- Question 25 -->
        <details>
            <summary>Q25. How to make a servlet thread-safe?</summary>
            <ul>
                <li>Avoid using instance variables.</li>
                <li>Use local variables inside methods.</li>
                <li>Synchronize critical sections if needed.</li>
            </ul>
        </details>

        <!-- Question 26 -->
        <details>
            <summary>Q26. How can we access init parameters in Servlet?</summary>
            <pre><code>
String param = getServletConfig().getInitParameter("dbUser");
            </code></pre>
        </details>

        <!-- Question 27 -->
        <details>
            <summary>Q27. How to get client IP address in servlet?</summary>
            <pre><code>
String ip = request.getRemoteAddr();
            </code></pre>
        </details>

        <!-- Question 28 -->
        <details>
            <summary>Q28. What is MIME type in Servlets?</summary>
            <p>It tells browser how to handle data.</p>
            <pre><code>
response.setContentType("application/pdf");
            </code></pre>
        </details>

        <!-- Question 29 -->
        <details>
            <summary>Q29. What are advantages of Servlet over CGI?</summary>
            <ul>
                <li>Faster (multi-threaded)</li>
                <li>Portable (Java)</li>
                <li>Secure</li>
                <li>Robust</li>
            </ul>
        </details>

        <!-- Question 30 -->
        <details>
            <summary>Q30. How do you download a file using Servlet?</summary>
            <pre><code>
response.setContentType("application/octet-stream");
response.setHeader("Content-Disposition", "attachment; filename=file.txt");
Files.copy(Paths.get("D:/file.txt"), response.getOutputStream());
            </code></pre>
        </details>
                <!-- Question 31 -->
        <details>
            <summary>Q31. How to upload a file in Servlet?</summary>
            <pre><code>
@WebServlet("/upload")
@MultipartConfig
public class UploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {
        Part filePart = req.getPart("file");
        String fileName = filePart.getSubmittedFileName();
        filePart.write("D:/uploads/" + fileName);
    }
}
            </code></pre>
        </details>

        <!-- Question 32 -->
        <details>
            <summary>Q32. How to set response headers in servlet?</summary>
            <pre><code>
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Pragma", "no-cache");
            </code></pre>
        </details>

        <!-- Question 33 -->
        <details>
            <summary>Q33. Explain Servlet lifecycle methods?</summary>
            <ul>
                <li><b>init()</b> → called once when servlet loads.</li>
                <li><b>service()</b> → called for every request.</li>
                <li><b>destroy()</b> → called once before servlet unloads.</li>
            </ul>
        </details>

        <!-- Question 34 -->
        <details>
            <summary>Q34. How do you send a redirect in Servlet?</summary>
            <pre><code>
response.sendRedirect("login.jsp");
            </code></pre>
        </details>

        <!-- Question 35 -->
        <details>
            <summary>Q35. Difference between forward() and sendRedirect()?</summary>
            <ul>
                <li><b>forward():</b> Server-side, URL doesn’t change.</li>
                <li><b>sendRedirect():</b> Client-side, URL changes.</li>
            </ul>
        </details>

        <!-- Question 36 -->
        <details>
            <summary>Q36. How can you download an image in Servlet?</summary>
            <p>Same as file download, set MIME type to <code>image/png</code> or <code>image/jpeg</code>.</p>
        </details>

        <!-- Question 37 -->
        <details>
            <summary>Q37. What is a Filter in Servlet?</summary>
            <p>Filter is used for preprocessing requests and postprocessing responses (logging, authentication).</p>
            <pre><code>
@WebFilter("/*")
public class LogFilter implements Filter {
   public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
       throws IOException, ServletException {
       System.out.println("Request received");
       chain.doFilter(req, res);
   }
}
            </code></pre>
        </details>

        <!-- Question 38 -->
        <details>
            <summary>Q38. What is Listener in Servlet?</summary>
            <p>Listeners are used to monitor events in web applications (session creation, attribute changes).</p>
            <pre><code>
@WebListener
public class MyListener implements HttpSessionListener {
   public void sessionCreated(HttpSessionEvent se) {
       System.out.println("Session created");
   }
}
            </code></pre>
        </details>

        <!-- Question 39 -->
        <details>
            <summary>Q39. How to maintain user session without cookies?</summary>
            <p>Use <b>URL rewriting</b> by appending <code>;jsessionid</code> to URLs.</p>
        </details>

        <!-- Question 40 -->
        <details>
            <summary>Q40. Explain difference between doGet() and doPost() in HttpServlet?</summary>
            <p>doGet() handles HTTP GET requests, doPost() handles POST. They are called from service().</p>
        </details>

        <!-- Question 41 -->
        <details>
            <summary>Q41. Can we have multiple servlets mapped to same URL?</summary>
            <p>No, one URL → one servlet. If multiple mappings exist, Tomcat will throw error.</p>
        </details>

        <!-- Question 42 -->
        <details>
            <summary>Q42. What is RequestDispatcher include() vs forward()?</summary>
            <ul>
                <li><b>include():</b> Adds output of another resource into current response.</li>
                <li><b>forward():</b> Transfers control fully to another resource.</li>
            </ul>
        </details>

        <!-- Question 43 -->
        <details>
            <summary>Q43. How to read form data in servlet?</summary>
            <pre><code>
String name = request.getParameter("name");
            </code></pre>
        </details>

        <!-- Question 44 -->
        <details>
            <summary>Q44. How to pass data from servlet to JSP?</summary>
            <pre><code>
request.setAttribute("user", "SVS Tutorials");
RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
rd.forward(request, response);
            </code></pre>
        </details>

        <!-- Question 45 -->
        <details>
            <summary>Q45. How can you connect Servlet with a database?</summary>
            <pre><code>
Connection conn = DriverManager.getConnection(
  "jdbc:mysql://localhost:3306/testdb", "root", "password");
            </code></pre>
        </details>

        <!-- Question 46 -->
        <details>
            <summary>Q46. Difference between ServletContext and ServletConfig?</summary>
            <ul>
                <li><b>ServletConfig:</b> Config params for one servlet.</li>
                <li><b>ServletContext:</b> Shared data for all servlets.</li>
            </ul>
        </details>

        <!-- Question 47 -->
        <details>
            <summary>Q47. What is contentType in response?</summary>
            <p>It defines how the response should be interpreted.</p>
            <pre><code>
response.setContentType("text/html");
            </code></pre>
        </details>

        <!-- Question 48 -->
        <details>
            <summary>Q48. How to invalidate a session in servlet?</summary>
            <pre><code>
request.getSession().invalidate();
            </code></pre>
        </details>

        <!-- Question 49 -->
        <details>
            <summary>Q49. How to send HTML content in servlet response?</summary>
            <pre><code>
PrintWriter out = response.getWriter();
out.println("&lt;h1&gt;Hello Servlet&lt;/h1&gt;");
            </code></pre>
        </details>

        <!-- Question 50 -->
        <details>
            <summary>Q50. How to make servlet return plain text response?</summary>
            <pre><code>
response.setContentType("text/plain");
response.getWriter().println("Simple Text");
            </code></pre>
        </details>

        <!-- Question 51 -->
        <details>
            <summary>Q51. What is servlet mapping?</summary>
            <p>It is mapping between URL pattern and servlet class in <code>web.xml</code> or annotations.</p>
        </details>

        <!-- Question 52 -->
        <details>
            <summary>Q52. What is session timeout in servlet?</summary>
            <p>Time after which inactive session is invalidated (default 30 mins).</p>
            <pre><code>
<session-config>
   <session-timeout>15</session-timeout>
</session-config>
            </code></pre>
        </details>

        <!-- Question 53 -->
        <details>
            <summary>Q53. Can we call one servlet from another servlet directly?</summary>
            <p>Yes, using <code>RequestDispatcher</code> or <code>sendRedirect</code>.</p>
        </details>

        <!-- Question 54 -->
        <details>
            <summary>Q54. How to send XML response from servlet?</summary>
            <pre><code>
response.setContentType("text/xml");
response.getWriter().println("&lt;user&gt;SVS&lt;/user&gt;");
            </code></pre>
        </details>

        <!-- Question 55 -->
        <details>
            <summary>Q55. Difference between doFilter() and service()?</summary>
            <p><b>doFilter()</b> is called before servlet <b>service()</b>, used for pre-processing.</p>
        </details>

        <!-- Question 56 -->
        <details>
            <summary>Q56. How can we get HTTP headers in servlet?</summary>
            <pre><code>
String agent = request.getHeader("User-Agent");
            </code></pre>
        </details>

        <!-- Question 57 -->
        <details>
            <summary>Q57. Difference between Servlet 3.0 async and traditional servlets?</summary>
            <p>Traditional → blocking; Async → non-blocking (better scalability).</p>
        </details>

        <!-- Question 58 -->
        <details>
            <summary>Q58. How to create custom error page for 404 in web.xml?</summary>
            <pre><code>
<error-page>
  <error-code>404</error-code>
  <location>/notfound.jsp</location>
</error-page>
            </code></pre>
        </details>

        <!-- Question 59 -->
        <details>
            <summary>Q59. What are advantages of using filters?</summary>
            <ul>
                <li>Authentication</li>
                <li>Logging</li>
                <li>Data compression</li>
                <li>Reusable logic across servlets</li>
            </ul>
        </details>

        <!-- Question 60 -->
        <details>
            <summary>Q60. Can we use multiple filters on a servlet?</summary>
            <p>Yes, filters can be chained in order defined in <code>web.xml</code> or annotations.</p>
        </details>
                <!-- Question 61 -->
        <details>
            <summary>Q61. What is RequestDispatcher include() method?</summary>
            <p>It includes response of another resource in the current servlet response.</p>
        </details>

        <!-- Question 62 -->
        <details>
            <summary>Q62. How to handle exceptions in servlets?</summary>
            <ul>
                <li>Use try-catch inside servlet.</li>
                <li>Define <code>&lt;error-page&gt;</code> in <code>web.xml</code>.</li>
                <li>Use custom error JSP pages.</li>
            </ul>
        </details>

        <!-- Question 63 -->
        <details>
            <summary>Q63. Difference between GenericServlet and HttpServlet?</summary>
            <ul>
                <li><b>GenericServlet</b> → protocol independent, extend for any protocol.</li>
                <li><b>HttpServlet</b> → protocol specific, designed for HTTP.</li>
            </ul>
        </details>

        <!-- Question 64 -->
        <details>
            <summary>Q64. How to read initialization parameters in servlet?</summary>
            <pre><code>
String value = getServletConfig().getInitParameter("paramName");
            </code></pre>
        </details>

        <!-- Question 65 -->
        <details>
            <summary>Q65. What is load-on-startup in web.xml?</summary>
            <p>It defines whether servlet should be loaded at server startup instead of first request.</p>
        </details>

        <!-- Question 66 -->
        <details>
            <summary>Q66. Difference between absolute and relative URL in sendRedirect?</summary>
            <ul>
                <li>Absolute → full URL like http://example.com/home</li>
                <li>Relative → relative to context root</li>
            </ul>
        </details>

        <!-- Question 67 -->
        <details>
            <summary>Q67. What is the difference between Servlet 2.5 and 3.0?</summary>
            <ul>
                <li>3.0 introduced annotations (@WebServlet, @WebFilter).</li>
                <li>3.0 introduced asynchronous support.</li>
            </ul>
        </details>

        <!-- Question 68 -->
        <details>
            <summary>Q68. What is servlet chaining?</summary>
            <p>Output of one servlet becomes input of another servlet using RequestDispatcher include().</p>
        </details>

        <!-- Question 69 -->
        <details>
            <summary>Q69. How to handle JSON in servlet?</summary>
            <pre><code>
response.setContentType("application/json");
response.getWriter().println("{\"name\":\"SVS\"}");
            </code></pre>
        </details>

        <!-- Question 70 -->
        <details>
            <summary>Q70. How to share data between servlets?</summary>
            <p>Use <code>ServletContext</code> attributes.</p>
            <pre><code>
getServletContext().setAttribute("user", "SVS");
            </code></pre>
        </details>

        <!-- Question 71 -->
        <details>
            <summary>Q71. Can we create multiple sessions for one user?</summary>
            <p>By default one session per user/browser, but you can invalidate and create a new one.</p>
        </details>

        <!-- Question 72 -->
        <details>
            <summary>Q72. How to set cookies in servlet?</summary>
            <pre><code>
Cookie c = new Cookie("user", "SVS");
response.addCookie(c);
            </code></pre>
        </details>

        <!-- Question 73 -->
        <details>
            <summary>Q73. How to read cookies in servlet?</summary>
            <pre><code>
Cookie[] cookies = request.getCookies();
for(Cookie c : cookies){
    out.println(c.getName()+"="+c.getValue());
}
            </code></pre>
        </details>

        <!-- Question 74 -->
        <details>
                <!-- Question 61 -->
        <details>
            <summary>Q61. What is RequestDispatcher include() method?</summary>
            <p>It includes response of another resource in the current servlet response.</p>
        </details>

        <!-- Question 62 -->
        <details>
            <summary>Q62. How to handle exceptions in servlets?</summary>
            <ul>
                <li>Use try-catch inside servlet.</li>
                <li>Define <code>&lt;error-page&gt;</code> in <code>web.xml</code>.</li>
                <li>Use custom error JSP pages.</li>
            </ul>
        </details>

        <!-- Question 63 -->
        <details>
            <summary>Q63. Difference between GenericServlet and HttpServlet?</summary>
            <ul>
                <li><b>GenericServlet</b> → protocol independent, extend for any protocol.</li>
                <li><b>HttpServlet</b> → protocol specific, designed for HTTP.</li>
            </ul>
        </details>

        <!-- Question 64 -->
        <details>
            <summary>Q64. How to read initialization parameters in servlet?</summary>
            <pre><code>
String value = getServletConfig().getInitParameter("paramName");
            </code></pre>
        </details>

        <!-- Question 65 -->
        <details>
            <summary>Q65. What is load-on-startup in web.xml?</summary>
            <p>It defines whether servlet should be loaded at server startup instead of first request.</p>
        </details>

        <!-- Question 66 -->
        <details>
            <summary>Q66. Difference between absolute and relative URL in sendRedirect?</summary>
            <ul>
                <li>Absolute → full URL like http://example.com/home</li>
                <li>Relative → relative to context root</li>
            </ul>
        </details>

        <!-- Question 67 -->
        <details>
            <summary>Q67. What is the difference between Servlet 2.5 and 3.0?</summary>
            <ul>
                <li>3.0 introduced annotations (@WebServlet, @WebFilter).</li>
                <li>3.0 introduced asynchronous support.</li>
            </ul>
        </details>

        <!-- Question 68 -->
        <details>
            <summary>Q68. What is servlet chaining?</summary>
            <p>Output of one servlet becomes input of another servlet using RequestDispatcher include().</p>
        </details>

        <!-- Question 69 -->
        <details>
            <summary>Q69. How to handle JSON in servlet?</summary>
            <pre><code>
response.setContentType("application/json");
response.getWriter().println("{\"name\":\"SVS\"}");
            </code></pre>
        </details>

        <!-- Question 70 -->
        <details>
            <summary>Q70. How to share data between servlets?</summary>
            <p>Use <code>ServletContext</code> attributes.</p>
            <pre><code>
getServletContext().setAttribute("user", "SVS");
            </code></pre>
        </details>

        <!-- Question 71 -->
        <details>
            <summary>Q71. Can we create multiple sessions for one user?</summary>
            <p>By default one session per user/browser, but you can invalidate and create a new one.</p>
        </details>

        <!-- Question 72 -->
        <details>
            <summary>Q72. How to set cookies in servlet?</summary>
            <pre><code>
Cookie c = new Cookie("user", "SVS");
response.addCookie(c);
            </code></pre>
        </details>

        <!-- Question 73 -->
        <details>
            <summary>Q73. How to read cookies in servlet?</summary>
            <pre><code>
Cookie[] cookies = request.getCookies();
for(Cookie c : cookies){
    out.println(c.getName()+"="+c.getValue());
}
            </code></pre>
        </details>

        <!-- Question 74 -->
        <details>
            <summary>Q74. How to auto refresh servlet response?</summary>
            <pre><code>
response.setHeader("Refresh", "5"); // refresh every 5 seconds
            </code></pre>
        </details>

        <!-- Question 75 -->
        <details>
            <summary>Q75. What is dispatcher types in filters?</summary>
            <ul>
                <li>REQUEST</li>
                <li>FORWARD</li>
                <li>INCLUDE</li>
                <li>ERROR</li>
                <li>ASYNC</li>
            </ul>
        </details>

        <!-- Question 76 -->
        <details>
            <summary>Q76. What is MIME type?</summary>
            <p>MIME type tells browser the type of content (text/html, image/png, application/json).</p>
        </details>

        <!-- Question 77 -->
        <details>
            <summary>Q77. How to set status code in servlet?</summary>
            <pre><code>
response.setStatus(HttpServletResponse.SC_NOT_FOUND); // 404
            </code></pre>
        </details>

        <!-- Question 78 -->
        <details>
            <summary>Q78. Difference between response.sendError() and response.setStatus()?</summary>
            <p><b>sendError()</b> sends status code + error page. <b>setStatus()</b> only sets code.</p>
        </details>

        <!-- Question 79 -->
        <details>
            <summary>Q79. How to use hidden form fields for session tracking?</summary>
            <pre><code>
<input type="hidden" name="sessionId" value="12345"/>
            </code></pre>
        </details>

        <!-- Question 80 -->
        <details>
            <summary>Q80. What is difference between Servlet 4.0 and 5.0?</summary>
            <ul>
                <li>4.0 introduced HTTP/2 support.</li>
                <li>5.0 migrated from javax.* to jakarta.* packages.</li>
            </ul>
        </details>

        <!-- Question 81 -->
        <details>
            <summary>Q81. What is a servlet container?</summary>
            <p>Servlet container (Tomcat, Jetty) manages servlet lifecycle and request/response handling.</p>
        </details>

        <!-- Question 82 -->
        <details>
            <summary>Q82. Can servlet be multithreaded?</summary>
            <p>Yes, by default one servlet instance handles multiple threads (requests).</p>
        </details>

        <!-- Question 83 -->
        <details>
            <summary>Q83. How to make servlet thread-safe?</summary>
            <ul>
                <li>Avoid instance variables.</li>
                <li>Use synchronized blocks if needed.</li>
            </ul>
        </details>

        <!-- Question 84 -->
        <details>
            <summary>Q84. How to use annotations instead of web.xml?</summary>
            <pre><code>
@WebServlet("/hello")
public class HelloServlet extends HttpServlet {}
            </code></pre>
        </details>

        <!-- Question 85 -->
        <details>
            <summary>Q85. Difference between forward and include in JSP vs Servlet?</summary>
            <ul>
                <li><b>JSP include:</b> Static include at translation time.</li>
                <li><b>Servlet include:</b> Dynamic include at runtime.</li>
            </ul>
        </details>

        <!-- Question 86 -->
        <details>
            <summary>Q86. How do you send binary data from servlet?</summary>
            <pre><code>
OutputStream os = response.getOutputStream();
os.write(byteArray);
            </code></pre>
        </details>

        <!-- Question 87 -->
        <details>
            <summary>Q87. What is the default scope of servlet objects?</summary>
            <p>Servlets are singleton objects by default in container.</p>
        </details>

        <!-- Question 88 -->
        <details>
            <summary>Q88. Can we change session timeout programmatically?</summary>
            <pre><code>
request.getSession().setMaxInactiveInterval(600); // 10 mins
            </code></pre>
        </details>

        <!-- Question 89 -->
        <details>
            <summary>Q89. How to get client IP address in servlet?</summary>
            <pre><code>
String ip = request.getRemoteAddr();
            </code></pre>
        </details>

        <!-- Question 90 -->
        <details>
            <summary>Q90. Difference between doHead() and doGet()?</summary>
            <p><b>doHead()</b> sends only headers, no body. <b>doGet()</b> sends headers + body.</p>
        </details>

        <!-- Question 91 -->
        <details>
            <summary>Q91. How to compress response data in servlet?</summary>
            <p>Use GZIPOutputStream wrapping response.getOutputStream().</p>
        </details>

        <!-- Question 92 -->
        <details>
            <summary>Q92. How to set multiple headers in servlet response?</summary>
            <pre><code>
response.setHeader("Cache-Control", "no-cache");
response.addHeader("Author", "SVS Tutorials");
            </code></pre>
        </details>

        <!-- Question 93 -->
        <details>
            <summary>Q93. What is difference between RequestDispatcher and response.sendRedirect?</summary>
            <p><b>RequestDispatcher:</b> server-side, faster. <b>sendRedirect:</b> client-side, new request.</p>
        </details>

        <!-- Question 94 -->
        <details>
            <summary>Q94. How can servlet access init parameters from web.xml?</summary>
            <pre><code>
String dbUrl = getServletConfig().getInitParameter("dbUrl");
            </code></pre>
        </details>

        <!-- Question 95 -->
        <details>
            <summary>Q95. Can we access ServletContext from JSP?</summary>
            <p>Yes, using <code>application</code> implicit object.</p>
        </details>

        <!-- Question 96 -->
        <details>
            <summary>Q96. Difference between synchronous and asynchronous servlet?</summary>
            <p>Sync → blocks thread until response. Async → frees thread while waiting.</p>
        </details>

        <!-- Question 97 -->
        <details>
            <summary>Q97. What is HttpServletResponse sendRedirect used for?</summary>
            <p>To redirect client to another resource (internal or external).</p>
        </details>

        <!-- Question 98 -->
        <details>
            <summary>Q98. What is difference between JSP implicit objects request and session?</summary>
            <ul>
                <li><b>request:</b> Scoped per request.</li>
                <li><b>session:</b> Scoped per user session.</li>
            </ul>
        </details>

        <!-- Question 99 -->
        <details>
            <summary>Q99. How to add context-wide params in web.xml?</summary>
            <pre><code>
<context-param>
   <param-name>dbUrl</param-name>
   <param-value>jdbc:mysql://localhost:3306/test</param-value>
</context-param>
            </code></pre>
        </details>

        <!-- Question 100 -->
        <details>
            <summary>Q100. What is SingleThreadModel interface in servlet?</summary>
            <p>Marker interface to ensure only one request is handled at a time. <b>Deprecated</b> due to scalability issues.</p>
        </details>
        
    </div>
</body>
</html>
