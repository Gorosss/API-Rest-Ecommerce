-- Crear la tabla de productos
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    price DECIMAL(10, 2),
    discountPercentage DECIMAL(5, 2),
    rating DECIMAL(3, 2),
    stock INT,
    brand VARCHAR(255),
    category VARCHAR(255),
    thumbnail VARCHAR(255)
);

-- Crear la tabla de imágenes de productos
CREATE TABLE product_images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    image_url VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);


INSERT INTO products (id, title, description, price, discountPercentage, rating, stock, brand, category, thumbnail)
VALUES
(1, 'iPhone 9', 'An apple mobile which is nothing like apple', 549, 12.96, 4.69, 94, 'Apple', 'smartphones', 'https://cdn.dummyjson.com/product-images/1/thumbnail.jpg'),
(2, 'iPhone X', 'SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ...', 899, 17.94, 3.2, 34, 'Apple', 'smartphones', 'https://cdn.dummyjson.com/product-images/2/thumbnail.jpg'),
(3, 'Samsung Universe 9', 'Samsung''s new variant which goes beyond Galaxy to the Universe', 1249, 15.46, 4.09, 36, 'Samsung', 'smartphones', 'https://cdn.dummyjson.com/product-images/3/thumbnail.jpg'),
(4, 'OPPOF19', 'OPPO F19 is officially announced on April 2021.', 280, 17.91, 3.2, 123, 'OPPO', 'smartphones', 'https://cdn.dummyjson.com/product-images/4/thumbnail.jpg'),
(5, 'Huawei P30', 'Huawei''s re-badged P30 Pro New Edition was officially unveiled yesterday in Germany and now the device has made its way to the UK.', 499, 10.58, 4.09, 32, 'Huawei', 'smartphones', 'https://cdn.dummyjson.com/product-images/5/thumbnail.jpg'),
(6, 'MacBook Pro', 'MacBook Pro 2021 with mini-LED display may launch between September, November', 1749, 11.02, 4.57, 83, 'Apple', 'laptops', 'https://cdn.dummyjson.com/product-images/6/thumbnail.png'),
(7, 'Samsung Galaxy Book', 'Samsung Galaxy Book S (2020) Laptop With Intel Lakefield Chip, 8GB of RAM Launched', 1499, 4.15, 2, 50, 'Samsung', 'laptops', 'https://cdn.dummyjson.com/product-images/7/thumbnail.jpg'),
(8, 'Microsoft Surface Laptop 4', 'Style and speed. Stand out on HD video calls backed by Studio Mics. Capture ideas on the vibrant touchscreen.', 1499, 10.23, 3, 68, 'Microsoft Surface', 'laptops', 'https://cdn.dummyjson.com/product-images/8/thumbnail.jpg'),
(9, 'Infinix INBOOK', 'Infinix Inbook X1 Ci3 10th 8GB 256GB 14 Win10 Grey – 1 Year Warranty', 1099, 11.83, 4.54, 96, 'Infinix', 'laptops', 'https://cdn.dummyjson.com/product-images/9/thumbnail.jpg'),
(10, 'HP Pavilion 15-DK1056WM', 'HP Pavilion 15-DK1056WM Gaming Laptop 10th Gen Core i5, 8GB, 256GB SSD, GTX 1650 4GB, Windows 10', 1099, 6.18, 4.43, 89, 'HP Pavilion', 'laptops', 'https://cdn.dummyjson.com/product-images/10/thumbnail.jpeg'),
(11, 'perfume Oil', 'Mega Discount, Impression of Acqua Di Gio by GiorgioArmani concentrated attar perfume Oil', 13, 8.4, 1, 65, 'Impression of Acqua Di Gio', 'fragrances', 'https://cdn.dummyjson.com/product-images/11/thumbnail.jpg'),
(12, 'Brown Perfume', 'Royal_Mirage Sport Brown Perfume for Men & Women - 120ml', 40, 15.66, 4, 52, 'Royal_Mirage', 'fragrances', 'https://cdn.dummyjson.com/product-images/12/thumbnail.jpg'),
(13, 'Fog Scent Xpressio Perfume', 'Product details of Best Fog Scent Xpressio Perfume 100ml For Men cool long lasting perfumes for Men', 13, 8.14, 4.59, 61, 'Fog Scent Xpressio', 'fragrances', 'https://cdn.dummyjson.com/product-images/13/thumbnail.webp'),
(14, 'Non-Alcoholic Concentrated Perfume Oil', 'Original Al Munakh® by Mahal Al Musk | Our Impression of Climate | 6ml Non-Alcoholic Concentrated Perfume Oil', 120, 15.6, 4.21, 114, 'Al Munakh', 'fragrances', 'https://cdn.dummyjson.com/product-images/14/thumbnail.jpg'),
(15, 'Eau De Perfume Spray', 'Genuine  Al-Rehab spray perfume from UAE/Saudi Arabia/Yemen High Quality', 30, 10.99, 4.7, 105, 'Lord - Al-Rehab', 'fragrances', 'https://cdn.dummyjson.com/product-images/15/thumbnail.jpg'),
(16, 'Hyaluronic Acid Serum', 'L''OrÃ©al Paris introduces Hyaluron Expert Replumping Serum formulated with 1.5% Hyaluronic Acid', 19, 13.31, 4.83, 110, 'L''Oreal Paris', 'skincare', 'https://cdn.dummyjson.com/product-images/16/thumbnail.jpg'),
(17, 'Tree Oil 30ml', 'Tea tree oil contains a number of compounds, including terpinen-4-ol, that have been shown to kill certain bacteria,', 12, 4.09, 4.52, 78, 'Hemani Tea', 'skincare', 'https://cdn.dummyjson.com/product-images/17/thumbnail.jpg'),
(18, 'Oil Free Moisturizer 100ml', 'Dermive Oil Free Moisturizer with SPF 20 is specifically formulated with ceramides, hyaluronic acid & sunscreen.', 40, 13.1, 4.56, 88, 'Dermive', 'skincare', 'https://cdn.dummyjson.com/product-images/18/thumbnail.jpg'),
(19, 'Skin Beauty Serum.', 'Product name: rorec collagen hyaluronic acid white face serum riceNet weight: 15 m', 46, 10.68, 4.42, 54, 'ROREC White Rice', 'skincare', 'https://cdn.dummyjson.com/product-images/19/thumbnail.jpg');


