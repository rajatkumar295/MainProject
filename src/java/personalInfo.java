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
    import model.PersonalInfo;
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
public class personalInfo extends HttpServlet {

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
            PreparedStatement pst = conn.prepareStatement("Select * from personalInfo where u=?");
             HttpSession session=request.getSession(false); 
            pst.setString(1, (String)session.getAttribute("u"));
            ResultSet rs=pst.executeQuery();
            ArrayList<PersonalInfo> std=new ArrayList<PersonalInfo>();
            while(rs.next())
            {
                PersonalInfo obj=new PersonalInfo();
                obj.fname=rs.getString(2);
                obj.lname=rs.getString(3);
                obj.studentid=rs.getString(4);
                obj.regno=rs.getString(5);
                obj.dob=rs.getString(6);
                obj.gender=rs.getString(7);
                obj.nationality=rs.getString(8);
                obj.mobileno=rs.getString(9);
                obj.domicile=rs.getString(10);
                obj.address=rs.getString(11);
                obj.country=rs.getString(12);
                std.add(obj);
            }
            System.out.println((String)session.getAttribute("u"));
 //           System.out.println(((Student)std.get(1)).CourseName);
            request.setAttribute("personalInfo",std);
            conn.close();
            
            RequestDispatcher rd=request.getRequestDispatcher("/StudentInfo.jsp");
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
