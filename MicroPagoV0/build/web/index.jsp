<%-- 
    Document   : pagos
    Created on : 10/11/2025, 2:41:33 p. m.
    Author     : JONATHAN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Gestión de Pagos</title>
    <script>
        async function listar() {
            const res = await fetch('pagos');
            const pagos = await res.json();
            const tbody = document.getElementById('lista');
            tbody.innerHTML = '';
            pagos.forEach(p => {
                const row = `<tr><td>${p.id}</td><td>${p.monto}</td><td>${p.metodo}</td><td>${p.estado}</td></tr>`;
                tbody.innerHTML += row;
            });
        }

        async function crear(e) {
            e.preventDefault();
            const data = {
                monto: parseFloat(document.getElementById('monto').value),
                metodo: document.getElementById('metodo').value,
                estado: document.getElementById('estado').value
            };
            const res = await fetch('pagos', {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify(data)
            });
            const result = await res.json();
            alert(result.status === 'ok' ? 'Pago creado con éxito' : 'Error al crear pago');
            listar();
        }

        window.onload = listar;
    </script>
</head>
<body>
    <h1>Pagos</h1>
    <form onsubmit="crear(event)">
        <label>Monto: <input id="monto" type="number" step="0.01" required></label><br>
        <label>Método: <input id="metodo" type="text" value="efectivo" required></label><br>
        <label>Estado: <input id="estado" type="text" value="pendiente" required></label><br>
        <button type="submit">Crear pago</button>
    </form>

    <h2>Lista de pagos</h2>
    <table border="1">
        <thead><tr><th>ID</th><th>Monto</th><th>Método</th><th>Estado</th></tr></thead>
        <tbody id="lista"></tbody>
    </table>
</body>
</html>