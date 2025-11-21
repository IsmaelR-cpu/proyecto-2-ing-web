-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2025 a las 02:31:34
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_cursos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `titulo`, `descripcion`, `precio`, `imagen`, `fecha_creacion`) VALUES
(1, 'HTML5 Esencial', 'Domina la estructura de la web moderna. Aprende a usar las etiquetas semánticas de HTML5, a crear formularios accesibles y a optimizar la estructura para SEO.', 10.00, 'html.jpg', '2025-11-20 21:13:54'),
(2, 'CSS3 y Diseño Responsive', 'Estiliza tus páginas como un profesional. Cubriremos Flexbox, Grid Layout, animaciones CSS y la creación de interfaces que se adaptan a cualquier dispositivo (Responsive Design).', 12.50, 'css.jpg', '2025-11-20 21:13:54'),
(3, 'Introducción a PHP y MySQL', 'Conviértete en desarrollador Full Stack. Aprende a crear lógica de servidor con PHP, a manejar bases de datos MySQL, y a proteger tus aplicaciones de vulnerabilidades comunes.', 15.00, 'php.jpg', '2025-11-20 21:13:54'),
(4, 'JavaScript Moderno (ES6+)', 'El curso fundamental para la programación web interactiva. Cubre variables, funciones asíncronas (Async/Await), manipulación del DOM y el ecosistema de módulos de JavaScript.', 20.00, 'js.jpg', '2025-11-20 22:00:00'),
(5, 'Desarrollo con React JS', 'Aprende a construir interfaces de usuario complejas usando componentes de React, manejo de estado con Hooks y ruteo. Crea una aplicación de una sola página (SPA) desde cero.', 35.00, 'react.jpg', '2025-11-20 22:05:00'),
(6, 'Bases de Datos con PostgreSQL', 'Profundiza en la administración de bases de datos. Aprende a usar SQL avanzado, a optimizar consultas, a manejar transacciones y a asegurar la integridad de tus datos.', 22.00, 'postgres.jpg', '2025-11-20 22:10:00'),
(7, 'Node.js y Express para Back-end', 'Crea APIs REST robustas usando Node.js y el framework Express. Aprende a manejar la autenticación (JWT) y a conectar tu servidor con cualquier base de datos.', 30.00, 'node.jpg', '2025-11-20 22:15:00'),
(8, 'Diseño UX/UI Fundamentos', 'Entiende la experiencia de usuario (UX) y el diseño de interfaces (UI). Aplica principios de usabilidad, prototipado y pruebas para crear productos digitales que los usuarios amen.', 18.00, 'uxui.jpg', '2025-11-20 22:20:00'),
(9, 'Ciberseguridad Web', 'Protege tus aplicaciones contra ataques comunes (XSS, SQL Injection, CSRF). Aprende sobre políticas de seguridad, cifrado y mejores prácticas en la configuración de servidores.', 25.00, 'security.jpg', '2025-11-20 22:25:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `usuario_id`, `total`, `fecha`) VALUES
(3, 2, 35.00, '2025-11-21 01:21:21'),
(4, 2, 15.00, '2025-11-21 01:29:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_detalle`
--

CREATE TABLE `pedido_detalle` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT 1,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedido_detalle`
--

INSERT INTO `pedido_detalle` (`id`, `pedido_id`, `curso_id`, `cantidad`, `precio`) VALUES
(1, 3, 1, 1, 10.00),
(2, 3, 9, 1, 25.00),
(3, 4, 3, 1, 15.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `fecha_registro`) VALUES
(1, 'Pedro Soto', 'bob678400@gmail.com', '$2y$10$2pMawQSG/5mObPpBj7Ftd.o7i8mifkB50DNS4r8LRVcoOgZNXPGVC', '2025-11-20 18:22:39'),
(2, 'Alexandro', 'alexandro1@gmail.com', '$2y$10$1Nmr.o5oJBOYTbb6V/kZdO2TiaTOKAb/MaywnyxUMmQdR/ZYyXUby', '2025-11-21 00:43:32');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `curso_id` (`curso_id`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `curso_id` (`curso_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD CONSTRAINT `pedido_detalle_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pedido_detalle_ibfk_2` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
