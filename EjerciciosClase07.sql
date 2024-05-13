--PPT07

-- Ejercicio 01
SELECT L.Categoria, SUM(L.Precio * V.Cantidad) AS TotalVentas
FROM Libros AS L
JOIN Ventas AS V ON L.ID_Libro = V.ID_Libro
GROUP BY L.Categoria;

-- Ejercicio 02
SELECT DISTINCT Ciudad
FROM Clientes;

-- Ejercicio 03
SELECT L.Categoria, SUM(V.Cantidad) AS TotalCopiasVendidas
FROM Libros AS L
JOIN Ventas AS V ON L.ID_Libro = V.ID_Libro
GROUP BY L.Categoria
HAVING SUM(V.Cantidad) > 3;

-- Ejercicio 04

-- solucion 1: sin detalles de los libros
SELECT TOP(5) *
FROM Ventas
ORDER BY Cantidad DESC;

-- solucion 2: se añade nombre de los libros
SELECT TOP(5) L.Titulo, V.*
FROM Ventas AS V
JOIN Libros AS L ON V.ID_Libro = L.ID_Libro
ORDER BY V.Cantidad DESC;

-- Ejercicio 05
SELECT C.Nombre, C.Email, SUM(L.Precio * V.Cantidad) AS TotalGastado 
FROM Clientes AS C
JOIN Ventas AS V ON C.ID_Cliente = V.ID_Cliente
JOIN Libros AS L ON V.ID_Libro = L.ID_Libro
GROUP BY C.Nombre, C.Email;

-- Ejercicio 06
SELECT L.Titulo, C.Nombre, V.Fecha
FROM Libros AS L
LEFT JOIN Ventas AS V ON L.ID_Libro = V.ID_Libro 
LEFT JOIN Clientes AS C ON V.ID_Cliente = C.ID_Cliente;

-- Ejercicio 07
SELECT L.Autor, SUM(L.Precio * V.Cantidad) AS TotalVentas 
FROM Libros AS L
JOIN Ventas AS V ON L.ID_Libro = V.ID_Libro
GROUP BY L.Autor
ORDER BY TotalVentas DESC;