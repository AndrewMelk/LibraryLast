<%@ page import="com.melkov.beans.Book" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.melkov.enums.SearchType" %>
<%@ page import="java.util.logging.Logger" %>
<%@ page import="java.util.logging.Level" %>

<%@ page language="java" session="true" %><%--
  Created by IntelliJ IDEA.
  User: andrew
  Date: 17.06.16
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Онлайн библиотека</title>
    <link href="../css/style_main.css" rel="stylesheet" type="text/css">
    <link href="../css/style_booklist.css" rel="stylesheet" type="text/css">
    <%request.setCharacterEncoding("UTF8");%>
</head>
<body>
<%@ include file="../jspf/header.jspf"%>
<%@ include file="../jspf/left_menu.jspf"%>
<%@ include file="../jspf/letters.jspf"%>

<div class="book_list">
        <jsp:useBean id="bookList" class="com.melkov.beans.BookList" scope="page"/>
    <%
        ArrayList<Book> list = null;
        Logger.getLogger("BEFORE IF").log(Level.SEVERE,request.getParameter("genre_id"));
        Logger.getLogger("BEFORE IF").log(Level.SEVERE,request.getParameter("letter"));
        Logger.getLogger("BEFORE IF").log(Level.SEVERE,request.getParameter("search_string") + " " + request.getParameter("search_option"));
        if(request.getParameter("letter")!=null){
            String letter = request.getParameter("letter");
            list = bookList.getBooksByLetter(letter);
            Logger.getLogger("in letter if").log(Level.SEVERE,"in letter if");
        }

            else if(request.getParameter("genre_id")!=null){

        long genreId = Long.valueOf(request.getParameter("genre_id"));
        list = bookList.getBooksByGenre(genreId);
        Logger.getLogger("in genre if").log(Level.SEVERE,"in genre if");
        }

        else if (request.getParameter("search_string")!=null) {
            String searchStr = request.getParameter("search_string");
            SearchType type = SearchType.TITLE;
            if (request.getParameter("search_option").equals("Автор")) {
                type = SearchType.AUTHOR;
            }
            if (searchStr != null && !searchStr.trim().equals("")) {
                list = bookList.getBooksBySearch(searchStr, type);
                Logger.getLogger(request.getParameter("search_option")).log(Level.SEVERE, "in search if");

            }

        }    %>
    <h5 style="text-align: left; margin-top: 20px;">Найдено книг: <%=list.size() %></h5>

    <%  session.setAttribute("currentBookList", list);
        for (Book book : list) {

    %>

    <div class="book_info">
        <div class="book_title">
            <p> <%=book.getName()%></p>
        </div>
        <div class="book_image">
            <img src="<%=request.getContextPath()%>/ShowImage?index=<%=list.indexOf(book) %>" height="250" width="190" alt="Обложка"/>
        </div>
        <div class="book_details">
            <br><strong>ISBN:</strong> <%=book.getIsbn()%>
            <br><strong>Издательство:</strong> <%=book.getPublisher() %>

            <br><strong>Количество страниц:</strong> <%=book.getPageCount() %>
            <br><strong>Год издания:</strong> <%=book.getPublishDate() %>
            <br><strong>Автор:</strong> <%=book.getAuthor() %>
            <p style="margin:10px;"> <a href="#">Читать</a></p>
        </div>
    </div>


    <%}%>

</div>

</body>
</html>