-- Para el producto 1
INSERT INTO product_images (product_id, image_url) VALUES
(1, 'https://cdn.dummyjson.com/product-images/1/1.jpg'),
(1, 'https://cdn.dummyjson.com/product-images/1/2.jpg'),
(1, 'https://cdn.dummyjson.com/product-images/1/3.jpg'),
(1, 'https://cdn.dummyjson.com/product-images/1/4.jpg'),
(1, 'https://cdn.dummyjson.com/product-images/1/thumbnail.jpg');

-- Para el producto 2
INSERT INTO product_images (product_id, image_url) VALUES
(2, 'https://cdn.dummyjson.com/product-images/2/1.jpg'),
(2, 'https://cdn.dummyjson.com/product-images/2/2.jpg'),
(2, 'https://cdn.dummyjson.com/product-images/2/3.jpg'),
(2, 'https://cdn.dummyjson.com/product-images/2/thumbnail.jpg');

-- Para el producto 3
INSERT INTO product_images (product_id, image_url) VALUES
(3, 'https://cdn.dummyjson.com/product-images/3/1.jpg');

-- Para el producto 4
INSERT INTO product_images (product_id, image_url) VALUES
(4, 'https://cdn.dummyjson.com/product-images/4/1.jpg'),
(4, 'https://cdn.dummyjson.com/product-images/4/2.jpg'),
(4, 'https://cdn.dummyjson.com/product-images/4/3.jpg'),
(4, 'https://cdn.dummyjson.com/product-images/4/4.jpg'),
(4, 'https://cdn.dummyjson.com/product-images/4/thumbnail.jpg');

-- Para el producto 5
INSERT INTO product_images (product_id, image_url) VALUES
(5, 'https://cdn.dummyjson.com/product-images/5/1.jpg'),
(5, 'https://cdn.dummyjson.com/product-images/5/2.jpg'),
(5, 'https://cdn.dummyjson.com/product-images/5/3.jpg');

-- Para el producto 6
INSERT INTO product_images (product_id, image_url) VALUES
(6, 'https://cdn.dummyjson.com/product-images/6/1.png'),
(6, 'https://cdn.dummyjson.com/product-images/6/2.jpg'),
(6, 'https://cdn.dummyjson.com/product-images/6/3.png'),
(6, 'https://cdn.dummyjson.com/product-images/6/4.jpg');

-- Para el producto 7
INSERT INTO product_images (product_id, image_url) VALUES
(7, 'https://cdn.dummyjson.com/product-images/7/1.jpg'),
(7, 'https://cdn.dummyjson.com/product-images/7/2.jpg'),
(7, 'https://cdn.dummyjson.com/product-images/7/3.jpg'),
(7, 'https://cdn.dummyjson.com/product-images/7/thumbnail.jpg');

-- Para el producto 8
INSERT INTO product_images (product_id, image_url) VALUES
(8, 'https://cdn.dummyjson.com/product-images/8/1.jpg'),
(8, 'https://cdn.dummyjson.com/product-images/8/2.jpg'),
(8, 'https://cdn.dummyjson.com/product-images/8/3.jpg'),
(8, 'https://cdn.dummyjson.com/product-images/8/4.jpg'),
(8, 'https://cdn.dummyjson.com/product-images/8/thumbnail.jpg');

