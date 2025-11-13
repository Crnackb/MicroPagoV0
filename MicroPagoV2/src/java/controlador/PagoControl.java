package controlador;

import java.util.List;
import modelo.Pago;
import modelo.PagoDao;
import modelo.DaoFactory; 
import vista.PagoDto;

public class PagoControl {
    // se usa el Factory para instanciar
    private final PagoDao pagodao;

    // el constructor recibe el tipo de DB para el Factory
    public PagoControl(String dbType) {
        // decide qué implementación de DAO devolver
        this.pagodao = DaoFactory.getPagoDao(dbType);
    }
    
    public int save(PagoDto pdto) {
        if (pdto == null) return 0;
        
        
        // se fuerza el estado inicial a "pendiente"
        Pago p = new Pago(pdto.monto(), pdto.metodo(), "pendiente"); 
        
        return pagodao.save(p);
    }

    public List<Pago> getAll() {
        return pagodao.getAll();
    }
    
    public boolean update(Pago pago) {
        // Aquí podrías agregar lógica de negocio antes de actualizar.
        // Por ej: if (pago.getEstado().equals("realizado")) { ... }
        return pagodao.update(pago);
    }

    public boolean delete(int id) {
        return pagodao.delete(id);
    }
}