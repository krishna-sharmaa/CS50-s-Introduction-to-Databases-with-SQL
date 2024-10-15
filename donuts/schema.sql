CREATE TABLE ingredients (
    id INTEGER PRIMARY KEY,
    ingredient TEXT NOT NULL,
    price REAL NOT NULL
);

CREATE TABLE donuts (
    id INTEGER PRIMARY KEY,
    donut_name TEXT NOT NULL,
    is_gluten_free INTEGER NOT NULL CHECK (is_gluten_free IN (0,1)),
    price_per_donut REAL NOT NULL
);

CREATE TABLE customers (
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    second_name TEXT
);

CREATE TABLE donut_ingredients (
    donut_id INTEGER,
    ingredient_id INTEGER,
    FOREIGN KEY (donut_id) REFERENCES donuts (id),
    FOREIGN KEY (ingredient_id) REFERENCES ingredients (id),
    PRIMARY KEY (donut_id, ingredient_id)
);

CREATE TABLE orders (
    id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customers (id)
);

CREATE TABLE order_items (
    order_id INTEGER,
    donut_id INTEGER,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    FOREIGN KEY (order_id) REFERENCES orders (id),
    FOREIGN KEY (donut_id) REFERENCES donuts (id),
    PRIMARY KEY (order_id, donut_id)
);

