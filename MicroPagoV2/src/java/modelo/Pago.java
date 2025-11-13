package modelo;

public class Pago {
    private int id;
    private double monto;
    private String metodo;
    private String estado;

    public Pago() {
    }

    public Pago(int id, double monto, String metodo, String estado) {
        this.id = id;
        this.monto = monto;
        this.metodo = metodo;
        this.estado = estado;
    }

    public Pago(double monto, String metodo, String estado) {
        this.monto = monto;
        this.metodo = metodo;
        this.estado = estado;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMetodo() {
        return metodo;
    }

    public void setMetodo(String metodo) {
        this.metodo = metodo;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
    
    
    

