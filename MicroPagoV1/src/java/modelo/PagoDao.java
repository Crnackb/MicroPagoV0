package modelo;

import java.util.List;

public interface PagoDao {
    int save(Pago p);
    List<Pago> getAll();
    boolean update(Pago pago);
    boolean delete(int id);
}