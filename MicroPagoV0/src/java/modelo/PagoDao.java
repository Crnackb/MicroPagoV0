package modelo;

import java.util.List;

public interface PagoDao {
    int save(Pago p);
    List<Pago> getAll();
}