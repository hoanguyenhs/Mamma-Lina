package com.hoanguyenhs.mammalina;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class WelcomeServlet
 */
public class WelcomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public WelcomeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.setAttribute("message", "null");
		response.sendRedirect(request.getContextPath() + "/pages/welcome.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		SendMailTLS sendMailTLS = new SendMailTLS();
		boolean result = sendMailTLS.booking(name, phone, email, date, time);
		HttpSession session = request.getSession();
		if (result) {
			session.setAttribute("message",
					"We have already recorded your booking. We hope to see you and wish you will have a happy time with us. Thank you very much.");
		} else {
			session.setAttribute("message",
					"It seem your booking can not reach us. Please try again or you can call us and make a booking. Thank you.");
		}
		response.sendRedirect(request.getContextPath() + "/pages/welcome.jsp");
	}

}
