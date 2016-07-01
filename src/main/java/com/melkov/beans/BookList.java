package com.melkov.beans;

import com.melkov.db.Database;

import javax.swing.*;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class BookList {

    private ArrayList<Book> bookList = new ArrayList<Book>();

    private ArrayList<Book> getBooks(String str) {

        Statement stmt = null;
        ResultSet rs = null;
        Connection conn = null;

        try {
            conn = Database.getConnection();

            stmt = conn.createStatement();
            System.out.println(str);
            rs = stmt.executeQuery(str);
            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getLong("id"));
                book.setName(rs.getString("name"));
                book.setGenre(rs.getString("genre"));
                book.setIsbn(rs.getString("isbn"));
                book.setAuthor(rs.getString("author"));
                book.setPageCount(rs.getInt("page_count"));
                book.setPublishDate(rs.getDate("publish_year"));
                book.setPublisher(rs.getString("publisher"));
                book.setImage(new ImageIcon(rs.getBytes("image")).getImage());
                bookList.add(book);
            }

        } catch (SQLException ex) {
            Logger.getLogger(BookList.class.getName()).log(Level.SEVERE, null, ex);
            Logger.getLogger("Booooooom").log(Level.SEVERE,null,ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(BookList.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        System.out.println(bookList);
        return bookList;
    }

    public ArrayList<Book> getAllBooks() {
        if (!bookList.isEmpty()) {
            return bookList;
        } else {
            return getBooks("select * from book order by name");
        }
    }

    public ArrayList<Book> getBooksByGenre(long id) {;
        return getBooks("select b.id,b.name,b.isbn,b.page_count,b.publish_year, p.name as publisher, a.fio as author, g.name as genre, b.image from book b "
                + "inner join author a on b.author_id=a.id "
                + "inner join genre g on b.genre_id=g.id "
                + "inner join publisher p on b.publisher_id=p.id "
                + "where genre_id=" + id + " order by b.name "
                + "limit 0,5");

    }
    
}
