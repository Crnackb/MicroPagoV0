package servlet;

import controlador.PagoControl;
import modelo.Pago;
import vista.PagoDto;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/pagos")
public class PagoServlet extends HttpServlet {

    private final PagoControl control = new PagoControl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json;charset=UTF-8");
        List<Pago> pagos = control.getAll();

        JSONArray jsonArray = new JSONArray();
        for (Pago p : pagos) {
            JSONObject obj = new JSONObject();
            obj.put("id", p.getId());
            obj.put("monto", p.getMonto());
            obj.put("metodo", p.getMetodo());
            obj.put("estado", p.getEstado());
            jsonArray.put(obj);
        }

        response.getWriter().write(jsonArray.toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json;charset=UTF-8");

        try {
            StringBuilder sb = new StringBuilder();
            String line;
            try (BufferedReader reader = request.getReader()) {
                while ((line = reader.readLine()) != null) {
                    sb.append(line);
                }
            }

            JSONObject json = new JSONObject(sb.toString());
            double monto = json.getDouble("monto");
            String metodo = json.getString("metodo");
            String estado = json.getString("estado");

            PagoDto nuevo = new PagoDto(monto, metodo, estado);
            int id = control.save(nuevo);

            JSONObject respuesta = new JSONObject();
            respuesta.put("status", "ok");
            respuesta.put("id", id);

            response.getWriter().write(respuesta.toString());

        } catch (Exception e) {
            e.printStackTrace();
            JSONObject error = new JSONObject();
            error.put("status", "error");
            error.put("mensaje", e.getMessage());
            response.getWriter().write(error.toString());
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}