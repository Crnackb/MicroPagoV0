package controlador;

import java.util.List;
import modelo.Pago;
import modelo.PagoDao;
import modelo.PagoDaoposgre;
import vista.PagoDto;

public class PagoControl {
    private final PagoDao pagodao = new PagoDaoposgre();

    public int save(PagoDto pdto) {
        if (pdto == null) return 0;
        Pago p = new Pago(pdto.monto(), pdto.metodo(), pdto.estado());
        return pagodao.save(p);
    }

    public List<Pago> getAll() {
        return pagodao.getAll();
    }
    
    public boolean update(Pago pago) {
    return pagodao.update(pago);
}

    public boolean delete(int id) {
        return pagodao.delete(id);
    }
}
