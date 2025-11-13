package modelo;

public class DaoFactory {
    static {
        try {
            // driver de Postgres
            Class.forName("org.postgresql.Driver");
            
            // cargar driver de Mongo
            // Class.forName("com.mongodb.jdbc.MongoDriver");
            
        } catch (ClassNotFoundException e) {
            System.err.println("Error: No se pudo cargar el driver de la base de datos.");
            e.printStackTrace();
        }
    }

    public static PagoDao getPagoDao(String dbType) {
        
        if (dbType.equalsIgnoreCase("POSTGRES")) {
            
            return new PagoDaoposgre();
            
        /**
        } else if (dbType.equalsIgnoreCase("MONGO")) {
            
            return new PagoDaoMongo();
        */    
        }
        else {
            throw new IllegalArgumentException("Tipo de base de datos no soportado: " + dbType);
        }
    }
}