-- Para el producto 9
INSERT INTO product_images (product_id, image_url) VALUES
(9, 'https://cdn.dummyjson.com/product-images/9/1.jpg'),
(9, 'https://cdn.dummyjson.com/product-images/9/2.png'),
(9, 'https://cdn.dummyjson.com/product-images/9/3.png'),
(9, 'https://cdn.dummyjson.com/product-images/9/4.jpg'),
(9, 'https://cdn.dummyjson.com/product-images/9/thumbnail.jpg');

-- Para el producto 10
INSERT INTO product_images (product_id, image_url) VALUES
(10, 'https://cdn.dummyjson.com/product-images/10/1.jpg'),
(10, 'https://cdn.dummyjson.com/product-images/10/2.jpg'),
(10, 'https://cdn.dummyjson.com/product-images/10/3.jpg'),
(10, 'https://cdn.dummyjson.com/product-images/10/thumbnail.jpeg');

-- Para el producto 11
INSERT INTO product_images (product_id, image_url) VALUES
(11, 'https://cdn.dummyjson.com/product-images/11/1.jpg'),
(11, 'https://cdn.dummyjson.com/product-images/11/2.jpg'),
(11, 'https://cdn.dummyjson.com/product-images/11/3.jpg'),
(11, 'https://cdn.dummyjson.com/product-images/11/thumbnail.jpg');

-- Para el producto 12
INSERT INTO product_images (product_id, image_url) VALUES
(12, 'https://cdn.dummyjson.com/product-images/12/1.jpg'),
(12, 'https://cdn.dummyjson.com/product-images/12/2.jpg'),
(12, 'https://cdn.dummyjson.com/product-images/12/3.png'),
(12, 'https://cdn.dummyjson.com/product-images/12/4.jpg'),
(12, 'https://cdn.dummyjson.com/product-images/12/thumbnail.jpg');

-- Para el producto 13
INSERT INTO product_images (product_id, image_url) VALUES
(13, 'https://cdn.dummyjson.com/product-images/13/1.jpg'),
(13, 'https://cdn.dummyjson.com/product-images/13/2.png'),
(13, 'https://cdn.dummyjson.com/product-images/13/3.jpg'),
(13, 'https://cdn.dummyjson.com/product-images/13/4.jpg'),
(13, 'https://cdn.dummyjson.com/product-images/13/thumbnail.webp');

-- Para el producto 14
INSERT INTO product_images (product_id, image_url) VALUES
(14, 'https://cdn.dummyjson.com/product-images/14/1.jpg'),
(14, 'https://cdn.dummyjson.com/product-images/14/2.jpg'),
(14, 'https://cdn.dummyjson.com/product-images/14/3.jpg'),
(14, 'https://cdn.dummyjson.com/product-images/14/thumbnail.jpg');

-- Para el producto 15
INSERT INTO product_images (product_id, image_url) VALUES
(15, 'https://cdn.dummyjson.com/product-images/15/1.jpg'),
(15, 'https://cdn.dummyjson.com/product-images/15/2.jpg'),
(15, 'https://cdn.dummyjson.com/product-images/15/3.jpg'),
(15, 'https://cdn.dummyjson.com/product-images/15/4.jpg'),
(15, 'https://cdn.dummyjson.com/product-images/15/thumbnail.jpg');

-- Para el producto 16
INSERT INTO product_images (product_id, image_url) VALUES
(16, 'https://cdn.dummyjson.com/product-images/16/1.png'),
(16, 'https://cdn.dummyjson.com/product-images/16/2.webp'),
(16, 'https://cdn.dummyjson.com/product-images/16/3.jpg'),
(16, 'https://cdn.dummyjson.com/product-images/16/4.jpg'),
(16, 'https://cdn.dummyjson.com/product-images/16/thumbnail.jpg');

-- Para el producto 17
INSERT INTO product_images (product_id, image_url) VALUES
(17, 'https://cdn.dummyjson.com/product-images/17/1.jpg'),
(17, 'https://cdn.dummyjson.com/product-images/17/2.jpg'),
(17, 'https://cdn.dummyjson.com/product-images/17/3.jpg'),
(17, 'https://cdn.dummyjson.com/product-images/17/thumbnail.jpg');

-- Para el producto 18
INSERT INTO product_images (product_id, image_url) VALUES
(18, 'https://cdn.dummyjson.com/product-images/18/1.jpg'),
(18, 'https://cdn.dummyjson.com/product-images/18/2.jpg'),
(18, 'https://cdn.dummyjson.com/product-images/18/3.jpg'),
(18, 'https://cdn.dummyjson.com/product-images/18/4.jpg'),
(18, 'https://cdn.dummyjson.com/product-images/18/thumbnail.jpg');

-- Para el producto 19
INSERT INTO product_images (product_id, image_url) VALUES
(19, 'https://cdn.dummyjson.com/product-images/19/1.jpg'),
(19, 'https://cdn.dummyjson.com/product-images/19/2.jpg'),
(19, 'https://cdn.dummyjson.com/product-images/19/3.png'),
(19, 'https://cdn.dummyjson.com/product-images/19/thumbnail.jpg');