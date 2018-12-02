<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Courseenrolled"%>
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
         padding-left: 90px;  
        }
    </style>
    <head>
        
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Courseenrolled</title>
        
    </head>
    <body bgcolor="#fff">
    <center><h1>CourseEnrolled</h1></center>
        <br>
        <hr>
        <br>
        <table  height="200" width="1350">
            <tr>
                <th>section</th>
                <th>typelp</th>
                <th>coursecode</th>
                <th>studyperiod</th>
                <th>coursename</th>
            </tr>
            <%
                ArrayList<Courseenrolled> std1=(ArrayList)request.getAttribute("courseenrolled");
                System.out.println("chk 2");
                System.out.println(std1);
                Iterator it=std1.iterator();
                while(it.hasNext())
                {
                    Courseenrolled obj=(Courseenrolled)it.next();
                %>
                <tr>
        <td><%=obj.section%></td>
        <td><%=obj.typelp%></td>
        <td><%=obj.coursename%></td>
        <td><%=obj.studyperiod%></td>
        <td><%=obj.coursecode%></td>    
    </tr>
    <%
        }
    %>
        </table>
    </body>
</html>