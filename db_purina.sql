-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2020 a las 03:08:43
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_purina`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL COMMENT 'Almacena la descripción del producto',
  `estado` varchar(1) DEFAULT NULL COMMENT 'Define si la categoria esta activa o no'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena la información de las categorias de los productos de la empresa';

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id`, `descripcion`, `estado`) VALUES
(1, 'para gatos', 'a'),
(2, 'para perro', 'a');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `clave` longblob NOT NULL,
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Almacena el nombre de la empresa',
  `quienessomos` varchar(500) DEFAULT NULL COMMENT 'Almacena la información de la empresa',
  `emailcontacto` varchar(50) DEFAULT NULL COMMENT 'Almacena el email al cual se enviaran los contactos',
  `direccion` varchar(200) DEFAULT NULL COMMENT 'Almacena la dirección de',
  `telefonocontacto` varchar(20) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL,
  `instagram` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena la información de la empresa.  Incluye todo lo referente a la configuración de la empresa.';

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `clave`, `nombre`, `quienessomos`, `emailcontacto`, `direccion`, `telefonocontacto`, `facebook`, `twitter`, `instagram`) VALUES
(12, '', 'nestle', 'llenamos de sabor tu vida', 'nestle@outlook.es', 'colombia', '222223', '', '@PurinaVE', 'Purina');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Registra el nombre de la empresa',
  `descripcion` varchar(500) DEFAULT NULL COMMENT 'Registra información de la descripción de la marca'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena la información de las marcas de los productos';

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Mi ringo', 'Purina para gato y perro'),
(2, 'Pro plan ', 'purina para perros'),
(3, 'Dog Chow', 'purina para perros'),
(4, 'Purina', 'Purina para perros y gatos'),
(5, 'Dogui', 'purina para perros'),
(6, 'Kongo', 'purina para perros'),
(7, 'Cat Chow', 'purina para gatos'),
(8, 'Gatsy', 'purina para gatos'),
(9, 'Q-ida cat', 'purina para gatos'),
(10, 'Felix', 'purina para gatos'),
(11, 'Mi ringo Premium', 'purina para gatos'),
(15, 'Dog Chow premium', 'comida para peroo'),
(668, 'Gatsy', 'purina para gatos 450gr');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `referencia` varchar(20) DEFAULT NULL COMMENT 'Referencia de los productos',
  `nombre` varchar(100) DEFAULT NULL COMMENT 'Nombre del producto',
  `descripcioncorta` varchar(250) DEFAULT NULL COMMENT 'Una descripcion corta del producto',
  `detalle` text DEFAULT NULL COMMENT 'Detalle extenso de la información del producto',
  `valor` decimal(10,2) DEFAULT NULL COMMENT 'Precio del producto',
  `palabrasclave` varchar(100) DEFAULT NULL COMMENT 'Palabras claves del producto ',
  `estado` varchar(1) DEFAULT NULL COMMENT 'Estado del producto',
  `categoria_id` int(11) DEFAULT NULL,
  `marca_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Almacena la información del producto';

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `referencia`, `nombre`, `descripcioncorta`, `detalle`, `valor`, `palabrasclave`, `estado`, `categoria_id`, `marca_id`) VALUES
(2, '1446', 'Gatsy', 'comida para gato', '', '1000.00', 'gatos', 'a', 1, 8),
(3, '5648', 'Dog Chow cachorros', 'comida para cachorros', 'Empaque por 500gr', '4500.00', 'perros', 'a', 2, 3),
(4, '7412', 'Dog Chow', 'comida para adultos', 'empaque por 500gr', '4000.00', 'perro', 'a', 2, 3),
(5, '4444', 'Mi ringo', 'comida para gato', 'empaque por 1000gr', '8000.00', 'gato', 'a', 1, 1),
(6, '8975', 'Mi ringo', 'comida para perro', 'empaque por 1000gr', '7000.00', 'perro', 'a', 2, 1),
(7, '4658', 'Dog Chow', 'comida para cachorro', 'Empaque por 1000gr', '9000.00', 'cachorro', 'a', 2, 3),
(8, '66653', 'Kongo', 'Purina para perros ', 'Empaque por 1000gr', '8000.00', 'perro', 'a', 2, 6),
(11, '125', 'Q-ida cat', 'purina para gatos ', 'empaque por 1000gr', '8000.00', 'gato', 'a', 1, 9),
(125, '555', 'Mi ringo', 'comida para gato', 'empaque por 1200gr', '4000.00', 'gato', 'a', 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"BienvenidohecJm05\"]},\"passport\":{\"user\":3}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"BienvenidohecJm05\"]},\"passport\":{\"user\":3}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"BienvenidohecJm05\"]},\"passport\":{\"user\":3}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"BienvenidohecJm05\"]},\"passport\":{\"user\":3}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"BienvenidohecJm05\"]},\"passport\":{\"user\":3}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"BienvenidohecJm05\"]},\"passport\":{\"user\":3}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"Bienvenido\"]},\"passport\":{\"user\":6}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"Bienvenidocris\"]},\"passport\":{\"user\":6}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"BienvenidohecJm05\"]},\"passport\":{\"user\":3}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"BienvenidohecJm05\"]},\"passport\":{\"user\":3}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"BienvenidohecJm05\"]},\"passport\":{\"user\":3}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"BienvenidohecJm05\"]},\"passport\":{\"user\":3}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"message\":[\"contraseña incorrecta\"]}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"Bienvenidoadmin\"]},\"passport\":{\"user\":5}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"Bienvenidoadmin\"]},\"passport\":{\"user\":5}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"Bienvenidoadmin\"]},\"passport\":{\"user\":5}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"Bienvenidoadmin\"]},\"passport\":{\"user\":5}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"BienvenidohecJm05\"]},\"passport\":{\"user\":3}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"BienvenidohecJm05\"]},\"passport\":{\"user\":3}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"BienvenidohecJm05\"]},\"passport\":{\"user\":3}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"BienvenidohecJm05\"]},\"passport\":{\"user\":3}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"BienvenidohecJm05\"]},\"passport\":{\"user\":3}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"BienvenidohecJm05\"]},\"passport\":{\"user\":3}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"BienvenidohecJm05\"]},\"passport\":{\"user\":3}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"BienvenidohecJm05\"]},\"passport\":{\"user\":3}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"BienvenidohecJm05\"]},\"passport\":{\"user\":3}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"Bienvenidoadmin\"]},\"passport\":{\"user\":5}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"¡Producto agregado!\"]}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"¡Modificacion completa!\"]}}'),
('99Ko0G1Svn9fHE2mgEtwKkrar9snXG__', 1603677784, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{\"success\":[\"¡Marca agregada!\"]}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(60) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `administrador` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `password`, `fullname`, `administrador`) VALUES
(1, 'Marcos-Marin', '123456', 'Marcos Marin', 0),
(2, 'maria', '$2b$10$gZU1sKqsuZN.hvhlA27zfuPTArYRZHy.VvnhNWo78zRKi16nUU.MS', 'maria perez', 0),
(3, 'hecJm05', '$2b$10$tSClnF21yGIWtqelmCKI9uxxAfbarWN7hSZXC3mZ3YCS3ZSS0jJaO', 'Hector jimenez ', 0),
(4, 'alexR', '$2b$10$K2AvKQfjdmc/Mzutm9MqJOQ5vJ5pClPQ5fxrxlO9OmaQooXEhG5sW', 'Alexandra Rojas', 0),
(5, 'admin', '$2b$10$QiiBrTeso1NOX5IrnbB9au0/cbfZZ1Fm8VK9NKBUIzxixQjaOfaHm', 'admin', 1),
(6, 'cris', '$2b$10$T2X3Oj2noRflF8STemsFVusCsPyCGib51QyHm0mk/WEMDTS11P5O6', 'cristian ricardo', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
