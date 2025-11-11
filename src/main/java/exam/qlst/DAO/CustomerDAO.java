package exam.qlst.DAO;


import exam.qlst.Model.Customer;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerDAO extends DAO {

    public CustomerDAO() {
        super();
    }


    public boolean registerMembership(Customer customer) {
        String sql = "UPDATE tblCustomer SET fullName = ?, dob = ?, phoneNumber = ?, email = ?, isMember = ?, address = ? WHERE id = ?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, customer.getFullName());
            ps.setDate(2, new java.sql.Date(customer.getDob().getTime()));
            ps.setString(3, customer.getPhoneNumber());
            ps.setString(4, customer.getEmail());
            ps.setBoolean(5, customer.isMember());
            ps.setString(6, customer.getAddress());
            ps.setInt(7, customer.getId());

            int rows = ps.executeUpdate();
            ps.close();

            System.out.println("Đăng ký thành viên: " + (rows > 0 ? "Thành công" : "Thất bại"));
            return rows > 0;

        } catch (SQLException e) {
            System.err.println("Lỗi registerMembership: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public Customer login(String username, String password) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM tblCustomer WHERE username=? AND password=?";

            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                Customer customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setUsername(rs.getString("username"));
                customer.setPassword(rs.getString("password"));
                customer.setFullName(rs.getString("fullName"));
                customer.setDob(rs.getDate("dob"));
                customer.setPhoneNumber(rs.getString("phoneNumber"));
                customer.setEmail(rs.getString("email"));
                customer.setMember(rs.getBoolean("isMember"));

                return customer;
            }

            return null;

        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
