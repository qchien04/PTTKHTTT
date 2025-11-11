package exam.qlst.DAO;

import exam.qlst.Model.ImportInvoice;
import exam.qlst.Model.ImportItem;

import java.sql.*;

public class ImportInvoiceDAO extends DAO {
    public ImportInvoiceDAO() {
    }
    public ImportInvoiceDAO(Connection con) {
        super(con);
    }

    public ImportInvoice saveImportInvoice(ImportInvoice invoice) {
        System.out.println(invoice);
        String sql = "INSERT INTO tblImportInvoice (importDate, supplierId, WareHouseStaffid) VALUES (?, ?, ?)";
        try {
            con.setAutoCommit(false);

            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setDate(1, new java.sql.Date(invoice.getImportDate().getTime()));
            ps.setInt(2, invoice.getSupplier().getId());
            ps.setInt(3, invoice.getWarehouseStaff().getId());

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int invoiceId = rs.getInt(1);
                    invoice.setId(invoiceId);

                    ImportItemDAO importItemDAO = new ImportItemDAO(this.con);
                    for (ImportItem item : invoice.getImportItems()) {
                        if (!importItemDAO.saveImportItem(item, invoiceId)) {
                            con.rollback();
                            return null;
                        }
                    }

                    con.commit();
                    return invoice;
                }
            }
            con.rollback();
        } catch (SQLException e) {
            try {
                con.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                con.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}

