
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>main Page</title>
    </head>
     <style>
        body {
      background-image:url("3.jpg");
		background-attachment: fixed;
		background-position: center;
		background-repeat: no-repeat;
		background-size: 1400px 700px;}
        button
	{
		background-color: #e7e7e7; color: black; /* Gray */
		border: none;
    color: black;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
	}
    </style>
    <body>
        <%
            
            try{
            String user = request.getParameter("uname");
            String pass = request.getParameter("psw");
            
            String myurl="jdbc:mysql://localhost/sign";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/sign?useSSL=false","root","raswsuti");
            
                Statement st=conn.createStatement();
                String query1="select * from s where u='"+user+"' and p='"+pass+"'";
                ResultSet rs=st.executeQuery(query1);
                
            if(rs.next())
            {    
            //session.setAttribute("user", user);
            //response.sendRedirect("dashboard.jsp");
            String name=rs.getString("name");
            %>
           <h1>Welcome <% out.println(user);%></h1>
           <!-- <a href="application.html"> submit application</a>
            <a href="status.html"> application status</a>
            <br><br>
            <a href="student.jsp"> logout</a>-->
                
           
           <%
            }
            else 
            {
                 
                 out.println("<script>alert('credentials not matched')</script>");
                %> 
    <html>
        <body>
            <h1><a href="login.html">go back to login page</a></h1>
        </body>    </html>
           <%
                 st.close();
            
            }
}
            catch(Exception e)
            {
                System.err.println("got an exception");
                System.err.println(e.getMessage());
            }
   
        %>
        <% String user = request.getParameter("uname");
            String pass = request.getParameter("psw");
            %>
        <h1>welcome <%out.println(user);%></h1>
        <a href="StudentInfo.jsp"><button>StudentInfo</button></a>
        <a href="parentInfo.jsp"><button>parentInfo</button></a>
        <a href="Attendance.jsp"><button>Attendance</button></a>
        <a href="Marks"><button>Marks</button></a>
        <a href="timetable.jsp"><button>timetable</button></a>
        <a href="courseenrolled.jsp"><button>course</button></a>
        <hr>
    </body>
</html>


    </body>
</html>
