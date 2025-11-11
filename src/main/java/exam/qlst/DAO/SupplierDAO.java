package exam.qlst.DAO;

import exam.qlst.Model.Item;
import exam.qlst.Model.Supplier;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SupplierDAO extends DAO {

    public List<Supplier> searchSuppliers(String key) {
        List<Supplier> list = new ArrayList<>();
        String sql = "SELECT * FROM tblSupplier WHERE name LIKE ? OR email LIKE ? OR phoneNumber LIKE ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            String searchKey = "%" + key + "%";
            ps.setString(1, searchKey);
            ps.setString(2, searchKey);
            ps.setString(3, searchKey);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Supplier s = new Supplier(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("phoneNumber")
                );
                list.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}

