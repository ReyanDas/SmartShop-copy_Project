package com.learn.mycart.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.learn.mycart.dao.UserDao;
import com.learn.mycart.entities.User;
import com.learn.mycart.helper.FactoryProvider;
import com.learn.mycart.helper.Generator;
import com.learn.mycart.helper.Mailer;
import com.learn.mycart.helper.Test;

//@WebServlet("/OtpLoginservlet")
public class OtpLoginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OtpLoginservlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//	Operation with email
		String operation = request.getParameter("loginoperation");
		HttpSession httpSession = request.getSession();
		

		if (operation.equalsIgnoreCase("email")) {
			String email = request.getParameter("email");
			User user = (User) new UserDao(FactoryProvider.getFactory()).getUserByEmail(email);
			
			if(user!=null ) {
				int otpmail = Generator.getOTP();

				boolean status = Mailer.sendMail("Your OTP is: " + otpmail, "OTP Confirmation", email);
				if (status) {
					httpSession.setAttribute("message", "OTP was sent to email. Please confirm");
					Cookie otpcookie = new Cookie("otp",String.valueOf(otpmail));
					otpcookie.setMaxAge(20);
					response.addCookie(otpcookie);
					httpSession.setAttribute("otp", "sent");
					httpSession.setAttribute("otpvalue", otpmail);
					httpSession.setAttribute("emailid", email);
					response.sendRedirect("loginWithOTP.jsp");

				} else {
					httpSession.setAttribute("message", "OTP was not sent something wrong with email. Please Check");
					httpSession.setAttribute("otp", "notsent");
					response.sendRedirect("loginWithOTP.jsp");

				}
				
				
				
			}else {
				httpSession.setAttribute("message", ""
						+ "Email is not registered. Please register");
				httpSession.setAttribute("otp", "notsent");
				response.sendRedirect("loginWithOTP.jsp");
				
				
				
			}

			
// --------------------	Operation with OTP
		} else {
			String otp = request.getParameter("otp");

			if (otp != null) {

				int otp1 = Integer.parseInt(otp);
				System.out.println("OTP from client---" + otp1);
				System.out.println("OTP otp sent on mail---" + httpSession.getAttribute("otpvalue"));
				String otp11 =String.valueOf(httpSession.getAttribute("otpvalue")); 
					Cookie[] allcookies= request.getCookies();
					for(Cookie ck : allcookies) {
					
							response.getWriter().append("OTP from cookie"+ck.getName());
							
							if(ck.getName().equalsIgnoreCase("otp") && ck.getValue().equalsIgnoreCase(String.valueOf(otp11))) {
								response.sendRedirect("index.jsp");
								
								
							}
						
							
							
						
						
						
					}
				
				
				System.out.println(httpSession.getCreationTime());
				
				 System.out.println(Test.getDurationBreakdown(httpSession.getCreationTime()));
				httpSession.removeAttribute("otp");
				httpSession.removeAttribute("otpvalue");
				httpSession.removeAttribute("emailid");

				
			} else {

				System.out.println("something went wrong.......");
			}

		}

//		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
