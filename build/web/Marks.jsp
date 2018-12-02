<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Student"%>
<!DOCTYPE html>
<html>
     <style>
         h1{
             color: white;
         }
         body{
             background-image: url("11.jpg");
         }
        th{
            background-color: gray;
        }
        td{
            background-color: whitesmoke;
         padding-left: 80px;  
        }
    </style>
    <head>
        
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Marks</title>
        
    </head>
    <body bgcolor="#fff">
    <center><h1>Marks</h1></center>
        <br>
        <hr>
        <br>
        <table  height="200" width="1350">
            <tr>
                <th>Course Name</th>
                <th>Course Code</th>
                <th>ST1</th>
                <th>ST2</th>
                <th>ST3</th>
            </tr>
            <%
                ArrayList<Student> std1=(ArrayList)request.getAttribute("marks");
                System.out.println("chk 2");
                System.out.println(std1);
                Iterator it=std1.iterator();
                while(it.hasNext())
                {
                    Student obj=(Student)it.next();
                %>
                <tr>
        <td><%=obj.coursename%></td>
        <td><%=obj.coursecode%></td>
        <td><%=obj.st1%></td>
        <td><%=obj.st2%></td>
        <td><%=obj.st3%></td>    
    </tr>
    <%
        }
    %>
        </table>
    </body>
</html>