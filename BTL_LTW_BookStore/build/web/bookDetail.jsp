<%-- 
    Document   : bookDetail.jsp
    Created on : Oct 21, 2018, 1:14:11 PM
    Author     : i1vag_000
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Account"%>
<%@page import="model.DAO"%>
<%@page import="model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        DAO dao = new DAO();
        Book b = dao.getBook(Integer.parseInt(request.getParameter("bookId")));
    %>
    <head>
        <link rel="stylesheet" type="text/css" href="css_detail.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=b.getName()%></title>
        <script type="text/javascript" src="js.js"></script>
    </head>
    <body>
        <%@ include file = "header.jsp" %>
        <div id="body">
            <div id="imagedetailframe">
                <img src="<%=b.getImageurl()%>" id="imagedetail">
                <a href="addToFavorite?bookId=<%=b.getId()%>" id="addtofav"><img src="icon/heart.png" style="height:25px; width: 25px">Thêm vào danh sách yêu thích <img src="icon/heart.png" style="height:25px; width: 25px"></a>
                <form method='POST' action='addToCart?bookId=<%=b.getId()%>'>
                    Số lượng : <input id="iptQuantity" name="quantity" type="number" value="1" style="width: 30px">
                    <input id = "cartimg" type="image" src="icon/cart.png">
                </form>
            </div>
            <div id="detailbook">
                <%
                    Account sessionAccount = (Account) session.getAttribute("account");
                    if(sessionAccount != null && sessionAccount.getRole().equals("ADMIN"))
                    {
                %>
                <p class="infors"><a class="link" onmouseover="this.setAttribute('style', 'text-decoration:underline')" onmouseout="this.setAttribute('style', 'text-decoration:none')" href="deleteBook?bookId=<%=b.getId()%>&searchOption=<%=session.getAttribute("searchOption")%>&bookName=<%=session.getAttribute("bookName")%>&author=<%=session.getAttribute("author")%>&category=<%=session.getAttribute("category")%>&ceilingPrice=<%=session.getAttribute("ceilingPrice")%>&floorPrice=<%=session.getAttribute("floorPrice")%>">Xoá</a>/<a class="link" onmouseover="this.setAttribute('style', 'text-decoration:underline')" onmouseout="this.setAttribute('style', 'text-decoration:none')" href="editBook?id=<%=b.getId()%>">Sửa</a></p>
                <%
                    }
                %>
                <p class="tensach"><%=b.getName()%></p>

                <div class="infors">
                    <p class="item">Tác giả: <span class="value"><%=b.getAuthor()%></span></p>	
                </div>
                <div class="infors">
                    <p class="item">Thể loại: <span class="value"><%=b.getCategory()%></span></p>	
                </div>
                <div class="infors">
                    <p class="item">Nhà xuất bản: <span class="value"><%=b.getPublisher()%></span></p>	
                </div>
                <div class="infors">
                    <p class="item">Năm xuất bản: <span class="value"><%=b.getReleasedyear()%></span></p>				
                </div>
                <div class="infors">
                    <p id="oldprice">Giá: <span id="chuagiam"><%=b.getFinalprice() + b.getDiscount()%></span>VND</p>
                </div>
                <div class="infors">
                    <p id="newprice">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="dagiam"><%=b.getFinalprice()%></span>VND</p>	
                </div>
                </div>
                <div id="desbook">
                    <p class="tensach">Description</p>
                    <p id="descontent"><%=b.getDescription()%></p>
                </div>
                <div style="clear:both"></div>
            </div>
            <%dao.close();%>
            <%@ include file = "footer.jsp" %>
    </body>
</html>
