package exam.qlst.DAO;
import exam.qlst.Model.Item;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ItemDAO extends DAO {
    public ItemDAO() {
    }

    public ItemDAO(Connection con) {
        super(con);
    }
    public boolean increaseStockQuantity(Item item, int quantity) {
        String sql = "UPDATE tblItem SET stockQuantity = stockQuantity + ? WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setInt(2, item.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Item> searchItems(String key) {
        List<Item> list = new ArrayList<>();
        String sql = "SELECT * FROM tblItem WHERE name LIKE ? OR type LIKE ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            String searchKey = "%" + key + "%";
            ps.setString(1, searchKey);
            ps.setString(2, searchKey);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Item item = new Item(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("type"),
                        rs.getString("unit"),
                        rs.getInt("stockQuantity"),
                        rs.getDouble("unitPrice")
                );
                list.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
