-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2024 a las 23:54:02
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
-- Base de datos: `base de datos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `usuario_id` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `dni` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`usuario_id`, `correo`, `dni`) VALUES
('a', 'alangamer@gmail.com', 12435),
('axel', 'er@gmail.com', 1234),
('fer', 'axelarmella@gmail.com', 12345678),
('gabrie', 'a', 12356);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `curso-id` int(11) NOT NULL,
  `curso` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`curso-id`, `curso`) VALUES
(71, '7mo1ra'),
(72, '7mo2da'),
(73, '7mo3ra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `materia-id` int(10) NOT NULL,
  `nombre de mareria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`materia-id`, `nombre de mareria`) VALUES
(1, 'matemáticas'),
(2, 'ingles técnico'),
(3, 'marco juridico'),
(4, 'hardware'),
(5, 'asistencia2'),
(6, 'autogestion'),
(7, 'programación'),
(8, 'practicas profesionalizantes'),
(9, 'redes 3'),
(10, 'Arduino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE `nota` (
  `nota_id` int(10) NOT NULL,
  `usuario_id` varchar(100) NOT NULL,
  `curso` int(10) NOT NULL,
  `año` int(10) NOT NULL,
  `materia` int(10) NOT NULL,
  `nota` int(10) NOT NULL,
  `tipo_de_nota` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `nota`
--

INSERT INTO `nota` (`nota_id`, `usuario_id`, `curso`, `año`, `materia`, `nota`, `tipo_de_nota`) VALUES
(30, 'axel', 72, 2024, 1, 10, 1),
(31, 'fer', 72, 2024, 2, 10, 1),
(32, 'gabrie', 72, 2024, 1, 10, 3),
(33, 'axel', 72, 2024, 10, 10, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo de nota`
--

CREATE TABLE `tipo de nota` (
  `tipo_id` int(10) NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo de nota`
--

INSERT INTO `tipo de nota` (`tipo_id`, `tipo`) VALUES
(1, '1er informe 1er cuatrimestre'),
(2, '2do informe 1er cuatrimestre'),
(3, 'nota 1er cuatrimestre'),
(4, '1er informe'),
(5, '2do informe'),
(6, 'nota 2do cuatrimestre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo de usuario`
--

CREATE TABLE `tipo de usuario` (
  `tipo de usuario_id` int(10) NOT NULL,
  `tipo de usuario` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo de usuario`
--

INSERT INTO `tipo de usuario` (`tipo de usuario_id`, `tipo de usuario`) VALUES
(1, 'alumno'),
(2, 'el que carga ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario_id` varchar(100) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `dni` int(10) NOT NULL,
  `tipo_de_usuario_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario_id`, `contraseña`, `correo`, `dni`, `tipo_de_usuario_id`) VALUES
('a', '1234', 'alangamer@gmail.com', 12435, 1),
('asdef', 'sadewfsd', 'fwefdsf', 0, 0),
('axel', '1234', 'er@gmail.com', 1234, 1),
('carlos', '1234', 'alangamer@gmail.com', 12345678, 2),
('fer', '1234', 'axelarmella@gmail.com', 12345678, 1),
('gabrie', '1234', 'a', 12356, 1),
('nacho', '1234', '12345t', 12345, 0);

--
-- Disparadores `usuarios`
--
DELIMITER $$
CREATE TRIGGER `insertar_en_tabla_correspondiente` AFTER UPDATE ON `usuarios` FOR EACH ROW BEGIN
  -- Inserta en la tabla `alumno` si el tipo de usuario es 1
  IF NEW.tipo_de_usuario_id = 1 THEN
    INSERT INTO alumno (usuario_id, correo, dni)
    VALUES (NEW.usuario_id, NEW.correo, NEW.dni);
    
  -- Inserta en la tabla `usuario_de_carga` si el tipo de usuario es 2
  ELSEIF NEW.tipo_de_usuario_id = 2 THEN
    INSERT INTO usuario_de_carga (usuario_id, correo, dni)
    VALUES (NEW.usuario_id, NEW.correo, NEW.dni);
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_de_carga`
--

CREATE TABLE `usuario_de_carga` (
  `usuario_id` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `dni` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario_de_carga`
--

INSERT INTO `usuario_de_carga` (`usuario_id`, `correo`, `dni`) VALUES
('carlos', 'alangamer@gmail.com', 12345678);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`usuario_id`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`curso-id`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`materia-id`);

--
-- Indices de la tabla `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`nota_id`);

--
-- Indices de la tabla `tipo de nota`
--
ALTER TABLE `tipo de nota`
  ADD PRIMARY KEY (`tipo_id`);

--
-- Indices de la tabla `tipo de usuario`
--
ALTER TABLE `tipo de usuario`
  ADD PRIMARY KEY (`tipo de usuario_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario_id`);

--
-- Indices de la tabla `usuario_de_carga`
--
ALTER TABLE `usuario_de_carga`
  ADD PRIMARY KEY (`usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `nota`
--
ALTER TABLE `nota`
  MODIFY `nota_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
