
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class Login extends HttpServlet {

    
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        
        try{
            String user = request.getParameter("uname");
            String pass = request.getParameter("psw");
            
            PrintWriter out = response.getWriter();
            
            String myurl="jdbc:mysql://localhost/sign";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/sign?useSSL=false","root","raswsuti");
            
                Statement st=conn.createStatement();
                String query1="select * from s where u='"+user+"' and p='"+pass+"';";
                ResultSet rs=st.executeQuery(query1);
                //System.out.println(query1);
                
                
            if(rs.next())
            {    
               HttpSession session = request.getSession();
                //System.out.println("heloo.....");
               session.setAttribute("u",user);
               
               response.sendRedirect("dashboard.jsp");
            }
            
            else 
            {
                 
                out.println("<script type=\"text/javascript\">");
                out.print("alert('User or password incorrect');");
                out.println("location='login.html';");
                out.println("</script>");
                 
            
            }
            conn.close();
}
            catch(Exception e)
            {
                System.out.println(e);
//                System.err.println("got an exception");
//                System.err.println(e.getMessage());
            }
   
        
    }


}
