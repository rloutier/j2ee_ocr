package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Author;

public class FirstServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String customMessage = "Yet another message here!";
		String paramName = request.getParameter("name");
		String[] defaultNames = {"Bond", "Romain", "Raphules"}; 

		Author anAuthor = new Author();
		anAuthor.setFirstName("Roald");
		anAuthor.setLastName("Dahl");
		anAuthor.setActive(true);

		request.setAttribute("customMessage", customMessage);
		request.setAttribute("name", paramName);
		request.setAttribute("names", defaultNames);
		request.setAttribute("author", anAuthor);

		this.getServletContext().getRequestDispatcher("/WEB-INF/first.jsp").forward(request, response);
	}
}
