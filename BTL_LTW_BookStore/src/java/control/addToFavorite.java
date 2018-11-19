package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.Book;
import model.BooksInFavorite;
import model.BooksInOrder;
import model.DAO;
import model.Order;

@WebServlet(name="addToFavorite", urlPatterns={"/addToFavorite"})
public class addToFavorite extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doPost(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        DAO dao = new DAO();
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        if(session.getAttribute("account")!=null)
        {
            Account sessionAccount = (Account)session.getAttribute("account");
            BooksInFavorite bif = new BooksInFavorite();
            bif.setAccountId(sessionAccount.getId());
            bif.setBookId(bookId);
            dao.addToFavorite(bif);
            response.sendRedirect("favoriteList");
        }
        else
        {
            response.sendRedirect("login.jsp");
        }
        dao.close();
    }
}
