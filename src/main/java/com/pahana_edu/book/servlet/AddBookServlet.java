package com.pahana_edu.book.servlet;

import com.pahana_edu.book.DAO.BookDAO;
import com.pahana_edu.book.model.Book;
import com.pahana_edu.book.util.FileUploadUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/AddBookServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class AddBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookDAO bookDAO;

    public void init() {
        bookDAO = new BookDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Handle file upload first
        String uploadPath = getServletContext().getRealPath("") + "/uploads";
        FileUploadUtil.createUploadDirectory(uploadPath);

        Part filePart = request.getPart("coverImage");
        String fileName = FileUploadUtil.getFileName(filePart);
        String coverImagePath = null;

        if (fileName != null && !fileName.isEmpty()) {
            coverImagePath = "uploads/" + FileUploadUtil.generateUniqueFileName(fileName);
            filePart.write(uploadPath + "/" + coverImagePath.substring("uploads/".length()));
        }

        // Get other form parameters
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String isbn = request.getParameter("isbn");
        String publisher = request.getParameter("publisher");
        String publicationDateStr = request.getParameter("publicationDate");
        String category = request.getParameter("category");
        String language = request.getParameter("language");
        int pages = Integer.parseInt(request.getParameter("pages"));
        String format = request.getParameter("format");
        double price = Double.parseDouble(request.getParameter("price"));
        double discount = request.getParameter("discount") != null && !request.getParameter("discount").isEmpty()
                ? Double.parseDouble(request.getParameter("discount")) : 0;
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int threshold = request.getParameter("threshold") != null && !request.getParameter("threshold").isEmpty()
                ? Integer.parseInt(request.getParameter("threshold")) : 5;
        String description = request.getParameter("description");

        // Parse publication date
        Date publicationDate = null;
        try {
            if (publicationDateStr != null && !publicationDateStr.isEmpty()) {
                publicationDate = new SimpleDateFormat("yyyy-MM-dd").parse(publicationDateStr);
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // Create book object
        Book book = new Book(title, author, isbn, publisher, publicationDate,
                category, language, pages, format, price, discount,
                quantity, threshold, description, coverImagePath);

        // Save book to database
        boolean success = bookDAO.insertBook(book);

        // Set response message
        if (success) {
            request.getSession().setAttribute("success", "Book added successfully!");
        } else {
            request.getSession().setAttribute("error", "Failed to add book. Please try again.");
        }

        // Redirect back to add book page
        response.sendRedirect("addBook.jsp");
    }
}
