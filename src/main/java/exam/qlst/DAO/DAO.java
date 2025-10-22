package exam.qlst.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/qlst?serverTimezone=UTC";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "chien1472004";

    protected Connection con;

    // Lấy connection tĩnh
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        // Nạp driver MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Trả connection
        return DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
    }

    // Constructor mở connection
    public DAO() {
        try {
            con = DAO.getConnection();
            System.out.println("Kết nối DB thành công!");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Lỗi kết nối DB: " + ex);
        }
    }

    public DAO(Connection con) {
        this.con = con;
    }

    // Test
    public static void main(String[] args) {
        DAO a = new DAO();
    }
}
