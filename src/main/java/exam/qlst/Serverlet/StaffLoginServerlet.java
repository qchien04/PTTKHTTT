package exam.qlst.Serverlet;

import exam.qlst.DAO.StaffDAO;
import exam.qlst.Model.Staff;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/staff-login")
public class StaffLoginServerlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("StaffView/StaffLogin.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Staff staff = (new StaffDAO()).login(username, password);

        if (staff != null) {
            HttpSession session = request.getSession();
            session.setAttribute("staff", staff);

            response.sendRedirect("WarehouseStaffView/WareHouseStaffView.jsp");
        } else {
            request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("StaffView/StaffLogin.jsp");
            dispatcher.forward(request, response);
        }
    }

}
