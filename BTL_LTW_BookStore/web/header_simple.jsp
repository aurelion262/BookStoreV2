
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
            
        </div>
    </div>
                    <div style="clear:both"></div>
</div>
<%headerDAO.close();%>
