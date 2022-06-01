-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 01, 2022 at 04:19 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyecto_informatica`
--

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nombre` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(1, 'Mouse'),
(2, 'Parlantes'),
(3, 'Teclado'),
(4, 'Monitor'),
(5, 'Microfono');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `codigo` int(10) NOT NULL,
  `producto` varchar(250) NOT NULL,
  `precio` decimal(20,2) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `idCategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`codigo`, `producto`, `precio`, `imagen`, `descripcion`, `idCategoria`) VALUES
(1, 'teclado panter gk102 noob', '860.53', 'teclado-panter-gk102-noob.jpg', '10 Teclas Multimedia\r\nCable textil de 1.35 m\r\nConexión USB 3.0', 3),
(2, 'teclado genius kb125 usb', '951.00', 'teclado-genius-kb-125-usb.jpg', '\r\n    Soporte ergonómico\r\n    Dimensiones: 452 x 162 x 23 mm\r\n    Tipo de teclas cóncavas\r\n    Teclado compacto\r\n', 3),
(3, 'monitor samsung-24pulgadas cf390-curvo', '28890.97', 'monitor-samsung-24cf390-curvo-1p.jpg', '\r\n    COD:1015306 - PANTALLA DE 24\" LED\r\n    RADIO DE CURVATURA 1800 MM\r\n    CONTRASTE 3000:1\r\n    TIEMPO DE RESPUESTA 4 MS\r\n    RESOLUCION 1920x1080 FULL HD\r\n    BRILLO 250 CD/M\r\n', 4),
(4, 'monitor samsung 22pulgadas f350-curvo', '22927.72', 'monitor-samsung-24cf390-curvo-1p.jpg', 'Pantalla: 22\"\r\nTiempo de respuesta: 5 ms\r\nResolución 1920 x 1080 (Full HD)\r\nFrecuencia de refresco 60 Hz\r\nRelación de aspecto 16 - 9', 4),
(5, 'microfono nisuta micuhf8 mlib', '5165.13', 'microfono-nisuta-micuhf8-mlib.jpg', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Reprehenderit amet totam dolor pariatur eligendi saepe, distinctio inventore cupiditate. Sunt accusamus unde sint omnis, obcaecati maxime officia voluptatibus similique architecto quas!\r\n', 5),
(6, 'microfono netmak nmk99g', '1910.59', 'microfono-netmak-nm-k99g-bt.jpg', '\r\n    RECARGABLE VIA USB\r\n    BOTONES PARA PASAR DE CANCIONES Y PAUSAR\r\n    BATERIA INCORPORADA Li-Ion 800mAh\r\n    FUNCION ECO\r\n    PERMITE GRABAR AUDIO EN TU CELULAR\r\n    REPRODUCE MUSICA DE TU CELULAR\r\n    CONEXIÓN BLUETOOTH\r\n    PARLANTE INCORPORADO (3W X 2)\r\n', 5),
(7, 'mouse noga st 360 gamer led', '564.48', 'mouse-noga-st-360-gamer-led.jpg', '\r\n    Botones de Page Up y Page Down\r\n    6 Botones y Scroll para hacer Zoom y navegar\r\n    Mouse Óptico Gamer 6D\r\n', 1),
(8, 'mouse netmak nm xenon rilum', '566.67', 'mouse-netmak-nm-xenon-rilum.jpg', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Reprehenderit amet totam dolor pariatur eligendi saepe, distinctio inventore cupiditate. Sunt accusamus unde sint omnis, obcaecati maxime officia voluptatibus similique architecto quas!\r\n', 1),
(9, 'mouse nisuta 6dnsmog66', '1103.64', 'mouse-nisuta-6d-nsmog66.jpg', '\r\n    Iluminación especial\r\n    6D incluye 6 botones\r\n    Mouse gaming óptico de alta precisión\r\n', 1),
(10, 'parlante netmak nm splash', '950.25', 'parlante-netmak-nm-splash-bt.jpg', '\r\n    Alcance de 10 metros.\r\n    Parlante apto para soportar agua, altas temperaturas y humedad!\r\n    Ahora podes disfrutar tu ducha de una manera diferente...Atende llamados y escuha música desde el agua!!\r\n', 2),
(11, 'parlante genius sp906bt', '2494.77', 'parlante-genius-sp-906bt-1.jpg', '\r\n    Potencia de salida 3 W\r\n    Sensibilidad: 70dB\r\n    Distancia de funcionamiento inalámbrico 10m\r\n    Tipo de batería Batería recargable de iones de litio incorporada, 780 mAh\r\n    Con Micrófono\r\n', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbldetalleventa`
--

