package exam.qlst.DAO;

import exam.qlst.Model.ImportItem;

import java.sql.*;

public class ImportItemDAO extends DAO {
    public ImportItemDAO() {
    }
    public ImportItemDAO(Connection con) {
        super(con);
    }

    public boolean saveImportItem(ImportItem importItem, int invoiceId) {
        String sql = "INSERT INTO tblImportItem (quantity, price, note, itemId, ImportInvoiceId) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, importItem.getQuantity());
            ps.setDouble(2, importItem.getPrice());
            ps.setString(3, importItem.getNote());
            ps.setInt(4, importItem.getItem().getId());
            ps.setInt(5, invoiceId);

            int result = ps.executeUpdate();

            if (result > 0) {
                ItemDAO itemDAO = new ItemDAO(con);
                return itemDAO.increaseStockQuantity(importItem.getItem(), importItem.getQuantity());
            }

            return false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
