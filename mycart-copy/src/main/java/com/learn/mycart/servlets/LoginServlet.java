package com.learn.mycart.servlets;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;
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

            //coding area
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            //validations
            //authenticating user
            UserDao userDao = new UserDao(FactoryProvider.getFactory());
            User user = userDao.getUserByEmailAndPassword(email, password);

            //System.out.println(user);
            HttpSession httpSession = request.getSession();
            if (user == null) {
                httpSession.setAttribute("message", "Invalid Details !! Try with another one");
                response.sendRedirect("login.jsp");
                return;
            } else {
                out.println("<h1>Welcome " + user.getUserName() + " </h1>");

                //login
                httpSession.setAttribute("current-user", user);

                if (user.getUserType().equals("admin")) {
                    //admin:-admin.jsp
                    response.sendRedirect("admin.jsp");
                } else if (user.getUserType().equals("normal")) {
                    //normal :normal.jsp
                    response.sendRedirect("normal.jsp");
                }else
                {
                    out.println("We have not identified user type");
                }

            }

        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