CREATE TABLE `tbldetalleventa` (
  `id` int(11) NOT NULL,
  `idVenta` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `precioUnitario` decimal(20,2) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbldetalleventa`
--

INSERT INTO `tbldetalleventa` (`id`, `idVenta`, `idProducto`, `precioUnitario`, `cantidad`) VALUES
(22, 23, 7, '564.48', 2),
(23, 23, 2, '951.00', 1),
(24, 24, 7, '564.48', 2),
(25, 24, 2, '951.00', 2),
(26, 25, 2, '951.00', 1),
(27, 26, 2, '951.00', 1),
(28, 27, 1, '860.53', 1),
(29, 27, 3, '28890.97', 1),
(30, 27, 7, '564.48', 1),
(31, 28, 1, '860.53', 1),
(32, 28, 3, '28890.97', 1),
(33, 28, 7, '564.48', 1),
(34, 29, 1, '860.53', 1),
(35, 29, 3, '28890.97', 1),
(36, 29, 7, '564.48', 1),
(37, 30, 1, '860.53', 1),
(38, 30, 3, '28890.97', 1),
(39, 30, 7, '564.48', 1),
(40, 31, 1, '860.53', 1),
(41, 31, 3, '28890.97', 1),
(42, 31, 7, '564.48', 1),
(43, 32, 1, '860.53', 1),
(44, 32, 3, '28890.97', 1),
(45, 32, 7, '564.48', 1),
(46, 33, 1, '860.53', 1),
(47, 33, 3, '28890.97', 1),
(48, 33, 7, '564.48', 1),
(49, 34, 1, '860.53', 1),
(50, 34, 3, '28890.97', 1),
(51, 34, 7, '564.48', 1),
(52, 35, 1, '860.53', 1),
(53, 35, 3, '28890.97', 1),
(54, 35, 7, '564.48', 1),
(55, 36, 1, '860.53', 1),
(56, 36, 3, '28890.97', 1),
(57, 36, 7, '564.48', 1),
(58, 37, 1, '860.53', 1),
(59, 37, 3, '28890.97', 1),
(60, 37, 7, '564.48', 1),
(61, 38, 1, '860.53', 1),
(62, 38, 3, '28890.97', 1),
(63, 38, 7, '564.48', 1),
(64, 39, 1, '860.53', 1),
(65, 39, 3, '28890.97', 1),
(66, 39, 7, '564.48', 1),
(67, 40, 1, '860.53', 1),
(68, 40, 3, '28890.97', 1),
(69, 40, 7, '564.48', 1),
(70, 41, 1, '860.53', 1),
(71, 41, 3, '28890.97', 1),
(72, 41, 7, '564.48', 1),
(73, 42, 1, '860.53', 1),
(74, 42, 3, '28890.97', 1),
(75, 42, 7, '564.48', 1),
(76, 43, 1, '860.53', 1),
(77, 43, 3, '28890.97', 1),
(78, 43, 7, '564.48', 1),
(79, 44, 1, '860.53', 1),
(80, 44, 3, '28890.97', 1),
(81, 44, 7, '564.48', 1),
(82, 45, 1, '860.53', 1),
(83, 45, 3, '28890.97', 1),
(84, 45, 7, '564.48', 1),
(85, 46, 1, '860.53', 1),
(86, 46, 3, '28890.97', 1),
(87, 46, 7, '564.48', 1),
(88, 47, 1, '860.53', 1),
(89, 47, 3, '28890.97', 1),
(90, 47, 7, '564.48', 1),
(91, 48, 1, '860.53', 1),
(92, 48, 3, '28890.97', 1),
(93, 48, 7, '564.48', 1),
(94, 49, 1, '860.53', 1),
(95, 49, 3, '28890.97', 1),
(96, 49, 7, '564.48', 1),
(97, 50, 2, '951.00', 1),
(98, 51, 1, '860.53', 2),
(99, 52, 3, '28890.97', 2),
(100, 52, 2, '951.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblusuarios`
--

CREATE TABLE `tblusuarios` (
  `ID` int(11) NOT NULL,
  `nombre` varchar(1000) NOT NULL,
  `apellidos` varchar(2000) NOT NULL,
  `correo` varchar(2000) NOT NULL,
  `password` varchar(2500) NOT NULL,
  `foto` varchar(4000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblusuarios`
--

INSERT INTO `tblusuarios` (`ID`, `nombre`, `apellidos`, `correo`, `password`, `foto`) VALUES
(1, 'Cecilia', 'Garcia', 'ceci@mail.com', '123456', 'foto.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblventas`
--

CREATE TABLE `tblventas` (
  `id` int(11) NOT NULL,
  `claveTransaccion` varchar(250) NOT NULL,
  `paypalDatos` text NOT NULL,
  `fecha` datetime NOT NULL,
  `correo` varchar(5000) NOT NULL,
  `totalTransaccion` decimal(60,2) NOT NULL,
  `estatus` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tblventas`
--

INSERT INTO `tblventas` (`id`, `claveTransaccion`, `paypalDatos`, `fecha`, `correo`, `totalTransaccion`, `estatus`) VALUES
(1, '12345678910', '', '2020-10-20 21:27:10', 'cecilia15-5@hotmail.com', '700.00', 'pendiente'),
(2, '12345678910', '', '2020-10-20 21:27:10', 'cecilia15-5@hotmail.com', '700.00', 'pendiente'),
(3, 'mtjfpv2lqgitn351k3qd7k4ml0', '', '2020-10-05 21:41:20', 'cecilia15-5@hotmail.com', '750.00', 'pendiente'),
(4, 'mtjfpv2lqgitn351k3qd7k4ml0', '', '2020-10-05 21:46:31', 'cecilia15-5@hotmail.com', '750.00', 'pendiente'),
(5, 'mtjfpv2lqgitn351k3qd7k4ml0', '', '2020-10-05 21:47:38', 'ceci@gmail.com', '1800.25', 'pendiente'),
(6, 'mtjfpv2lqgitn351k3qd7k4ml0', '', '2020-10-05 23:37:37', 'ceci@gmail.com', '2730.70', 'pendiente'),
(7, 'mtjfpv2lqgitn351k3qd7k4ml0', '', '2020-10-05 23:38:49', 'ceci@gmail.com', '2730.70', 'pendiente'),
(8, 'mtjfpv2lqgitn351k3qd7k4ml0', '', '2020-10-05 23:39:19', 'cecilia1551998@gmail.com', '2730.70', 'pendiente'),
(9, 'mtjfpv2lqgitn351k3qd7k4ml0', '', '2020-10-05 23:40:43', 'cecilia1551998@gmail.com', '2730.70', 'pendiente'),
(10, 'mtjfpv2lqgitn351k3qd7k4ml0', '', '2020-10-05 23:40:56', 'cecilia15-5@hotmail.com', '2730.70', 'pendiente'),
(11, 'mtjfpv2lqgitn351k3qd7k4ml0', '', '2020-10-05 23:42:16', 'ceci@gmail.com', '3480.70', 'pendiente'),
(12, 'mtjfpv2lqgitn351k3qd7k4ml0', '', '2020-10-05 23:45:14', 'ceci@gmail.com', '3480.70', 'pendiente'),
(13, 'mtjfpv2lqgitn351k3qd7k4ml0', '', '2020-10-05 23:46:19', 'ceci@gmail.com', '3480.70', 'pendiente'),
(14, 'mtjfpv2lqgitn351k3qd7k4ml0', '', '2020-10-06 00:34:55', 'ceci@gmail.com', '1050.25', 'pendiente'),
(15, 'mtjfpv2lqgitn351k3qd7k4ml0', '', '2020-10-06 00:34:59', 'ceci@gmail.com', '1050.25', 'pendiente'),
(16, 'mtjfpv2lqgitn351k3qd7k4ml0', '', '2020-10-06 00:35:06', 'ceci@gmail.com', '1050.25', 'pendiente'),
(17, 'mtjfpv2lqgitn351k3qd7k4ml0', '', '2020-10-06 00:39:18', 'ceci@gmail.com', '1050.25', 'pendiente'),
(18, 'aq5bemeg9na91iio9q1aekbg3i', '', '2020-10-06 16:57:20', 'ceci@gmail.com', '1800.25', 'pendiente'),
(19, 'aq5bemeg9na91iio9q1aekbg3i', '', '2020-10-06 17:44:27', 'ceci@gmail.com', '1800.25', 'pendiente'),
(20, 'aq5bemeg9na91iio9q1aekbg3i', '', '2020-10-06 17:45:23', 'ceci@gmail.com', '1800.25', 'pendiente'),
(21, 'br8uvln8kbq2nhgt7l61elui4n', '', '2020-10-07 20:13:30', 'ceci@gmail.com', '1800.25', 'pendiente'),
(22, 'br8uvln8kbq2nhgt7l61elui4n', '', '2020-10-07 20:26:41', 'cecilia15-5@hotmail.com', '1800.25', 'pendiente'),
(23, '6gbhqjpdm42br8q5f3507cla04', '', '2020-11-17 20:26:55', 'ceci@mail.com', '2079.96', 'pendiente'),
(24, '6gbhqjpdm42br8q5f3507cla04', '', '2020-11-17 23:53:19', 'ceci@gmail.com', '3030.96', 'pendiente'),
(25, '6gbhqjpdm42br8q5f3507cla04', '', '2020-11-18 00:53:51', 'ceci@gmail.com', '951.00', 'pendiente'),
(26, 'kgul6pm7m3n9dd3leglt00mias', '', '2020-11-18 23:54:29', 'ceci@gmail.com', '951.00', 'pendiente'),
(27, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 19:04:03', 'ceci@gmail.com', '30315.98', 'pendiente'),
(28, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 19:08:13', 'ceci@gmail.com', '30315.98', 'pendiente'),
(29, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 19:13:30', 'ceci@mail.com', '30315.98', 'pendiente'),
(30, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 19:59:41', 'ceci@mail.com', '30315.98', 'pendiente'),
(31, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 20:00:43', 'ceci@mail.com', '30315.98', 'pendiente'),
(32, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 20:00:57', 'ceci@mail.com', '30315.98', 'pendiente'),
(33, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 20:11:17', 'ceci@mail.com', '30315.98', 'pendiente'),
(34, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 20:11:34', 'ceci@mail.com', '30315.98', 'pendiente'),
(35, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 20:16:20', 'ceci@mail.com', '30315.98', 'pendiente'),
(36, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 20:18:51', 'ceci@mail.com', '30315.98', 'pendiente'),
(37, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 20:40:16', 'ceci@mail.com', '30315.98', 'pendiente'),
(38, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 21:04:53', 'ceci@mail.com', '30315.98', 'pendiente'),
(39, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 21:05:34', 'ceci@mail.com', '30315.98', 'pendiente'),
(40, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 21:10:09', 'ceci@mail.com', '30315.98', 'pendiente'),
(41, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 21:10:16', 'ceci@mail.com', '30315.98', 'pendiente'),
(42, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 21:13:39', 'ceci@gmail.com', '30315.98', 'pendiente'),
(43, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 21:24:04', 'ceci@gmail.com', '30315.98', 'pendiente'),
(44, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 21:24:20', 'ceci@gmail.com', '30315.98', 'pendiente'),
(45, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 21:24:42', 'ceci@gmail.com', '30315.98', 'pendiente'),
(46, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 21:28:17', 'ceci@mail.com', '30315.98', 'pendiente'),
(47, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 21:29:42', 'ceci@mail.com', '30315.98', 'pendiente'),
(48, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 21:31:33', 'ceci@mail.com', '30315.98', 'pendiente'),
(49, 'lrrg4bgdqthlnakvje4ch53ecj', '', '2020-12-08 22:00:37', 'ceci@mail.com', '30315.98', 'pendiente'),
(50, 'd9k2ms1dojq31gk7s7hr33a4io', '', '2021-06-29 20:12:09', 'ceci@mail.com', '951.00', 'pendiente'),
(51, 'lhp0ato8gqn6j5hq13t94mps70', '', '2021-08-05 14:09:24', 'ceci@mail.com', '1721.06', 'pendiente'),
(52, '3p6rh83728feqab9bn9n8a005p', '', '2022-05-31 18:17:08', 'ceci@mail.com', '58732.94', 'pendiente');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `idCategoria` (`idCategoria`);

--
-- Indexes for table `tbldetalleventa`
--
ALTER TABLE `tbldetalleventa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idVenta` (`idVenta`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indexes for table `tblusuarios`
--
ALTER TABLE `tblusuarios`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tblventas`
--
ALTER TABLE `tblventas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `codigo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tbldetalleventa`
--
ALTER TABLE `tbldetalleventa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `tblusuarios`
--
ALTER TABLE `tblusuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblventas`
--
ALTER TABLE `tblventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`id`);

--
-- Constraints for table `tbldetalleventa`
--
ALTER TABLE `tbldetalleventa`
  ADD CONSTRAINT `tbldetalleventa_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `tblventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbldetalleventa_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
