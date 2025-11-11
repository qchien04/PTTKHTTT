package exam.qlst.Serverlet;

import exam.qlst.DAO.CustomerDAO;
import exam.qlst.Model.Customer;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/RegisterMemberServlet")
public class RegisterMemberServlet extends HttpServlet {


    @Override
    public void init() throws ServletException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerView/RegisterMemberFormView.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            Customer customer = (Customer) session.getAttribute("customer");

            if (customer == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            String fullName = request.getParameter("fullName");
            String dobStr = request.getParameter("dob");
            String phoneNumber = request.getParameter("phoneNumber");
            String email = request.getParameter("email");
            String address = request.getParameter("address");

            customer.setFullName(fullName);

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date dob = sdf.parse(dobStr);
            customer.setDob(dob);

            customer.setPhoneNumber(phoneNumber);
            customer.setEmail(email);
            customer.setAddress(address);
            customer.setMember(true);


            boolean result = (new CustomerDAO()).registerMembership(customer);

            request.setAttribute("registrationResult", result);
            request.setAttribute("customer", customer);

            session.setAttribute("customer", customer);

            RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerView/StatusRegister.jsp");
            dispatcher.forward(request, response);

        } catch (ParseException e) {
            e.printStackTrace();
            request.setAttribute("error", "Định dạng ngày sinh không hợp lệ");
            RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerView/RegisterMemberFormView.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerView/RegisterMemberFormView.jsp");
            dispatcher.forward(request, response);
        }
    }
}
