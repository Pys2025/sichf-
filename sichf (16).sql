-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-05-2025 a las 05:15:04
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sichf`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calzados`
--

CREATE TABLE `calzados` (
  `id_calzado` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `nombre` text NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `calzados`
--

INSERT INTO `calzados` (`id_calzado`, `estado`, `nombre`, `id_categoria`, `id_proveedor`, `cantidad`, `imagen`) VALUES
(1, 'Disponible', 'Zapato formal negro', 1, 1, 40, NULL),
(2, 'Disponible', 'Zapato formal marrón', 1, 1, 40, NULL),
(3, 'Disponible', 'Zapato formal azul', 1, 1, 40, NULL),
(4, 'Disponible', 'Zapato casual beige', 2, 2, 60, NULL),
(5, 'Disponible', 'Zapato casual negro', 2, 2, 60, NULL),
(6, 'Disponible', 'Zapato escolar negro', 3, 3, 15, NULL),
(7, 'Disponible', 'Zapato escolar azul', 3, 3, 10, NULL),
(8, 'Disponible', 'Tenis deportivo blanco', 1, 4, 15, NULL),
(9, 'Disponible', 'Tenis deportivo negro', 1, 4, 10, NULL),
(10, 'Disponible', 'Bota de trabajo negra', 1, 5, 25, NULL),
(11, 'Disponible', 'Sandalia beige', 2, 6, 12, NULL),
(12, 'Disponible', 'Sandalia negra', 2, 6, 12, NULL),
(13, 'Disponible', 'Zapato de vestir negro', 1, 7, 25, NULL),
(14, 'Disponible', 'Zapato para bebé blanco', 3, 8, 6, NULL),
(15, 'Disponible', 'Zapato para bebé rosa', 3, 8, 6, NULL),
(16, 'Disponible', 'Tacón negro', 2, 9, 10, NULL),
(17, 'Disponible', 'Tacón nude', 2, 9, 10, NULL),
(18, 'Disponible', 'Tacón rojo', 2, 9, 5, NULL),
(19, 'Disponible', 'Tenis deportivo niño azul', 3, 10, 40, NULL),
(20, 'Disponible', 'Tenis deportivo niña rosa', 3, 10, 40, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_carrito` int(11) NOT NULL,
  `id_usu` int(11) NOT NULL,
  `id_calzado` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `total` decimal(10,2) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `valor` double NOT NULL,
  `id_pagos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id_carrito`, `id_usu`, `id_calzado`, `cantidad`, `total`, `descripcion`, `imagen`, `valor`, `id_pagos`) VALUES
(10, 2, 1, 5, '750000.00', 'Zapato formal de vestir para hombre', NULL, 150000, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre_categoria` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre_categoria`) VALUES
(1, 'Hombres'),
(2, 'Mujeres'),
(3, 'Niños ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `id_usu` int(11) NOT NULL,
  `fecha_factura` datetime NOT NULL DEFAULT current_timestamp(),
  `valor_unitario` decimal(10,2) NOT NULL,
  `iva` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `descripcion_producto` varchar(100) DEFAULT NULL,
  `cantidad_productos` int(11) NOT NULL,
  `Estado` varchar(10) NOT NULL,
  `id_pagos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id_factura`, `id_usu`, `fecha_factura`, `valor_unitario`, `iva`, `total`, `descripcion_producto`, `cantidad_productos`, `Estado`, `id_pagos`) VALUES
(1, 2, '0000-00-00 00:00:00', '100000.00', '10.00', '120000.00', 'Calzado de hombre material caucho', 1, 'Disponible', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `info_calzado`
--

CREATE TABLE `info_calzado` (
  `id_info_calzado` int(11) NOT NULL,
  `material` varchar(20) NOT NULL,
  `talla` varchar(10) NOT NULL,
  `color` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `valor` double NOT NULL,
  `id_calzados` int(11) DEFAULT NULL,
  `cantidad` varchar(11) NOT NULL DEFAULT '0',
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `info_calzado`
--

INSERT INTO `info_calzado` (`id_info_calzado`, `material`, `talla`, `color`, `descripcion`, `valor`, `id_calzados`, `cantidad`, `imagen`) VALUES
(1, 'Cuero genuino', '40-45', 'Negro', 'Zapato formal de vestir para hombre', 150000, 1, '40', NULL),
(2, 'Cuero genuino', '40-45', 'Marrón', 'Zapato formal de vestir para hombre', 150000, 2, '40', NULL),
(3, 'Cuero sintético', '40-45', 'Azul', 'Zapato formal de vestir para hombre', 150000, 3, '40', NULL),
(4, 'Gamuza', '35-39', 'Beige', 'Zapato casual cómodo para mujer', 120000, 4, '60', NULL),
(5, 'Cuero sintético', '35-39', 'Negro', 'Zapato casual elegante para mujer', 120000, 5, '60', NULL),
(6, 'Cuero sintético', '27-33', 'Negro', 'Zapato escolar resistente para niños', 80000, 6, '15', NULL),
(7, 'Cuero sintético', '27-33', 'Azul', 'Zapato escolar resistente para niños', 80000, 7, '10', NULL),
(8, 'Malla transpirable', '38-44', 'Blanco', 'Tenis deportivo de alta calidad', 180000, 8, '15', NULL),
(9, 'Malla transpirable', '38-44', 'Negro', 'Tenis deportivo de alta calidad', 180000, 9, '10', NULL),
(10, 'Cuero resistente', '39-44', 'Negro', 'Bota de trabajo impermeable', 250000, 10, '25', NULL),
(11, 'Cuero', '35-39', 'Beige', 'Sandalia cómoda para mujer', 95000, 11, '12', NULL),
(12, 'Cuero', '35-39', 'Negro', 'Sandalia elegante para mujer', 95000, 12, '12', NULL),
(13, 'Cuero genuino', '39-44', 'Negro', 'Zapato de vestir de alta calidad', 200000, 13, '25', NULL),
(14, 'Tela suave', '20-26', 'Blanco', 'Zapato cómodo para bebés', 70000, 14, '6', NULL),
(15, 'Tela suave', '20-26', 'Rosa', 'Zapato cómodo para bebés', 70000, 15, '6', NULL),
(16, 'Cuero italiano', '35-39', 'Negro', 'Tacón elegante para ocasiones especiales', 220000, 16, '10', NULL),
(17, 'Cuero italiano', '35-39', 'Nude', 'Tacón elegante para ocasiones especiales', 220000, 17, '10', NULL),
(18, 'Cuero italiano', '35-39', 'Rojo', 'Tacón elegante para ocasiones especiales', 220000, 18, '5', NULL),
(19, 'Malla transpirable', '27-33', 'Azul', 'Tenis deportivo para niños', 110000, 19, '40', NULL),
(20, 'Malla transpirable', '27-33', 'Rosa', 'Tenis deportivo para niñas', 110000, 20, '40', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `metodo_pago` varchar(11) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha_pago` datetime NOT NULL DEFAULT current_timestamp(),
  `id_carrito` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id_pago`, `metodo_pago`, `total`, `fecha_pago`, `id_carrito`, `id_factura`) VALUES
(1, 'PayPal', '300000.00', '2025-05-14 14:23:22', 0, 0),
(2, 'PayPal', '800000.00', '2023-05-10 14:35:32', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nombre_proveedor` varchar(30) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(30) DEFAULT NULL,
  `productos_calzado` text DEFAULT NULL,
  `valor_unitario` decimal(30,0) DEFAULT NULL,
  `total` decimal(30,0) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `fecha_ultima_compra` date DEFAULT NULL,
  `notas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre_proveedor`, `telefono`, `correo`, `productos_calzado`, `valor_unitario`, `total`, `cantidad`, `direccion`, `metodo_pago`, `fecha_ultima_compra`, `notas`) VALUES
(1, 'Zapatería Elegante', '3151234567', 'elegante@zapateria.com', 'Zapatos formales para hombre', '150000', '18000000', 120, 'Calle 123 #45-67, Bogotá', 'Transferencia bancaria', '2023-10-15', 'Entrega rápida y confiable'),
(2, 'Moda Femenina SAS', '3209876543', 'ventas@modafemenina.com', 'Zapatos casuales para mujer', '120000', '14400000', 120, 'Av. 68 #12-34, Medellín', 'Tarjeta crédito', '2023-11-02', 'Buenos materiales'),
(3, 'Calzado Infantil Feliz', '3174567890', 'info@calzadofeliz.com', 'Zapatos escolares para niños', '80000', '2000000', 25, 'Carrera 45 #78-90, Cali', 'Efectivo', '2023-09-28', 'Colores variados'),
(4, 'Deportivos Extremos', '3145678901', 'ventas@deportivosext.com', 'Tenis deportivos unisex', '180000', '4500000', 25, 'Diagonal 23 #34-56, Barranquil', 'Transferencia bancaria', '2023-10-30', 'Marcas reconocidas'),
(5, 'Botas y Más', '3182345678', 'botasymas@empresa.com', 'Botas de trabajo para hombre', '250000', '6250000', 25, 'Calle 78 #12-34, Bucaramanga', 'Tarjeta débito', '2023-11-10', 'Resistentes al agua'),
(6, 'Sandalias Tropical', '3193456789', 'info@sandaliastropical.com', 'Sandalias para mujer', '95000', '2280000', 24, 'Av. 30 #45-67, Cartagena', 'Efectivo', '2023-10-22', 'Variedad de tallas'),
(7, 'Zapatos Clásicos', '3164567890', 'clasicos@zapatos.com', 'Zapatos de vestir para hombre', '200000', '5000000', 25, 'Carrera 56 #78-90, Pereira', 'Tarjeta crédito', '2023-11-05', 'Cuero genuino'),
(8, 'Niños Contentos', '3135678901', 'ventas@ninoscontentos.com', 'Zapatos para niños pequeños', '70000', '840000', 12, 'Calle 34 #56-78, Manizales', 'Transferencia bancaria', '2023-09-15', 'Materiales suaves'),
(9, 'Lujo Femenino', '3106789012', 'lujo@zapatosmujer.com', 'Zapatos de tacón para mujer', '220000', '5500000', 25, 'Av. 6N #23-45, Armenia', 'Tarjeta crédito', '2023-11-12', 'Diseños exclusivos'),
(10, 'Deportivos Junior', '3157890123', 'info@deportivosjunior.com', 'Tenis para niños y adolescentes', '110000', '8800000', 80, 'Carrera 12 #34-56, Ibagué', 'Efectivo', '2023-10-18', 'Variedad de colores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL CHECK (`descripcion` in ('Admin','Usuario'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `descripcion`) VALUES
(1, 'admin '),
(2, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usu` int(11) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usu`, `correo`, `password`, `id_rol`) VALUES
(1, 'varonmateo042@gmail.com', '$2b$10$B1pomJhyofwQYdAmQxxZ7u3Teji3M973IvYsyjc3518/OIV8wcA3e', 1),
(2, 'jose.perez123@example.com', '$2b$10$.UzZE9IXEaPwZzzewzJjAe6Yw2YYueNVK74QzMhy1E98teuuJUm7y', 2),
(3, 'luisa.martinez@example.com', '$2b$10$828D.mJs4ZFBnCiIbtMAU.SE0IeWXgnwgXwMnwIjw7mXyN.HF2lpm', 2),
(4, 'carlos.rodrigue@gmail.com', '$2b$10$BKlSWyPnqlwi.slPAoCQ0u3zE0xU3lqqLhakYlvR5jY/WNyvq7q0C', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calzados`
--
ALTER TABLE `calzados`
  ADD PRIMARY KEY (`id_calzado`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_proveedor` (`id_proveedor`);

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_carrito`),
  ADD KEY `id_usu` (`id_usu`),
  ADD KEY `id_calzado` (`id_calzado`),
  ADD KEY `id_pagos` (`id_pagos`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_usu` (`id_usu`),
  ADD KEY `id_pagos` (`id_pagos`);

--
-- Indices de la tabla `info_calzado`
--
ALTER TABLE `info_calzado`
  ADD PRIMARY KEY (`id_info_calzado`),
  ADD KEY `fk_info_calzado_calzados` (`id_calzados`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_carrito` (`id_carrito`),
  ADD KEY `id_factura` (`id_factura`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usu`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calzados`
--
ALTER TABLE `calzados`
  MODIFY `id_calzado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_carrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `info_calzado`
--
ALTER TABLE `info_calzado`
  MODIFY `id_info_calzado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calzados`
--
ALTER TABLE `calzados`
  ADD CONSTRAINT `calzados_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `calzados_ibfk_3` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usu`) REFERENCES `usuarios` (`id_usu`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_calzado`) REFERENCES `calzados` (`id_calzado`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_usu`) REFERENCES `usuarios` (`id_usu`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`id_pagos`) REFERENCES `pagos` (`id_factura`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `info_calzado`
--
ALTER TABLE `info_calzado`
  ADD CONSTRAINT `fk_info_calzado_calzados` FOREIGN KEY (`id_calzados`) REFERENCES `calzados` (`id_calzado`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_carrito`) REFERENCES `carrito` (`id_pagos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
