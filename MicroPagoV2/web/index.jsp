<%-- 
    Document   : pagos
    Created on : 10/11/2025, 7:54:44 p. m.
    Author     : JONATHAN
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Pagos - CRUD</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .header {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            margin-bottom: 30px;
            text-align: center;
        }
        
        .header h1 {
            color: #667eea;
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        
        .header p {
            color: #666;
            font-size: 1.1em;
        }
        
        .card {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            margin-bottom: 30px;
        }
        
        .card h2 {
            color: #333;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 3px solid #667eea;
        }
        
        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            margin-bottom: 20px;
        }
        
        .form-group {
            display: flex;
            flex-direction: column;
        }
        
        .form-group label {
            font-weight: 600;
            margin-bottom: 8px;
            color: #555;
        }
        
        .form-group input,
        .form-group select {
            padding: 12px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1em;
            transition: all 0.3s;
        }
        
        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }
        
        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 8px;
            font-size: 1em;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(102, 126, 234, 0.4);
        }
        
        .btn-success {
            background: #10b981;
            color: white;
        }
        
        .btn-success:hover {
            background: #059669;
        }
        
        .btn-danger {
            background: #ef4444;
            color: white;
            padding: 8px 16px;
            font-size: 0.9em;
        }
        
        .btn-danger:hover {
            background: #dc2626;
        }
        
        .btn-warning {
            background: #f59e0b;
            color: white;
            padding: 8px 16px;
            font-size: 0.9em;
        }
        
        .btn-warning:hover {
            background: #d97706;
        }
        
        .btn-cancel {
            background: #6b7280;
            color: white;
            margin-left: 10px;
        }
        
        .btn-cancel:hover {
            background: #4b5563;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        thead {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        th {
            padding: 15px;
            text-align: left;
            font-weight: 600;
        }
        
        td {
            padding: 15px;
            border-bottom: 1px solid #e0e0e0;
        }
        
        tbody tr {
            transition: background 0.2s;
        }
        
        tbody tr:hover {
            background: #f3f4f6;
        }
        
        .badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 0.85em;
            font-weight: 600;
            display: inline-block;
        }
        
        .badge-pendiente {
            background: #fef3c7;
            color: #92400e;
        }
        
        .badge-completado {
            background: #d1fae5;
            color: #065f46;
        }
        
        .badge-cancelado {
            background: #fee2e2;
            color: #991b1b;
        }
        
        .actions {
            display: flex;
            gap: 8px;
        }
        
        .alert {
            padding: 15px 20px;
            border-radius: 8px;
            margin-bottom: 20px;
            display: none;
            animation: slideIn 0.3s;
        }
        
        .alert-success {
            background: #d1fae5;
            color: #065f46;
            border-left: 4px solid #10b981;
        }
        
        .alert-error {
            background: #fee2e2;
            color: #991b1b;
            border-left: 4px solid #ef4444;
        }
        
        @keyframes slideIn {
            from {
                transform: translateY(-20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
        
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #999;
        }
        
        .empty-state svg {
            width: 80px;
            height: 80px;
            margin-bottom: 20px;
            opacity: 0.3;
        }
        
        #editSection {
            display: none;
            background: #fffbeb;
            border: 2px solid #f59e0b;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>💳 Sistema de Gestión de Pagos</h1>
            <p>CRUD completo para administrar pagos</p>
        </div>
        
        <div id="alertBox" class="alert"></div>
        
        <!-- Sección de Edición -->
        <div id="editSection" class="card">
            <h2>✏️ Editar Pago</h2>
            <input type="hidden" id="editId">
            <div class="form-grid">
                <div class="form-group">
                    <label for="editMonto">Monto ($)</label>
                    <input type="number" id="editMonto" step="0.01" required>
                </div>
                <div class="form-group">
                    <label for="editMetodo">Método de Pago</label>
                    <select id="editMetodo" required>
                        <option value="efectivo">Efectivo</option>
                        <option value="tarjeta">Tarjeta</option>
                        <option value="transferencia">Transferencia</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="editEstado">Estado</label>
                    <select id="editEstado" required>
                        <option value="pendiente">Pendiente</option>
                        <option value="completado">Completado</option>
                        <option value="cancelado">Cancelado</option>
                    </select>
                </div>
            </div>
            <button class="btn btn-success" onclick="actualizarPago()">💾 Guardar Cambios</button>
            <button class="btn btn-cancel" onclick="cancelarEdicion()">❌ Cancelar</button>
        </div>
        
        <!-- Formulario de Creación -->
        <div class="card">
            <h2>➕ Crear Nuevo Pago</h2>
            <form id="formCrear" onsubmit="crearPago(event)">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="monto">Monto ($)</label>
                        <input type="number" id="monto" step="0.01" required placeholder="Ej: 150.00">
                    </div>
                    <div class="form-group">
                        <label for="metodo">Método de Pago</label>
                        <select id="metodo" required>
                            <option value="efectivo">Efectivo</option>
                            <option value="tarjeta">Tarjeta</option>
                            <option value="transferencia">Transferencia</option>
                        </select>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">✨ Crear Pago</button>
            </form>
        </div>
        
        <!-- Lista de Pagos -->
        <div class="card">
            <h2>📋 Lista de Pagos</h2>
            <div id="tablaContainer">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Monto</th>
                            <th>Método</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="listaPagos">
                        <tr>
                            <td colspan="5">
                                <div class="empty-state">
                                    <p>Cargando pagos...</p>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        // Cargar pagos al iniciar
        window.onload = function() {
            listarPagos();
        };

        // Función para mostrar alertas
        function mostrarAlerta(mensaje, tipo) {
            const alertBox = document.getElementById('alertBox');
            alertBox.className = 'alert alert-' + tipo;
            alertBox.textContent = mensaje;
            alertBox.style.display = 'block';
            
            setTimeout(function() {
                alertBox.style.display = 'none';
            }, 4000);
        }

        // Listar todos los pagos
        async function listarPagos() {
            try {
                const response = await fetch('pagos');
                if (!response.ok) throw new Error('Error al cargar pagos');
                
                const pagos = await response.json();
                const tbody = document.getElementById('listaPagos');
                
                if (pagos.length === 0) {
                    tbody.innerHTML = '<tr><td colspan="5"><div class="empty-state"><p>📭 No hay pagos registrados</p><p style="font-size: 0.9em; margin-top: 10px;">Crea tu primer pago usando el formulario arriba</p></div></td></tr>';
                    return;
                }
                
                let html = '';
                for (let i = 0; i < pagos.length; i++) {
                    const p = pagos[i];
                    const montoFormateado = parseFloat(p.monto).toFixed(2);
                    const metodoCapitalizado = p.metodo.charAt(0).toUpperCase() + p.metodo.slice(1);
                    const estadoCapitalizado = p.estado.charAt(0).toUpperCase() + p.estado.slice(1);
                    
                    html += '<tr>';
                    html += '<td><strong>#' + p.id + '</strong></td>';
                    html += '<td>$' + montoFormateado + '</td>';
                    html += '<td>' + metodoCapitalizado + '</td>';
                    html += '<td><span class="badge badge-' + p.estado + '">' + estadoCapitalizado + '</span></td>';
                    html += '<td><div class="actions">';
                    html += '<button class="btn btn-warning" onclick="editarPago(' + p.id + ', ' + p.monto + ', \'' + p.metodo + '\', \'' + p.estado + '\')">✏️ Editar</button>';
                    html += '<button class="btn btn-danger" onclick="eliminarPago(' + p.id + ')">🗑️ Eliminar</button>';
                    html += '</div></td>';
                    html += '</tr>';
                }
                
                tbody.innerHTML = html;
                
            } catch (error) {
                console.error('Error:', error);
                mostrarAlerta('❌ Error al cargar los pagos', 'error');
            }
        }

        // Crear nuevo pago
        async function crearPago(event) {
            event.preventDefault();
    
            // Objeto 'data' modificado (sin 'estado')
            const data = {
                monto: parseFloat(document.getElementById('monto').value),
                metodo: document.getElementById('metodo').value
                // La línea 'estado: ...' ha sido removida
            };
    
            try {
                const response = await fetch('pagos', {
                    method: 'POST',
                    headers: {'Content-Type': 'application/json'},
                    body: JSON.stringify(data)
                });
        
                const result = await response.json();
        
                if (result.status === 'ok') {
                    // El servlet ahora responde con 'estado_inicial'
                    // Podemos usarlo si queremos, pero el mensaje actual está bien.
                    mostrarAlerta('✅ Pago #' + result.id + ' creado como "' + result.estado_inicial + '"', 'success');
                    document.getElementById('formCrear').reset();
                    listarPagos();
                } else {
                    mostrarAlerta('❌ Error al crear el pago', 'error');
                }
            } catch (error) {
                console.error('Error:', error);
                mostrarAlerta('❌ Error de conexión', 'error');
            }
        }

        // Preparar edición
        function editarPago(id, monto, metodo, estado) {
            document.getElementById('editSection').style.display = 'block';
            document.getElementById('editId').value = id;
            document.getElementById('editMonto').value = monto;
            document.getElementById('editMetodo').value = metodo;
            document.getElementById('editEstado').value = estado;
            
            // Scroll suave hacia la sección de edición
            document.getElementById('editSection').scrollIntoView({ behavior: 'smooth', block: 'center' });
        }

        // Cancelar edición
        function cancelarEdicion() {
            document.getElementById('editSection').style.display = 'none';
            document.getElementById('editId').value = '';
        }

        // Actualizar pago
        async function actualizarPago() {
            const data = {
                id: parseInt(document.getElementById('editId').value),
                monto: parseFloat(document.getElementById('editMonto').value),
                metodo: document.getElementById('editMetodo').value,
                estado: document.getElementById('editEstado').value
            };
            
            try {
                const response = await fetch('pagos', {
                    method: 'PUT',
                    headers: {'Content-Type': 'application/json'},
                    body: JSON.stringify(data)
                });
                
                const result = await response.json();
                
                if (result.status === 'ok') {
                    mostrarAlerta('✅ Pago #' + data.id + ' actualizado correctamente', 'success');
                    cancelarEdicion();
                    listarPagos();
                } else {
                    mostrarAlerta('❌ ' + result.mensaje, 'error');
                }
            } catch (error) {
                console.error('Error:', error);
                mostrarAlerta('❌ Error de conexión', 'error');
            }
        }

        // Eliminar pago
        async function eliminarPago(id) {
            if (!confirm('¿Estás seguro de eliminar el pago #' + id + '?')) {
                return;
            }
            
            try {
                const response = await fetch('pagos', {
                    method: 'DELETE',
                    headers: {'Content-Type': 'application/json'},
                    body: JSON.stringify({ id: id })
                });
                
                const result = await response.json();
                
                if (result.status === 'ok') {
                    mostrarAlerta('✅ Pago #' + id + ' eliminado correctamente', 'success');
                    listarPagos();
                } else {
                    mostrarAlerta('❌ ' + result.mensaje, 'error');
                }
            } catch (error) {
                console.error('Error:', error);
                mostrarAlerta('❌ Error de conexión', 'error');
            }
        }
    </script>
</body>
</html>