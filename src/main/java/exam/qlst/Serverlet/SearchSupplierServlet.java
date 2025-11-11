package exam.qlst.Serverlet;

import exam.qlst.DAO.SupplierDAO;
import exam.qlst.Model.Supplier;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/searchSupplier")
public class SearchSupplierServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");

        SupplierDAO dao = new SupplierDAO();
        List<Supplier> suppliers = dao.searchSuppliers(keyword != null ? keyword : "");

        request.setAttribute("supplierList", suppliers);
        HttpSession session = request.getSession();
        session.setAttribute("supplierList", suppliers);

        request.getRequestDispatcher("WarehouseStaffView/SearchSupplierView.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}