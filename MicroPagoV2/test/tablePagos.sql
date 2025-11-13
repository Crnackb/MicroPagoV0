/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/SQLTemplate.sql to edit this template
 */
/**
 * Author:  JONATHAN
 * Created: 10/11/2025
 */

 CREATE TABLE pagos (
    id SERIAL PRIMARY KEY,
    monto DECIMAL(10,2) NOT NULL,
    metodo VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL
);




