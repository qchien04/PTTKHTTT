package exam.qlst.DAO;


import exam.qlst.Model.Customer;
import exam.qlst.Model.Staff;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StaffDAO extends DAO {

    public StaffDAO() {
        super();
    }

    public Staff login(String username, String password) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM tblStaff WHERE username=? AND password=?";

            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                Staff staff = new Staff();
                staff.setId(rs.getInt("id"));
                staff.setFullName(rs.getString("fullName"));
                staff.setPhoneNumber(rs.getString("phoneNumber"));
                staff.setEmail(rs.getString("email"));
                staff.setAddress(rs.getString("address"));
                staff.setRole(rs.getString("role"));

                return staff;
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
