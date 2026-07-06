-  CONSULTAS DE LECTURA (SELECT)
-- Ver todos los datos
SELECT * FROM nombre_tabla;

-- Contar registros (útil para verificar importaciones)
SELECT COUNT(*) FROM nombre_tabla;

-- Filtrar con condiciones
SELECT * FROM suppliers WHERE city_id = 1;

-- Ordenar resultados (ASC: A-Z, DESC: Z-A)
SELECT * FROM products ORDER BY product_name ASC;

--  RELACIONAR TABLAS (JOINS - Esencial para el Parcial)
-- Unir tablas usando sus llaves (Ej: Suppliers con Cities)
SELECT s.supplier_name, c.city_name 
FROM suppliers s 
JOIN cities c ON s.city_id = c.city_id;

--  GESTIÓN DE DATOS (CRUD)
-- Insertar un nuevo registro
INSERT INTO cities (city_name) VALUES ('Nombre_de_la_ciudad');

-- Actualizar un dato
UPDATE cities SET city_name = 'Nuevo_Nombre' WHERE city_id = 1;

-- Eliminar un registro
DELETE FROM cities WHERE city_id = 5;

--  CONSULTAS AVANZADAS (ANÁLISIS Y ESTADÍSTICA)

-- Agrupar y contar (Ej: ¿Cuántos proveedores hay por cada ciudad?)
SELECT city_id, COUNT(*) as total_proveedores 
FROM suppliers 
GROUP BY city_id;

-- Valores máximo, mínimo y promedio (Ej: Precios de productos)
SELECT AVG(price) as precio_promedio, MAX(price) as precio_maximo, MIN(price) as precio_minimo 
FROM products;

-- Filtrar grupos (Ej: Ciudades que tengan más de 3 proveedores)
SELECT city_id, COUNT(*) as total 
FROM suppliers 
GROUP BY city_id 
HAVING COUNT(*) > 3;

--  CONSULTAS DE BÚSQUEDA (LIKE)
-- Buscar nombres que empiecen por una letra (Ej: Ciudades que empiezan con 'B')
SELECT * FROM cities WHERE city_name LIKE 'B%';

-- Buscar nombres que contengan una palabra en cualquier parte
SELECT * FROM products WHERE product_name LIKE '%teclado%';

--  CONSULTAS PARA RELACIONES COMPLEJAS
-- Unir 3 tablas (Ej: Productos, Categorías y Proveedores)
SELECT p.product_name, c.category_name, s.supplier_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN suppliers s ON p.supplier_id = s.supplier_id;

--  MANEJO DE FECHAS (Si tu proyecto usa fechas)
-- Filtrar registros de un mes específico (Ej: Ventas de junio)
SELECT * FROM purchases 
WHERE MONTH(purchase_date) = 6 AND YEAR(purchase_date) = 2026;

--  LIMITAR RESULTADOS
-- Ver los 5 productos más caros (útil para reportes rápidos)
SELECT product_name, price 
FROM products 
ORDER BY price DESC 
LIMIT 5;

--  ELIMINAR TODO DE UNA TABLA (Con cuidado)
-- Borra todo, pero mantiene la estructura (más rápido que DELETE)
TRUNCATE TABLE nombre_tabla;
