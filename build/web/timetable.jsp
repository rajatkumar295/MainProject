<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Timetable"%>
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
         padding-left: 40px;  
        }
    </style>
    <head>
        
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Timetable</title>
        
    </head>
    <body bgcolor="#fff">
    <center><h1>Timetable</h1></center>
        <br>
        <hr>
        <br>
        <table  height="300" width="1350">
            <tr>
                <th>days</th>
                <th>hour1</th>
                <th>hour2</th>
                <th>hour3</th>
                <th>hour4</th>
                <th>hour5</th>
                <th>hour6</th>
                <th>hour7</th>
                <th>hour8</th>
            
            </tr>
            <%
                ArrayList<Timetable> std1=(ArrayList)request.getAttribute("timetable");
                System.out.println("chk 2");
                System.out.println(std1);
                Iterator it=std1.iterator();
                while(it.hasNext())
                {
                    Timetable obj=(Timetable)it.next();
                %>
                <tr>
        <td><%=obj.days%></td>
        <td><%=obj.hour1%></td>
        <td><%=obj.hour2%></td>
        <td><%=obj.hour3%></td>
        <td><%=obj.hour4%></td>
        <td><%=obj.hour5%></td>
        <td><%=obj.hour6%></td>
        <td><%=obj.hour7%></td>
        <td><%=obj.hour8%></td>
    </tr>
    <%
        }
    %>
        </table>
    </body>
</html>