Sistema de Gestión de Pagos

Sistema CRUD completo para la administración de pagos, desarrollado con Java EE, PostgreSQL y una interfaz web para pruebas.

🚀 Características

✅ CRUD Completo: Crear, Leer, Actualizar y Eliminar pagos
🔒 Seguridad: Uso de PreparedStatement para prevenir SQL Injection
🏗️ Arquitectura MVC: Separación clara de capas (Modelo-Vista-Controlador)
📊 Estados de Pago: Pendiente, Completado, Cancelado (DE PRUEBAS)
💰 Métodos de Pago: Efectivo, Tarjeta, Transferencia (DE PRUEBAS)
🔄 API RESTful: Endpoints JSON para integración

📋 Requisitos Previos

JDK 17 o superior (USE JDK 24)
Apache Tomcat 10 o superior
PostgreSQL 12 o superior (USE POSTGRESQL 17)
aplicación java web
IDE recomendado: NetBeans

🛠️ Instalación
1. Clonar el repositorio
-bashgit clone https://github.com/tu-usuario/sistema-pagos.git
-cd sistema-pagos
2. Configurar la Base de Datos
Crea la base de datos y la tabla en PostgreSQL:
sql-- Crear la base de datos (si no existe)
CREATE DATABASE postgres;

-- Conectarse a la base de datos
\c postgres

-- Crear la tabla de pagos
CREATE TABLE pagos (
    id SERIAL PRIMARY KEY,
    monto NUMERIC(10,2) NOT NULL,
    metodo VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL
);

-- Insertar datos de prueba (opcional)
INSERT INTO pagos (monto, metodo, estado) VALUES
(150.00, 'efectivo', 'completado'),
(250.50, 'tarjeta', 'pendiente'),
(89.99, 'transferencia', 'cancelado');

3. Configurar las Credenciales de BD
Edita el archivo modelo/PagoDaoposgre.java:
javastatic final String URL = "jdbc:postgresql://localhost:5432/postgres";
private static final String USER = "tu_usuario";
private static final String PASSWORD = "tu_contraseña";
4. Desplegar en Tomcat 
Abre el proyecto en NetBeans
Click derecho → Clean and Build
Click derecho → Run
