package com.hoanguyenhs.mammalina;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ContactServlet
 */
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContactServlet() {
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
		response.sendRedirect(request.getContextPath() + "/pages/contact.jsp");
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
		String message = request.getParameter("message");
		SendMailTLS sendMailTLS = new SendMailTLS();
		boolean result = sendMailTLS.sendMessage(name, phone, email, message);
		HttpSession session = request.getSession();
		if (result) {
			session.setAttribute("message",
					"Your message have been sent to us. We will contact you within 24 hours. Thank you.");
		} else {
			session.setAttribute("message",
					"It seem your message can not reach us because of some error. Please try again. Thank you.");
		}
		response.sendRedirect(request.getContextPath() + "/pages/contact.jsp");
	}

}
