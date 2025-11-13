package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PagoDaoposgre implements PagoDao {

    static final String URL = "jdbc:postgresql://localhost:5432/postgres";
    private static final String USER = "postgres";
    private static final String PASSWORD = "1234";

    public PagoDaoposgre() {}

    @Override
    public int save(Pago p) {
        String sql = "INSERT INTO pagos (monto, metodo, estado) VALUES (?, ?, ?)";
        int generatedId = 0;
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setDouble(1, p.getMonto());
            ps.setString(2, p.getMetodo());
            ps.setString(3, p.getEstado());
            ps.executeUpdate();
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    generatedId = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return generatedId;
    }

    @Override
    public List<Pago> getAll() {
        List<Pago> lista = new ArrayList<>();
        String sql = "SELECT id, monto, metodo, estado FROM pagos ORDER BY id DESC";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Pago p = new Pago(
                        rs.getInt("id"),
                        rs.getDouble("monto"),
                        rs.getString("metodo"),
                        rs.getString("estado")
                );
                lista.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    
    @Override
    public boolean update(Pago p) {
        String sql = "UPDATE pagos SET monto=?, metodo=?, estado=? WHERE id=?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDouble(1, p.getMonto());
            ps.setString(2, p.getMetodo());
            ps.setString(3, p.getEstado());
            ps.setInt(4, p.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM pagos WHERE id=?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}