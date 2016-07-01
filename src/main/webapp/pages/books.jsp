<%@ page import="com.melkov.beans.Book" %>
<%@ page import="com.melkov.beans.BookList" %><%--
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

</head>
<body>
<%@ include file="../jspf/header.jspf"%>
<%@ include file="../jspf/left_menu.jspf"%>
<%request.setCharacterEncoding("UTF-8");

    long genreId = 0L;

    try {
        genreId = Long.valueOf(request.getParameter("genre_id"));
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>




<div class="book_list">
    <h3>${param.name}</h3>
    <table cellpadding="30" style="font-size: 12px;">

        <jsp:useBean id="bookList" class="com.melkov.beans.BookList" scope="page"/>
        <%
            session.setAttribute("currentBookList",bookList);
            for (Book book : bookList.getBooksByGenre(genreId)){
        %>
        <tr>
            <td style="width:400px;height: 100px;">
                <p style="color:#378de5 ;font-weight: bold; font-size: 15px;"> <%=book.getName()%></p>
                <br><strong>ISBN:</strong> <%=book.getIsbn()%>
                <br><strong>Издательство:</strong> <%=book.getPublisher() %>

                <br><strong>Количество страниц:</strong> <%=book.getPageCount() %>
                <br><strong>Год издания:</strong> <%=book.getPublishDate() %>
                <br><strong>Автор:</strong> <%=book.getAuthor() %>
                <p style="margin:10px;"> <a href="#">Читать</a></p>
            </td>
            <td> style="width:150px;height: 100px;">
                <img src="<%=book.getImage()%>"></img>
            </td>
        </tr>
        <%}%>


    </table>
</div>

</body>
</html>
