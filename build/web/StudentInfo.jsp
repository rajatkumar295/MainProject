<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.PersonalInfo"%>
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
            padding-top: 50px;
         padding-left: 50px;  
        }
    </style>
    <head>
        
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PersonalInfo</title>
        
    </head>
    <body bgcolor="#fff">
    <center><h1>PersonalInfo</h1></center>
        <br>
        <hr>
        <br>
        <table  height="120" width="1350">
            <tr>
                <th>fname</th>
                <th>lname</th>
                <th>studentId</th>
                <th>regno</th>
                <th>gender</th>
                <th>nationality</th>
                <th>mobileno</th>
                <th>domicile</th>
                <th>country</th>
            </tr>
            <%
                ArrayList<PersonalInfo> std1=(ArrayList)request.getAttribute("personalInfo");
                System.out.println("chk 2");
                System.out.println(std1);
                Iterator it=std1.iterator();
                while(it.hasNext())
                {
                    PersonalInfo obj=(PersonalInfo)it.next();
                %>
                <tr>
        <td><%=obj.fname%></td>
        <td><%=obj.lname%></td>
        <td><%=obj.studentid%></td>
        <td><%=obj.regno%></td>
        <td><%=obj.gender%></td> 
        <td><%=obj.nationality%></td> 
        <td><%=obj.mobileno%></td> 
        <td><%=obj.domicile%></td> 
        <td><%=obj.country%></td> 
    </tr>
    <%
        }
    %>
        </table>
    </body>
</html>