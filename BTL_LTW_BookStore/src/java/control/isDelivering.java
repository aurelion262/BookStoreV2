package control;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAO;
import model.Order;

@WebServlet(name="isDelivering", urlPatterns={"/isDelivering"})
public class isDelivering extends HttpServlet {

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
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        Order o = dao.getOrder(orderId);
        if(o.getIsDelivering()==0)
        {
            dao.isDelivering(orderId, 1);
        }
        else
        {
            dao.isDelivering(orderId, 0);
        }
        dao.close();
        response.sendRedirect("orderList");
    }
}
