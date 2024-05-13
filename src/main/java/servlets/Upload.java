package servlets;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import forms.UploadForm;

public class Upload extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.getServletContext().getRequestDispatcher("/WEB-INF/upload.jsp").forward(request, response);
    }

    public void doPost( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {
		UploadForm form = new UploadForm();
		form.handleUpload(request);
		request.setAttribute("form", form);
		
        this.getServletContext().getRequestDispatcher("/WEB-INF/upload.jsp").forward(request, response);
    }
}