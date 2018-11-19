
<%@page import="java.util.ArrayList"%>
<%@page import="model.DAO"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <link rel="stylesheet" type="text/css" href="header.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>HOMEPAGE</title>
    <script type="text/javascript" src="js.js"></script>
</head>
<%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
//            Account sessionAccount = (Account)session.getAttribute("account");  
    DAO headerDAO = new DAO();
%>

<div id="header">
    <div id="logo">
        <a class="link" href="index">
            <img id="image" src="image/logo.png">
        </a>
    </div>
    <div id="functionpart">

        <div id="contactpart">
            <p id="headerslogan">Whenever you want to find a book<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Let us help you find it!</p>
            <!--<p id="email">Email: hieusachcu@gmail.com</p>
            <p id="sdt">Contact: 0966017654 / <a class="link" onmouseover="this.setAttribute('style', 'text-decoration:underline')" onmouseout="this.setAttribute('style', 'text-decoration:none')" href="feedBack.jsp">Góp ý</a></p>-->
        </div>
        <%--GENERAL NAVIGATION--%>
        <div id="infopart">
            <div id="enterpagepart">
                <%
                    if(session.getAttribute("account") != null)
                    {
                %>
                Hello, <a class="link" href="editAccount.jsp?id=<%=((Account) session.getAttribute("account")).getId()%>"><%=((Account) session.getAttribute("account")).getUsername()%></a> (<a class="link" href="logout" onmouseover="this.setAttribute('style', 'text-decoration:underline')" onmouseout="this.setAttribute('style', 'text-decoration:none')">Đăng xuất</a>/<a class="link" href="cart" onmouseover="this.setAttribute('style', 'text-decoration:underline')" onmouseout="this.setAttribute('style', 'text-decoration:none')">Giỏ hàng</a>/<a class="link" href="orderHistory" onmouseover="this.setAttribute('style', 'text-decoration:underline')" onmouseout="this.setAttribute('style', 'text-decoration:none')">Tình trạng đơn hàng</a>/<a class="link" href="favoriteList" onmouseover="this.setAttribute('style', 'text-decoration:underline')" onmouseout="this.setAttribute('style', 'text-decoration:none')">Yêu thích</a>)
                <%
                }
                else
                {
                %>
                <br><a class="link" href="register.jsp" onmouseover="this.setAttribute('style', 'text-decoration:underline')" onmouseout="this.setAttribute('style', 'text-decoration:none')">Đăng ký</a>/<a class="link" href="login.jsp" onmouseover="this.setAttribute('style', 'text-decoration:underline')" onmouseout="this.setAttribute('style', 'text-decoration:none')">Đăng nhập</a>
                <%
                    }
                %>
                <%--ADMIN NAVIGATION--%>
                <%
                    if(session.getAttribute("account") != null)
                    {
                        if(((Account) session.getAttribute("account")).getRole().equals("ADMIN"))
                        {
                %>
                <br><a class="link" href="accountList" onmouseover="this.setAttribute('style', 'text-decoration:underline')" onmouseout="this.setAttribute('style', 'text-decoration:none')">Danh sách tài khoản</a> / <a class="link" href="orderList" onmouseover="this.setAttribute('style', 'text-decoration:underline')" onmouseout="this.setAttribute('style', 'text-decoration:none')">Danh sách đơn hàng</a> / <a class="link" href="log.jsp" onmouseover="this.setAttribute('style', 'text-decoration:underline')" onmouseout="this.setAttribute('style', 'text-decoration:none')">Nhật ký hoạt động</a> / <a class="link" href="addBook.jsp" onmouseover="this.setAttribute('style', 'text-decoration:underline')" onmouseout="this.setAttribute('style', 'text-decoration:none')">Thêm sách</a>
                <%
                        }
                    }
                %>				
            </div>
        </div>
        <div id="searchbar">
            <div id="frames">
                <form method="POST" action="searchBook">
                    <select style="font-family: times new roman" id="slctSearchOption" name="searchOption" onchange="jsSearchOption(this.options[this.selectedIndex].value)">
                        <option style="font-family: times new roman" value="name">Tên sách</option>
                        <option style="font-family: times new roman" value="author">Tác giả</option>
                        <option style="font-family: times new roman" value="category">Thể loại</option>
                        <option style="font-family: times new roman" value="finalPrice">Giá</option>
                    </select>           
                    <input style="font-family: times new roman" type="text" id="iptBookName" name="bookName" placeholder="Nhập tên" value='' size="30">
                    <input style="font-family: times new roman" type="number" id="iptFloorPrice" name="floorPrice" placeholder="Min" hidden="true" value='' size="30">
                    <input style="font-family: times new roman" type="number" id="iptCeilingPrice" name="ceilingPrice" placeholder="Max" hidden="true" value='' size="30">
                    <input style="font-family: times new roman" list="author" name="author" id="iptAuthor" placeholder="Nhập tác giả" hidden="true" value='' size="30">
                    <datalist id="author">
                        <%
                            ArrayList<String> authorList = headerDAO.getAuthor();
                            for(String s : authorList)
                            {
                        %>
                        <option value="<%=s%>">
                            <%
                                }
                            %>
                    </datalist>
                    <input style="font-family: times new roman" list="category" name="category" id="iptCategory" placeholder="Nhập thể loại" hidden="true" value=''>
                    <datalist id="category">
                        <%
                            ArrayList<String> categoryList = headerDAO.getCategory();
                            for(String s : categoryList)
                            {
                        %>
                        <option value="<%=s%>">
                            <%
                                }
                            %>
                    </datalist>
                    <input style="font-family: times new roman" type="submit" value="Tìm">
                </form>
            </div>
        </div>
    </div>
                    <div style="clear:both"></div>
</div>
<%headerDAO.close();%>
