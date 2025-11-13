package vista;

// El estado no se recibe en la creación, se gestionará internamente.
public record PagoDto(double monto, String metodo) { 
}