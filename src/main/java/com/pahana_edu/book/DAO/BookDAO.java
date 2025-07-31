package com.pahana_edu.book.DAO;

import com.pahana_edu.book.model.Book;
import com.pahana_edu.book.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO  {
    // SQL queries
    private static final String INSERT_BOOK_SQL = "INSERT INTO books " +
            "(title, author, isbn, publisher, publication_date, category, language, pages, format, " +
            "price, discount, quantity, threshold, description, cover_image_path) VALUES " +
            "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String SELECT_BOOK_BY_ID = "SELECT * FROM books WHERE id = ?";
    private static final String SELECT_ALL_BOOKS = "SELECT * FROM books";
    private static final String DELETE_BOOK_SQL = "DELETE FROM books WHERE id = ?";
    private static final String UPDATE_BOOK_SQL = "UPDATE books SET " +
            "title = ?, author = ?, isbn = ?, publisher = ?, publication_date = ?, " +
            "category = ?, language = ?, pages = ?, format = ?, price = ?, " +
            "discount = ?, quantity = ?, threshold = ?, description = ?, cover_image_path = ? " +
            "WHERE id = ?";

    public BookDAO() {
    }

    // Insert book
    public boolean insertBook(Book book) {
        boolean rowInserted = false;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BOOK_SQL)) {

            preparedStatement.setString(1, book.getTitle());
            preparedStatement.setString(2, book.getAuthor());
            preparedStatement.setString(3, book.getIsbn());
            preparedStatement.setString(4, book.getPublisher());
            preparedStatement.setDate(5, new java.sql.Date(book.getPublicationDate().getTime()));
            preparedStatement.setString(6, book.getCategory());
            preparedStatement.setString(7, book.getLanguage());
            preparedStatement.setInt(8, book.getPages());
            preparedStatement.setString(9, book.getFormat());
            preparedStatement.setDouble(10, book.getPrice());
            preparedStatement.setDouble(11, book.getDiscount());
            preparedStatement.setInt(12, book.getQuantity());
            preparedStatement.setInt(13, book.getThreshold());
            preparedStatement.setString(14, book.getDescription());
            preparedStatement.setString(15, book.getCoverImagePath());

            rowInserted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted;
    }

    // Other CRUD methods (select, update, delete) would go here
    // For brevity, I'm focusing on the insert functionality since that's what your JSP needs
}
