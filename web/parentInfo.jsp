<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.ParentInfo"%>
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
         padding-left: 50px;  
        }
    </style>
    <head>
        
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ParentInfo</title>
        
    </head>
    <body bgcolor="#fff">
    <center><h1>ParentInfo</h1></center>
        <br>
        <hr>
        <br>
        <table  height="100" width="1350">
            <tr>
                <th>fathername</th>
                <th>fatheroccupation</th>
                <th>mobile</th>
                <th>mothername</th>
                <th>motheroccupation</th>
                <th>mothermobileno</th>
                <th>country</th>
            </tr>
            <%
                ArrayList<ParentInfo> std1=(ArrayList<ParentInfo>)session.getAttribute("parentList");
                System.out.println("chk 2");
                //System.out.println(std1);
                for(int i=0;i<std1.size();i++) {
                
                %>
                <tr>
                    <td><%=std1.get(i).fathername%></td>
        <td><%=std1.get(i).fatheroccupation%></td>
        <td><%=std1.get(i).mobile%></td>
        <td><%=std1.get(i).mothername%></td>
        <td><%=std1.get(i).motheroccupation%></td> 
         <td><%=std1.get(i).mothermobileno%></td>  
          <td><%=std1.get(i).country%></td>  
    </tr>
    <%
        }
    %>
        </table>
    </body>
</html>