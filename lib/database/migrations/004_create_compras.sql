CREATE TABLE compras (
    id INT NOT NULL AUTO_INCREMENT,
    proveedor_id INT NOT NULL,
    estado_compra_id INT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL DEFAULT 0.00,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (id),

    FOREIGN KEY (proveedor_id)
        REFERENCES proveedores(id),

    FOREIGN KEY (estado_compra_id)
        REFERENCES estados_compra(id)
);