CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DOUBLE PRECISION NOT NULL
);

INSERT INTO products(name, price)
VALUES
('Keyboard', 100),
('Mouse', 50);