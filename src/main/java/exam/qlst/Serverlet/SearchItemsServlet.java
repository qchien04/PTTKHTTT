package exam.qlst.Serverlet;

import exam.qlst.DAO.ItemDAO;
import exam.qlst.Model.Item;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/searchItems")
public class SearchItemsServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");

        ItemDAO dao = new ItemDAO();
        List<Item> items = dao.searchItems(keyword != null ? keyword : "");

        request.setAttribute("itemList", items);

        HttpSession session = request.getSession();
        session.setAttribute("itemList", items);

        request.getRequestDispatcher("SearchItemsView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}