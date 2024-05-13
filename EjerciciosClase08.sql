-- Ejercicio 01
-- (no hay enunciado)

-- Ejercicio 02
-- (no hay enunciado)

-- Ejercicio 03
-- (no hay enunciado)

-- Ejercicio 04
SELECT TOP(2) *
FROM DocumentoProveedor
ORDER BY FechaCarga DESC;

-- Ejercicio 05
SELECT u.Nombre, u.ID, COUNT(r.ID) AS TotalAcciones
FROM Usuario AS u
JOIN Registro AS r ON u.ID = r.ID_Usuario
GROUP BY u.Nombre, u.ID;

-- Ejercicio 06
-- falta enunciado

-- Ejercicio 07
-- falta enunciado

-- Ejercicio 08
SELECT e.NombreEmpresa, COUNT(r.ID) AS TotalAcciones
FROM Empresa AS e
JOIN DocumentoProveedor AS dp ON e.RutEmpresa = dp.RutEmpresa
JOIN Registro AS r ON dp.ID = r.ID_Documento
GROUP BY e.NombreEmpresa;

-- Ejercicio 09
SELECT TipoDocumento, YEAR(FechaEmision) AS AñoEmision, COUNT(*) AS NumTotalDocumentos
FROM DocumentoProveedor
GROUP BY TipoDocumento, YEAR(FechaEmision);

-- Ejercicio 10
-- (falta enunciado)

-- Ejercicio 11
SELECT TOP(3) u.Nombre, u.ID, COUNT(r.ID) AS NumAcciones
FROM Usuario AS u
JOIN Registro AS r ON u.ID = r.ID_Usuario
GROUP BY u.Nombre, u.ID
ORDER BY NumAcciones DESC;

-- Ejercicio 12
SELECT e.RutEmpresa, dp.TipoDocumento, COUNT(*) AS NumTotalDocumentos
FROM Empresa AS e
JOIN DocumentoProveedor AS dp ON e.RutEmpresa = dp.RutEmpresa
GROUP BY e.RutEmpresa, dp.TipoDocumento;

-- Ejercicio 13
SELECT e.*, dp.TipoDocumento
FROM Empresa AS e
JOIN DocumentoProveedor AS dp ON e.RutEmpresa = dp.RutEmpresa
WHERE dp.TipoDocumento = 'Factura' OR dp.TipoDocumento = 'Boleta';

-- Ejercicio 14
SELECT e.RutEmpresa, COUNT(*) AS NumTiposDocumentos
FROM Empresa AS e
JOIN DocumentoProveedor AS dp ON e.RutEmpresa = dp.RutEmpresa
GROUP BY e.RutEmpresa;

-- Ejercicio 15
SELECT u.Nombre, COUNT(r.ID_Documento) AS TotalDocumentosCargados
FROM Usuario u
JOIN Registro r ON u.ID = r.ID_Usuario
JOIN DocumentoProveedor dp ON r.ID_Documento = dp.ID
WHERE u.Rol != 'Administrador'
GROUP BY u.Nombre;

-- Ejercicio 16
SELECT RutEmpresa, FechaCarga, COUNT(*) AS TotalDocumentosCargados
FROM DocumentoProveedor
GROUP BY RutEmpresa, FechaCarga
HAVING COUNT(*) > 1;

-- Ejercicio 17
SELECT Accion, FechaRegistro, COUNT(*) AS TotalAcciones
FROM Registro
GROUP BY Accion, FechaRegistro;

-- Ejercicio 18
SELECT e.RutEmpresa, e.NombreEmpresa, MAX(dp.FechaCarga) AS UltimaFechaCargaNotaCredito
FROM Empresa AS e
JOIN DocumentoProveedor DP ON e.RutEmpresa = dp.RutEmpresa
WHERE dp.TipoDocumento = 'Nota Crédito'
GROUP BY e.RutEmpresa, e.NombreEmpresa;

-- Ejercicio 19
SELECT DISTINCT u.Email
FROM Usuario AS u
JOIN Registro AS r ON u.ID = r.ID_Usuario;

-- Ejercicio 20
SELECT e.RutEmpresa, e.NombreEmpresa
FROM Empresa AS e
LEFT JOIN DocumentoProveedor AS dp ON e.RutEmpresa = dp.RutEmpresa AND YEAR(dp.FechaCarga) = 2024 AND MONTH(dp.FechaCarga) = 4
WHERE dp.RutEmpresa IS NULL;




--Ejericio 3
SELECT e.RutEmpresa, e.NombreEmpresa, COUNT(D.ID) AS Totaldocumentos 

--Ejercicio 4
-- Selecciona los dos documentos más recientes por fecha de carga utilizando TOP
SELECT TOP 2*
FROM DocumentoProveedor
ORDER BY FechaCarga DESC;
-- el arterisco me dice que agregue todos los campos
-- el top me dice cuantos registros agregar

--Ejercicio 5
--Encuentra el número total de acciones realizadas por cada usuario utilizando GROUP BY
SELECT Usuario.Nombre 

--Ejercicio 6
-- Encuentra las empresas que tienen documentos de un tip
SELECT RutEmpresa COUNT(DISTINCT TipoDocumento) AS TiposDocumentos
FROM DocumentoProveedor
GROUP BY RutEmpresa
HAVING COUNT(DISTINCT TipoDocumento) > 1;

--Ejercicio 7

--Ejercicio 8
--Encentra el numero total de acciones registradas para cada empresa utilizando GROUP BY
SELECT e.RutEmpresa, e.NombreEmpresa, COUNT(r.ID) AS TotalAccionesRegistradas
FROM Empresa e
JOIN DocumentoProveedor dp ON e.RutEmpresa = dp.RutEmpresa
JOIN Registro r ON dp.ID = r.ID_Documento
GROUP BY e.RutEmpresa, e.NombreEmpresa
ORDER BY TotalAccionesRegistradas DESC;

--Ejercicio 9
-- Encuentra el numero total de documentos agrupados por tipo y año de emision utilizando GROUP BY y YEAR
SELECT TipoDocumento, YEAR(FechaEmision) AS AñoEmision, COUNT(*) AS TotalDocumentos
FROM DocumentoProveedor
GROUP BY TipoDocumento,
YEAR(FechaEmision);