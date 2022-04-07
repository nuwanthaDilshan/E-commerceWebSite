package com.mycompany.TechMart.servlet;

import com.mycompany.TechMart.dao.UserDao;
import com.mycompany.TechMart.entities.User;
import com.mycompany.TechMart.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String email = request.getParameter("email");
            String password = request.getParameter("password");

            //validetions
            //authwnticating user
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
            User user = userDao.getUserByEmailAndPassword(email, password);
            //System.out.println(user);
            HttpSession httpSession = request.getSession();

            if (user == null) {

                out.println("<h1> Invalid details </h1>");
                httpSession.setAttribute("message", "Invalid Details || Try with another one");
                response.sendRedirect("login.jsp");
                return;

            } else {
                request.getSession().setAttribute("auth", user);
//                out.println("<h1> Welcome " + user.getUserName() + " </h1>");

                //login
                httpSession.setAttribute("current-user", user);

                if (user.getUserType().equals("admin")) {
                    //admin.jsp
                    response.sendRedirect("admin.jsp");
                } else if (user.getUserType().equals("normal")) {
                    //normal.jsp
                    response.sendRedirect("normal.jsp");

                } else if (user.getUserType().equals("agent")) {
                    //salesAgent.jsp
                    response.sendRedirect("salesAgent.jsp");

                } else if (user.getUserType().equals("supplier")) {
                    //supplier.jsp
                    response.sendRedirect("supplier.jsp");
                } else {
                    out.println("we have not identified user type");
                }

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
