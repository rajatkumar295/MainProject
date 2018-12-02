<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Attendance"%>
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
        <title>Attendance</title>
        
    </head>
    <body>
    <center><h1>Attendance</h1></center>
        <br>
        <hr>
        <br>
        <table  height="200" width="1350">
            <tr>
                <th>subject</th>
                <th>studyperiod</th>
                <th>teachername</th>
                <th>fromlast</th>
                <th>tocurrent</th>
                <th>delivered</th>
                <th>attended</th>
            </tr>
            <%
                ArrayList<Attendance> std1=(ArrayList)request.getAttribute("attendance");
                System.out.println("chk 2");
                System.out.println(std1);
                Iterator it=std1.iterator();
                while(it.hasNext())
                {
                    Attendance obj=(Attendance)it.next();
                %>
                <tr>
        <td><%=obj.subject%></td>
        <td><%=obj.studyperiod%></td>
        <td><%=obj.teachername%></td>
        <td><%=obj.fromlast%></td>
        <td><%=obj.tocurrent%></td> 
        <td><%=obj.delivered%></td> 
        <td><%=obj.attended%></td> 
    </tr>
    <%
        }
    %>
        </table>
    </body>
</html>