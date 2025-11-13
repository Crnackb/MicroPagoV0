/**
* 
package modelo;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.FindOneAndUpdateOptions;
import com.mongodb.client.model.ReturnDocument;
import com.mongodb.client.model.Updates;
import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;
import org.bson.Document;
import org.bson.conversions.Bson;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Consumer;

public class PagoDaoMongo implements PagoDao {
    
    private final MongoClient mongoClient;
    private final MongoDatabase database;
    private final MongoCollection<Document> collection;
    private final MongoCollection<Document> countersCollection;
    
    private static final String PAGOS_COUNTER_ID = "pagos_id";

    public PagoDaoMongo() {
        String uri = "mongodb://localhost:27017";
        this.mongoClient = MongoClients.create(uri);

        this.database = mongoClient.getDatabase("pagos_db");
        this.collection = database.getCollection("pagos");
        
        this.countersCollection = database.getCollection("counters");

        Document counter = countersCollection.find(Filters.eq("_id", PAGOS_COUNTER_ID)).first();
        if (counter == null) {
            countersCollection.insertOne(new Document("_id", PAGOS_COUNTER_ID).append("seq", 0));
        }
    }

    private int getNextId() {
        Bson filter = Filters.eq("_id", PAGOS_COUNTER_ID);
        Bson update = Updates.inc("seq", 1);
        
        FindOneAndUpdateOptions options = new FindOneAndUpdateOptions()
                .returnDocument(ReturnDocument.AFTER);

        Document result = countersCollection.findOneAndUpdate(filter, update, options);
        
        if (result == null) {
            throw new RuntimeException("No se pudo obtener el contador de secuencia");
        }
        
        return result.getInteger("seq");
    }

    private Document pagoToDocument(Pago p) {
        return new Document()
                .append("id", p.getId()) // Guardamos el ID numérico
                .append("monto", p.getMonto())
                .append("metodo", p.getMetodo())
                .append("estado", p.getEstado());
    }

    private Pago documentToPago(Document doc) {
        if (doc == null) return null;
        
        return new Pago(
                doc.getInteger("id"),
                doc.getDouble("monto"),
                doc.getString("metodo"),
                doc.getString("estado")
        );
    }

    @Override
    public int save(Pago p) {
        try {
            int newId = getNextId();
            
            p.setId(newId);

            Document doc = pagoToDocument(p);
            collection.insertOne(doc);
            
            return newId;

        } catch (Exception e) {
            e.printStackTrace();
            return 0; 
        }
    }

    @Override
    public List<Pago> getAll() {
        List<Pago> lista = new ArrayList<>();
        try {
            collection.find().forEach((Consumer<Document>) doc -> {
                lista.add(documentToPago(doc));
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    @Override
    public boolean update(Pago pago) {
        try {
            Bson filter = Filters.eq("id", pago.getId());

            Bson update = Updates.combine(
                    Updates.set("monto", pago.getMonto()),
                    Updates.set("metodo", pago.getMetodo()),
                    Updates.set("estado", pago.getEstado())
            );

            UpdateResult result = collection.updateOne(filter, update);
            
            return result.getModifiedCount() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(int id) {
        try {
            Bson filter = Filters.eq("id", id);
            
            DeleteResult result = collection.deleteOne(filter);
            
            return result.getDeletedCount() > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
*/