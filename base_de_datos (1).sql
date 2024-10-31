-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-10-2024 a las 01:20:53
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
  `alumno-id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `curso-id` int(10) NOT NULL,
  `dni` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`alumno-id`, `nombre`, `curso-id`, `dni`) VALUES
(1, 'axel armella', 72, 46484983);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `curso-id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`curso-id`) VALUES
(71),
(72),
(73);

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
(3, 'programación '),
(4, 'hardware');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE `nota` (
  `nota-id` int(11) NOT NULL,
  `materia-id` int(10) NOT NULL,
  `alumno-id` int(10) NOT NULL,
  `curso-id` int(10) NOT NULL,
  `nota` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo de usuario`
--

CREATE TABLE `tipo de usuario` (
  `tipo de usuario-id` int(10) NOT NULL,
  `tipo de usuario` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo de usuario`
--

INSERT INTO `tipo de usuario` (`tipo de usuario-id`, `tipo de usuario`) VALUES
(1, 'alumno'),
(2, 'el que carga ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario de carga`
--

CREATE TABLE `usuario de carga` (
  `usuario de carga-id` int(10) NOT NULL,
  `Uuario` varchar(100) NOT NULL,
  `DNI` int(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `tipo de usuario-id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usuario-id` int(10) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contra` varchar(100) NOT NULL,
  `tipo de usuario-id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`alumno-id`),
  ADD KEY `curso-id` (`curso-id`);

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
  ADD PRIMARY KEY (`nota-id`),
  ADD KEY `materia id` (`materia-id`),
  ADD KEY `alumno id` (`alumno-id`),
  ADD KEY `curso id` (`curso-id`);

--
-- Indices de la tabla `tipo de usuario`
--
ALTER TABLE `tipo de usuario`
  ADD PRIMARY KEY (`tipo de usuario-id`);

--
-- Indices de la tabla `usuario de carga`
--
ALTER TABLE `usuario de carga`
  ADD PRIMARY KEY (`usuario de carga-id`),
  ADD KEY `tipo de usuario id` (`tipo de usuario-id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario-id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `curso-id` FOREIGN KEY (`curso-id`) REFERENCES `curso` (`curso-id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `nota`
--
ALTER TABLE `nota`
  ADD CONSTRAINT `alumno id` FOREIGN KEY (`alumno-id`) REFERENCES `alumno` (`alumno-id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `curso id` FOREIGN KEY (`curso-id`) REFERENCES `curso` (`curso-id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `materia id` FOREIGN KEY (`materia-id`) REFERENCES `materia` (`materia-id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario de carga`
--
ALTER TABLE `usuario de carga`
  ADD CONSTRAINT `tipo de usuario id` FOREIGN KEY (`tipo de usuario-id`) REFERENCES `tipo de usuario` (`tipo de usuario-id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
