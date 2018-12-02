/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
    import model.Student;
import java.util.ArrayList;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;

/**
 *
 * @author HP
 */
public class Marks extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");  
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/sign?useSSL=false", "root", "raswsuti");
            PreparedStatement pst = conn.prepareStatement("Select * from marks where u=?");
             HttpSession session=request.getSession(false); 
            pst.setString(1, (String)session.getAttribute("u"));
            ResultSet rs=pst.executeQuery();
            ArrayList<Student> std=new ArrayList<Student>();
            while(rs.next())
            {
                Student obj=new Student();
                obj.coursename=rs.getString(2);
                obj.coursecode=rs.getString(3);
                obj.st1=rs.getString(4);
                obj.st2=rs.getString(5);
                obj.st3=rs.getString(6);
                std.add(obj);
            }
            System.out.println((String)session.getAttribute("u"));
 //           System.out.println(((Student)std.get(1)).coursename);
            request.setAttribute("marks",std);
            conn.close();
            
            RequestDispatcher rd=request.getRequestDispatcher("/Marks.jsp");
            rd.forward(request,response);
    }
         catch(Exception e)
                 {  e.printStackTrace();
                     out.println(e);
                 }
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
