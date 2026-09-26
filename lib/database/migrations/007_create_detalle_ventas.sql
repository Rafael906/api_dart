CREATE TABLE IF NOT EXISTS detalle_ventas (
    id INT NOT NULL AUTO_INCREMENT,
    venta_id INT NOT NULL,
    producto_id INT NOT NULL,
    precio_venta DECIMAL(10,2) NOT NULL,
    cantidad INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (venta_id)
        REFERENCES ventas(id)
        ON DELETE CASCADE,
    FOREIGN KEY (producto_id)
        REFERENCES productos(id)
);