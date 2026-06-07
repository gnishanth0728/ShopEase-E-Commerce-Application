
DROP DATABASE IF EXISTS ecommerce;
CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE categories (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    image_url VARCHAR(500)
);

CREATE TABLE products (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2),
    image_url VARCHAR(1000),
    category_id BIGINT,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

INSERT INTO categories(name,image_url)
VALUES
('Mobiles','mobile.png'),
('Laptops','laptop.png'),
('Headphones','headphone.png'),
('Smart Watches','watch.png'),
('Books','book.png'),
('Fashion','fashion.png'),
('Home Appliances','home.png'),
('Gaming','gaming.png'),
('Cameras','camera.png'),
('Sports','sports.png');

INSERT INTO products
(name,description,price,image_url,category_id)
VALUES
('iPhone 16 Pro','Apple flagship smartphone',119999,'https://picsum.photos/400/400?1',1),
('Samsung S25 Ultra','Samsung flagship smartphone',109999,'https://picsum.photos/400/400?2',1),
('Google Pixel 10','Google AI smartphone',89999,'https://picsum.photos/400/400?3',1),
('OnePlus 14','Premium Android phone',69999,'https://picsum.photos/400/400?4',1),
('Nothing Phone 4','Transparent design phone',49999,'https://picsum.photos/400/400?5',1),
('MacBook Pro M4','Apple laptop',189999,'https://picsum.photos/400/400?6',2),
('Dell XPS 15','Premium ultrabook',159999,'https://picsum.photos/400/400?7',2),
('Lenovo ThinkPad X1','Business laptop',149999,'https://picsum.photos/400/400?8',2),
('HP Spectre x360','Convertible laptop',139999,'https://picsum.photos/400/400?9',2),
('Asus ROG Zephyrus','Gaming laptop',179999,'https://picsum.photos/400/400?10',2),
('Sony XM5','Noise cancelling',29999,'https://picsum.photos/400/400?11',3),
('AirPods Pro 3','Apple earbuds',24999,'https://picsum.photos/400/400?12',3),
('Bose QC Ultra','Premium headphones',32999,'https://picsum.photos/400/400?13',3),
('JBL Live 770NC','Wireless headphones',14999,'https://picsum.photos/400/400?14',3),
('Sennheiser Momentum','Audiophile headset',34999,'https://picsum.photos/400/400?15',3),
('Apple Watch Ultra 3','Premium smartwatch',89999,'https://picsum.photos/400/400?16',4),
('Galaxy Watch 8','Samsung smartwatch',39999,'https://picsum.photos/400/400?17',4),
('Garmin Fenix','Sports smartwatch',69999,'https://picsum.photos/400/400?18',4),
('Fitbit Sense','Health tracking',24999,'https://picsum.photos/400/400?19',4),
('Amazfit GTR','Affordable smartwatch',14999,'https://picsum.photos/400/400?20',4),
('Clean Code','Software engineering',899,'https://picsum.photos/400/400?21',5),
('System Design','Architecture guide',1299,'https://picsum.photos/400/400?22',5),
('Kubernetes Up & Running','K8s guide',1599,'https://picsum.photos/400/400?23',5),
('Terraform Cookbook','IaC guide',1199,'https://picsum.photos/400/400?24',5),
('Spring Boot in Action','Java backend',999,'https://picsum.photos/400/400?25',5),
('Nike Air Max','Running shoes',8999,'https://picsum.photos/400/400?26',6),
('Adidas Ultraboost','Sports shoes',9999,'https://picsum.photos/400/400?27',6),
('Levis Jeans','Denim jeans',2999,'https://picsum.photos/400/400?28',6),
('Puma Hoodie','Casual hoodie',2499,'https://picsum.photos/400/400?29',6),
('Tommy Shirt','Premium shirt',3499,'https://picsum.photos/400/400?30',6),
('Dyson V15','Vacuum cleaner',54999,'https://picsum.photos/400/400?31',7),
('LG Air Purifier','Smart purifier',19999,'https://picsum.photos/400/400?32',7),
('Philips Iron','Steam iron',3999,'https://picsum.photos/400/400?33',7),
('Samsung Microwave','Microwave oven',14999,'https://picsum.photos/400/400?34',7),
('Bosch Dishwasher','Dishwasher',49999,'https://picsum.photos/400/400?35',7),
('PS5 Pro','Sony console',69999,'https://picsum.photos/400/400?36',8),
('Xbox Series X','Microsoft console',59999,'https://picsum.photos/400/400?37',8),
('Nintendo Switch 2','Portable gaming',44999,'https://picsum.photos/400/400?38',8),
('Logitech G Pro','Gaming mouse',12999,'https://picsum.photos/400/400?39',8),
('Razer Keyboard','Mechanical keyboard',14999,'https://picsum.photos/400/400?40',8),
('Sony A7 IV','Mirrorless camera',219999,'https://picsum.photos/400/400?41',9),
('Canon R6 II','Professional camera',209999,'https://picsum.photos/400/400?42',9),
('Nikon Z8','High-end camera',289999,'https://picsum.photos/400/400?43',9),
('DJI Pocket 3','Vlogging camera',59999,'https://picsum.photos/400/400?44',9),
('GoPro Hero 14','Action camera',49999,'https://picsum.photos/400/400?45',9),
('Cricket Bat','English willow bat',8999,'https://picsum.photos/400/400?46',10),
('Football','FIFA approved',1999,'https://picsum.photos/400/400?47',10),
('Tennis Racket','Professional racket',6999,'https://picsum.photos/400/400?48',10),
('Yoga Mat','Premium mat',1499,'https://picsum.photos/400/400?49',10),
('Dumbbell Set','Adjustable weights',9999,'https://picsum.photos/400/400?50',10);
