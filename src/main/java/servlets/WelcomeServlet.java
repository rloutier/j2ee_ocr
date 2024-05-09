package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/")
public class WelcomeServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] titles = {"Silence des agneaux", "Seigneur des anneaux", "Saigneur des agneaux"};
		request.setAttribute("titles", titles);
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/welcome.jsp").forward(request, response);
	}
}
