<%-- 
    Document   : feedBack.jsp
    Created on : Oct 21, 2018, 1:21:41 PM
    Author     : i1vag_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="feedback.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="js.js"></script>
    </head>
    <body>
        <%@ include file = "header.jsp" %>
        <div id="feedbackbody">
            <%
                Account sessionAccount = (Account) session.getAttribute("account");
            %>
            <div id="topmargin"></div>
            <div id="content">
                Hãy để lại góp ý của bạn với chúng tôi !
                <div>
                    <form method="POST" action="doFeedback">
                                                                                 <div style="margin-top:20px;">Để lại góp ý dưới tên : <input type="text" name="name" placeholder="Tên của bạn..." <% if(sessionAccount != null)
                            {%> value="<%=sessionAccount.getName()%>" disabled="true"<%}%>>
                                   <input type="text" name="accountId" <% if(sessionAccount != null)
                                {%> value="<%=sessionAccount.getId()%>"<%}%> hidden="true">
                            <div><textarea rows="4" cols="50" name="feedback"></textarea></div>
                            <input type="submit">
                            </form>
                            <div id="topmargin"></div>
                            <%
                                if(request.getAttribute("reply") != null)
                                {
                            %>
                            <br><%=request.getAttribute("reply")%>
                            <%
                                }
                            %>
                        </div>
                </div>
            </div>
            <div id="topmargin"></div>
        </div>
        <%@ include file = "footer.jsp" %>
    </body>
</html>
