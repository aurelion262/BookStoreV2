<%-- 
    Document   : editAccount.jsp
    Created on : Oct 19, 2018, 2:07:12 PM
    Author     : i1vag_000
--%>

<%@page import="model.DAO"%>
<%@page import="model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        DAO dao = new DAO(); 
    %>
    <head>
        <link rel="stylesheet" type="text/css" href="register.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="js.js"></script>
    </head>
    <body>
        <%@ include file = "header.jsp" %>
        <%            
            if(((Account)(session.getAttribute("account"))).getRole().equals("ADMIN")
            ||((Account)(session.getAttribute("account"))).getId()==Integer.parseInt(request.getParameter("id")))
            {
            int id = Integer.parseInt((String)request.getParameter("id"));
            Account a = dao.getAccount(id);
            String url = "editAccount?id=" + a.getId();
        %>
        <form method="POST" action="<%=url%>">
        <div id="outsite">
        <div id="cover">
            <div id="registertext" class="centerHor">
                <div id="textre">Cập nhật thông tin tài khoản</div>
            </div>
		<div>Họ và tên</div>
		<input type="text" name="name" class="inputtext" placeholder="Tên người dùng..."
                       <% if (a.getName()!=null) { %>value="<%=a.getName()%>" <%}%>>
		<div>Tài khoản (*)</div>
		<input type="text" name="username" class="inputtext" placeholder="Tên tài khoản"
                       <% if (a.getUsername()!=null) { %>value="<%=a.getUsername()%>" <%}%>>
		<div>Mật khẩu (*)</div>
		<input type="password" name="password" class="inputtext" placeholder="Mật khẩu"
                       <% if (a.getPassword()!=null) { %>value="<%=a.getPassword()%>" <%}%>>
		<div>Nhập lại mật khẩu (*)</div>
		<input type="password" name="repassword" class="inputtext" placeholder="Nhập lại mật khẩu"
                       <% if (a.getPassword()!=null) { %>value="<%=a.getPassword()%>" <%}%>>
                <div>Email</div>
		<input type="text" name="email" class="inputtext" placeholder="Địa chỉ email"
                       <% if (a.getEmail()!=null) { %>value="<%=a.getEmail()%>" <%}%>>
                <div>Số điện thoại</div>
		<input type="text" name="phonenumber" class="inputtext" placeholder="SĐT"
                       <% if (a.getPhonenumber()!=null) { %>value="<%=a.getPhonenumber()%>" <%}%>>
                <div>Địa chỉ</div>
		<input type="text" name="address" class="inputtext" placeholder="Địa chỉ nơi ở"
                       <% if (a.getAddress()!=null) { %>value="<%=a.getAddress()%>" <%}%>>
                <div>Credit card :</div>
		<input type="text" name="creditcard" class="inputtext" placeholder="Thẻ tín dụng"
                       <% if (a.getCreditcard()!=null) { %>value="<%=a.getCreditcard()%>" <%}%>>
                <%
                    if(((Account)(session.getAttribute("account"))).getRole().equals("ADMIN"))
                    {
                %>
                <div>Loại tài khoản :</div>
                <select name="role" class="inputtext">
                    <option value="CLIENT">CLIENT</option>
                    <option value="ADMIN" <%if(a.getRole().equals("ADMIN")){%>selected<%}%>>ADMIN</option>
                </select>
                <%
                    }
                %>
		<div class="centerHor">
                    <input type="submit" value="Cập nhật" ></input>
		</div>
            </div>
        </div>
        </form>
        <% 
            String message = (String)request.getAttribute("message");
            if(message!=null){ %>
                <p><%=message%></p>
        <%}
        }
            else
            {
                    out.print("Không được dou");
            }
        %>
        <%@ include file = "footer.jsp" %>
        <%dao.close();%>
    </body>
</html>
