/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.DAO;

/**
 *
 * @author i1vag_000
 */
@WebServlet(name="deleteBook", urlPatterns={"/deleteBook"})
public class deleteBook extends HttpServlet {

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
        Account a = (Account)session.getAttribute("account");
        int bookId = Integer.parseInt(request.getParameter("bookId"));
        if(a.getRole().equals("ADMIN"))
        {
            dao.removeBook(bookId);
            if(request.getParameter("turnBack")!=null)
            {
                response.sendRedirect(request.getHeader("referer"));
            }
            else response.sendRedirect("index");
        }
        else
        {
            response.sendRedirect("index");
        }
        dao.close();
    }
}
