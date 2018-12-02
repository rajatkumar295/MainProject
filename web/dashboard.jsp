<%-- 
    Document   : dashboard
    Created on : Nov 24, 2018, 9:59:52 AM
    Author     : HP
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <style>
        body {
      background-image:url("11.jpg");
		background-attachment: fixed;
		background-position: center;
		background-repeat: no-repeat;
		background-size: 1400px 700px;}
        h1{
            color: white;
        }
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
        <% String user = (String)session.getAttribute("u");
            //String pass = request.getParameter("psw");
            %>
        <h1>welcome <%out.println(user);%></h1>
        <a href="personalInfo"><button>StudentInfo</button></a>
        <a href="parentInfo"><button>parentInfo</button></a>
        <a href="attendance"><button>Attendance</button></a>
        <a href="Marks"><button>Marks</button></a>
        <a href="timetable"><button>timetable</button></a>
        <a href="courseenrolled"><button>course</button></a>
        <hr>
    </body>
</html>

