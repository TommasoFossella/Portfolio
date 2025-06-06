CREATE DATABASE VendiCoseSPA;

USE VendiCoseSPA;

-- TABELLA AREA
CREATE TABLE Area (
    Id_Area INT,
    Nome_Area VARCHAR(100) NOT NULL,
    CONSTRAINT PK_Area PRIMARY KEY (Id_Area)
);

-- TABELLA MAGAZZINO
CREATE TABLE Magazzino (
    Id_Magazzino INT,
    Nome_Magazzino VARCHAR(100) NOT NULL,
    Id_Area INT,
    CONSTRAINT PK_Magazzino PRIMARY KEY (Id_Magazzino),
    CONSTRAINT FK_Magazzino_Area FOREIGN KEY (Id_Area) REFERENCES Area(Id_Area)
);

-- TABELLA NEGOZIO
CREATE TABLE Negozio (
    Id_Negozio INT,
    Nome_Negozio VARCHAR(100) NOT NULL,
    Id_Magazzino INT,
    CONSTRAINT PK_Negozio PRIMARY KEY (Id_Negozio),
    CONSTRAINT FK_Negozio_Magazzino FOREIGN KEY (Id_Magazzino) REFERENCES Magazzino(Id_Magazzino)
);

-- TABELLA CATEGORIA
CREATE TABLE Categoria (
    Id_Categoria INT,
    Nome_Categoria VARCHAR(100) NOT NULL,
    Livello_StockLevel INT,
    CONSTRAINT PK_Categoria PRIMARY KEY (Id_Categoria)
);

-- TABELLA PRODOTTO
CREATE TABLE Prodotto (
    Id_Prodotto INT,
    Nome_Prodotto VARCHAR(100) NOT NULL,
    Costo_Prodotto DECIMAL(10,2) NOT NULL,
    Id_Categoria INT,
    CONSTRAINT PK_Prodotto PRIMARY KEY (Id_Prodotto),
    CONSTRAINT FK_Prodotto_Categoria FOREIGN KEY (Id_Categoria) REFERENCES Categoria(Id_Categoria)
);

-- TABELLA STOCKLEVEL
CREATE TABLE StockLevel (
    Id_StockLevel INT,
    Id_Prodotto INT,
    Id_Magazzino INT,
    Id_Categoria INT,
    Quantità INT,
    CONSTRAINT PK_StockLevel PRIMARY KEY (Id_StockLevel),
    CONSTRAINT FK_StockLevel_Prodotto FOREIGN KEY (Id_Prodotto) REFERENCES Prodotto(Id_Prodotto),
    CONSTRAINT FK_StockLevel_Magazzino FOREIGN KEY (Id_Magazzino) REFERENCES Magazzino(Id_Magazzino),
    CONSTRAINT FK_StockLevel_Categoria FOREIGN KEY (Id_Categoria) REFERENCES Categoria(Id_Categoria)
);

-- TABELLA VENDITE
CREATE TABLE Vendite (
    Id_Vendita INT,
    Id_Prodotto INT,
    Id_Negozio INT,
    Quantità INT,
    Spes_Totale DECIMAL(10,2),
    Data_Ordine DATE,
    CONSTRAINT PK_Vendite PRIMARY KEY (Id_Vendita),
    CONSTRAINT FK_Vendite_Prodotto FOREIGN KEY (Id_Prodotto) REFERENCES Prodotto(Id_Prodotto),
    CONSTRAINT FK_Vendite_Negozio FOREIGN KEY (Id_Negozio) REFERENCES Negozio(Id_Negozio));
    
    
    INSERT INTO Area VALUES
(1, 'Nord 1'),
(2, 'Nord 2'),
(3, 'Centro 1'),
(4, 'Centro 2'),
(5, 'Sud 1'),
(6, 'Sud 2');


INSERT INTO Magazzino VALUES
(1, 'Magazzino_1', 1),
(2, 'Magazzino_2', 1),
(3, 'Magazzino_3', 2),
(4, 'Magazzino_4', 2),
(5, 'Magazzino_5', 3),
(6, 'Magazzino_6', 3),
(7, 'Magazzino_7', 4),
(8, 'Magazzino_8', 4),
(9, 'Magazzino_9', 5),
(10, 'Magazzino_10', 5),
(11, 'Magazzino_11', 6),
(12, 'Magazzino_12', 6);


INSERT INTO Negozio VALUES
(1, 'Negozio_1', 1),
(2, 'Negozio_2', 1),
(3, 'Negozio_3', 1),
(4, 'Negozio_4', 1),
(5, 'Negozio_5', 2),
(6, 'Negozio_6', 2),
(7, 'Negozio_7', 2),
(8, 'Negozio_8', 2),
(9, 'Negozio_9', 3),
(10, 'Negozio_10', 3),
(11, 'Negozio_11', 3),
(12, 'Negozio_12', 3),
(13, 'Negozio_13', 4),
(14, 'Negozio_14', 4),
(15, 'Negozio_15', 4),
(16, 'Negozio_16', 4),
(17, 'Negozio_17', 5),
(18, 'Negozio_18', 5),
(19, 'Negozio_19', 5),
(20, 'Negozio_20', 5),
(21, 'Negozio_21', 6),
(22, 'Negozio_22', 6),
(23, 'Negozio_23', 6),
(24, 'Negozio_24', 6),
(25, 'Negozio_25', 7),
(26, 'Negozio_26', 7),
(27, 'Negozio_27', 7),
(28, 'Negozio_28', 7),
(29, 'Negozio_29', 8),
(30, 'Negozio_30', 8),
(31, 'Negozio_31', 8),
(32, 'Negozio_32', 8),
(33, 'Negozio_33', 9),
(34, 'Negozio_34', 9),
(35, 'Negozio_35', 9),
(36, 'Negozio_36', 9),
(37, 'Negozio_37', 10),
(38, 'Negozio_38', 10),
(39, 'Negozio_39', 10),
(40, 'Negozio_40', 10),
(41, 'Negozio_41', 11),
(42, 'Negozio_42', 11),
(43, 'Negozio_43', 11),
(44, 'Negozio_44', 11),
(45, 'Negozio_45', 12),
(46, 'Negozio_46', 12),
(47, 'Negozio_47', 12),
(48, 'Negozio_48', 12);


INSERT INTO Categoria VALUES
(1, 'Alimentari', 34),
(2, 'Cosmetica', 11),
(3, 'Elettronica', 31),
(4, 'Cartoleria', 21),
(5, 'Giocattoli', 32);


INSERT INTO Prodotto VALUES
(1, 'Alimentari_Prodotto_1', 32.68, 1),
(2, 'Alimentari_Prodotto_2', 94.9, 1),
(3, 'Alimentari_Prodotto_3', 66.26, 1),
(4, 'Cosmetica_Prodotto_1', 81.24, 2),
(5, 'Cosmetica_Prodotto_2', 24.16, 2),
(6, 'Cosmetica_Prodotto_3', 46.63, 2),
(7, 'Elettronica_Prodotto_1', 75.17, 3),
(8, 'Elettronica_Prodotto_2', 87.73, 3),
(9, 'Elettronica_Prodotto_3', 50.19, 3),
(10, 'Cartoleria_Prodotto_1', 96.67, 4),
(11, 'Cartoleria_Prodotto_2', 12.92, 4),
(12, 'Cartoleria_Prodotto_3', 59.34, 4),
(13, 'Giocattoli_Prodotto_1', 14.35, 5),
(14, 'Giocattoli_Prodotto_2', 58.11, 5),
(15, 'Giocattoli_Prodotto_3', 63.08, 5);


INSERT INTO StockLevel VALUES
(1, 1, 1, 1, 37),
(2, 1, 2, 1, 25),
(3, 1, 3, 1, 35),
(4, 1, 4, 1, 27),
(5, 1, 5, 1, 31),
(6, 1, 6, 1, 39),
(7, 1, 7, 1, 17),
(8, 1, 8, 1, 36),
(9, 1, 9, 1, 21),
(10, 1, 10, 1, 41),
(11, 1, 11, 1, 33),
(12, 1, 12, 1, 32),
(13, 2, 1, 1, 22),
(14, 2, 2, 1, 30),
(15, 2, 3, 1, 30),
(16, 2, 4, 1, 18),
(17, 2, 5, 1, 23),
(18, 2, 6, 1, 46),
(19, 2, 7, 1, 32),
(20, 2, 8, 1, 33),
(21, 2, 9, 1, 29),
(22, 2, 10, 1, 33),
(23, 2, 11, 1, 21),
(24, 2, 12, 1, 28),
(25, 3, 1, 1, 34),
(26, 3, 2, 1, 31),
(27, 3, 3, 1, 18),
(28, 3, 4, 1, 30),
(29, 3, 5, 1, 28),
(30, 3, 6, 1, 21),
(31, 3, 7, 1, 33),
(32, 3, 8, 1, 15),
(33, 3, 9, 1, 26),
(34, 3, 10, 1, 37),
(35, 3, 11, 1, 13),
(36, 3, 12, 1, 18),
(37, 4, 1, 2, 17),
(38, 4, 2, 2, 35),
(39, 4, 3, 2, 35),
(40, 4, 4, 2, 25),
(41, 4, 5, 2, 19),
(42, 4, 6, 2, 28),
(43, 4, 7, 2, 43),
(44, 4, 8, 2, 38),
(45, 4, 9, 2, 43),
(46, 4, 10, 2, 27),
(47, 4, 11, 2, 28),
(48, 4, 12, 2, 29),
(49, 5, 1, 2, 38),
(50, 5, 2, 2, 30),
(51, 5, 3, 2, 37),
(52, 5, 4, 2, 32),
(53, 5, 5, 2, 37),
(54, 5, 6, 2, 40),
(55, 5, 7, 2, 20),
(56, 5, 8, 2, 42),
(57, 5, 9, 2, 20),
(58, 5, 10, 2, 40),
(59, 5, 11, 2, 22),
(60, 5, 12, 2, 37),
(61, 6, 1, 2, 24),
(62, 6, 2, 2, 20),
(63, 6, 3, 2, 33),
(64, 6, 4, 2, 25),
(65, 6, 5, 2, 20),
(66, 6, 6, 2, 35),
(67, 6, 7, 2, 25),
(68, 6, 8, 2, 37),
(69, 6, 9, 2, 30),
(70, 6, 10, 2, 42),
(71, 6, 11, 2, 23),
(72, 6, 12, 2, 31),
(73, 7, 1, 3, 23),
(74, 7, 2, 3, 42),
(75, 7, 3, 3, 47),
(76, 7, 4, 3, 47),
(77, 7, 5, 3, 46),
(78, 7, 6, 3, 30),
(79, 7, 7, 3, 42),
(80, 7, 8, 3, 42),
(81, 7, 9, 3, 47),
(82, 7, 10, 3, 25),
(83, 7, 11, 3, 19),
(84, 7, 12, 3, 24),
(85, 8, 1, 3, 30),
(86, 8, 2, 3, 11),
(87, 8, 3, 3, 28),
(88, 8, 4, 3, 23),
(89, 8, 5, 3, 32),
(90, 8, 6, 3, 17),
(91, 8, 7, 3, 11),
(92, 8, 8, 3, 33),
(93, 8, 9, 3, 13),
(94, 8, 10, 3, 32),
(95, 8, 11, 3, 31),
(96, 8, 12, 3, 38),
(97, 9, 1, 3, 32),
(98, 9, 2, 3, 32),
(99, 9, 3, 3, 40),
(100, 9, 4, 3, 33),
(101, 9, 5, 3, 34),
(102, 9, 6, 3, 35),
(103, 9, 7, 3, 11),
(104, 9, 8, 3, 37),
(105, 9, 9, 3, 27),
(106, 9, 10, 3, 43),
(107, 9, 11, 3, 18),
(108, 9, 12, 3, 24),
(109, 10, 1, 4, 30),
(110, 10, 2, 4, 31),
(111, 10, 3, 4, 33),
(112, 10, 4, 4, 13),
(113, 10, 5, 4, 16),
(114, 10, 6, 4, 23),
(115, 10, 7, 4, 26),
(116, 10, 8, 4, 30),
(117, 10, 9, 4, 21),
(118, 10, 10, 4, 37),
(119, 10, 11, 4, 18),
(120, 10, 12, 4, 21),
(121, 11, 1, 4, 28),
(122, 11, 2, 4, 13),
(123, 11, 3, 4, 36),
(124, 11, 4, 4, 34),
(125, 11, 5, 4, 35),
(126, 11, 6, 4, 27),
(127, 11, 7, 4, 36),
(128, 11, 8, 4, 31),
(129, 11, 9, 4, 22),
(130, 11, 10, 4, 43),
(131, 11, 11, 4, 27),
(132, 11, 12, 4, 31),
(133, 12, 1, 4, 31),
(134, 12, 2, 4, 30),
(135, 12, 3, 4, 27),
(136, 12, 4, 4, 27),
(137, 12, 5, 4, 40),
(138, 12, 6, 4, 17),
(139, 12, 7, 4, 19),
(140, 12, 8, 4, 43),
(141, 12, 9, 4, 38),
(142, 12, 10, 4, 11),
(143, 12, 11, 4, 42),
(144, 12, 12, 4, 12),
(145, 13, 1, 5, 20),
(146, 13, 2, 5, 18),
(147, 13, 3, 5, 23),
(148, 13, 4, 5, 17),
(149, 13, 5, 5, 38),
(150, 13, 6, 5, 40),
(151, 13, 7, 5, 30),
(152, 13, 8, 5, 35),
(153, 13, 9, 5, 29),
(154, 13, 10, 5, 39),
(155, 13, 11, 5, 27),
(156, 13, 12, 5, 34),
(157, 14, 1, 5, 32),
(158, 14, 2, 5, 36),
(159, 14, 3, 5, 31),
(160, 14, 4, 5, 13),
(161, 14, 5, 5, 35),
(162, 14, 6, 5, 21),
(163, 14, 7, 5, 22),
(164, 14, 8, 5, 29),
(165, 14, 9, 5, 41),
(166, 14, 10, 5, 24),
(167, 14, 11, 5, 31),
(168, 14, 12, 5, 35),
(169, 15, 1, 5, 48),
(170, 15, 2, 5, 13),
(171, 15, 3, 5, 40),
(172, 15, 4, 5, 22),
(173, 15, 5, 5, 30),
(174, 15, 6, 5, 32),
(175, 15, 7, 5, 19),
(176, 15, 8, 5, 35),
(177, 15, 9, 5, 22),
(178, 15, 10, 5, 28),
(179, 15, 11, 5, 22),
(180, 15, 12, 5, 28);


INSERT INTO Vendite VALUES
(1, 1, 26, 3, 98.04, '2025-04-11'),
(2, 1, 1, 2, 65.36, '2025-03-26'),
(3, 1, 19, 4, 130.72, '2025-04-07'),
(4, 2, 33, 1, 94.9, '2025-04-09'),
(5, 2, 34, 5, 474.5, '2025-04-10'),
(6, 2, 36, 3, 284.7, '2025-03-29'),
(7, 3, 6, 4, 265.04, '2025-03-30'),
(8, 3, 17, 4, 265.04, '2025-04-01'),
(9, 3, 10, 2, 132.52, '2025-04-04'),
(10, 4, 19, 3, 243.72, '2025-04-10'),
(11, 4, 48, 3, 243.72, '2025-03-27'),
(12, 4, 21, 4, 324.96, '2025-04-07'),
(13, 5, 33, 3, 72.48, '2025-03-30'),
(14, 5, 26, 2, 48.32, '2025-04-06'),
(15, 5, 23, 5, 120.8, '2025-03-29'),
(16, 6, 27, 1, 46.63, '2025-03-27'),
(17, 6, 30, 4, 186.52, '2025-04-12'),
(18, 6, 37, 4, 186.52, '2025-03-30'),
(19, 7, 22, 1, 75.17, '2025-04-09'),
(20, 7, 29, 2, 150.34, '2025-04-05'),
(21, 7, 16, 1, 75.17, '2025-03-17'),
(22, 8, 23, 1, 87.73, '2025-03-24'),
(23, 8, 41, 2, 175.46, '2025-04-12'),
(24, 8, 31, 5, 438.65, '2025-03-31'),
(25, 9, 1, 1, 50.19, '2025-03-23'),
(26, 9, 19, 3, 150.57, '2025-04-05'),
(27, 9, 15, 2, 100.38, '2025-03-22'),
(28, 10, 32, 3, 290.01, '2025-04-09'),
(29, 10, 22, 5, 483.35, '2025-03-20'),
(30, 10, 44, 2, 193.34, '2025-04-13'),
(31, 11, 10, 4, 51.68, '2025-04-14'),
(32, 11, 1, 4, 51.68, '2025-04-12'),
(33, 11, 13, 4, 51.68, '2025-03-23'),
(34, 12, 2, 2, 118.68, '2025-03-21'),
(35, 12, 3, 2, 118.68, '2025-04-07'),
(36, 12, 35, 3, 178.02, '2025-04-09'),
(37, 13, 33, 5, 71.75, '2025-03-28'),
(38, 13, 32, 5, 71.75, '2025-03-19'),
(39, 13, 6, 1, 14.35, '2025-03-20'),
(40, 14, 18, 4, 232.44, '2025-03-17'),
(41, 14, 6, 3, 174.33, '2025-03-19'),
(42, 14, 3, 5, 290.55, '2025-03-28'),
(43, 15, 19, 4, 252.32, '2025-04-11'),
(44, 15, 9, 4, 252.32, '2025-04-03'),
(45, 15, 33, 2, 126.16, '2025-04-04');


INSERT INTO Vendite VALUES
(46, 2, 36, 6, 569.4, '2025-04-14'),
(47, 1, 40, 8, 261.44, '2025-04-04'),
(48, 15, 8, 5, 315.4, '2025-03-24'),
(49, 9, 38, 4, 200.76, '2025-03-23'),
(50, 10, 12, 4, 386.68, '2025-03-31'),
(51, 7, 4, 10, 751.7, '2025-03-26'),
(52, 8, 46, 8, 701.84, '2025-04-03'),
(53, 11, 5, 8, 103.36, '2025-03-26'),
(54, 4, 1, 8, 649.92, '2025-03-22'),
(55, 13, 8, 1, 14.35, '2025-04-08'),
(56, 10, 35, 10, 966.7, '2025-04-03'),
(57, 3, 5, 3, 198.78, '2025-04-12'),
(58, 13, 21, 2, 28.7, '2025-04-05'),
(59, 5, 14, 8, 193.28, '2025-03-25'),
(60, 10, 43, 9, 870.03, '2025-04-06'),
(61, 2, 7, 6, 569.4, '2025-04-09'),
(62, 1, 45, 2, 65.36, '2025-04-03'),
(63, 12, 4, 10, 593.4, '2025-03-25'),
(64, 11, 17, 6, 77.52, '2025-04-08'),
(65, 9, 30, 7, 351.33, '2025-04-01'),
(66, 5, 33, 9, 217.44, '2025-03-16'),
(67, 3, 14, 8, 530.08, '2025-03-30'),
(68, 3, 43, 6, 397.56, '2025-03-18'),
(69, 7, 46, 6, 451.02, '2025-03-30'),
(70, 2, 47, 6, 569.4, '2025-04-11'),
(71, 3, 29, 2, 132.52, '2025-04-05'),
(72, 5, 39, 3, 72.48, '2025-04-14'),
(73, 3, 23, 9, 596.34, '2025-03-23'),
(74, 5, 13, 8, 193.28, '2025-03-28'),
(75, 5, 24, 8, 193.28, '2025-03-30'),
(76, 2, 24, 1, 94.9, '2025-04-08'),
(77, 6, 47, 5, 233.15, '2025-04-01'),
(78, 15, 46, 4, 252.32, '2025-04-07'),
(79, 7, 38, 9, 676.53, '2025-04-09'),
(80, 6, 30, 2, 93.26, '2025-03-21'),
(81, 8, 3, 10, 877.3, '2025-04-09'),
(82, 14, 10, 4, 232.44, '2025-03-30'),
(83, 7, 44, 6, 451.02, '2025-04-05'),
(84, 10, 6, 8, 773.36, '2025-03-20'),
(85, 14, 3, 7, 406.77, '2025-03-25'),
(86, 8, 6, 1, 87.73, '2025-03-28'),
(87, 14, 8, 1, 58.11, '2025-04-07'),
(88, 4, 46, 5, 406.2, '2025-03-17'),
(89, 11, 5, 5, 64.6, '2025-03-30'),
(90, 2, 17, 9, 854.1, '2025-03-23'),
(91, 3, 45, 5, 331.3, '2025-04-04'),
(92, 6, 16, 5, 233.15, '2025-03-27'),
(93, 15, 48, 2, 126.16, '2025-03-30'),
(94, 6, 4, 8, 373.04, '2025-04-12'),
(95, 12, 33, 7, 415.38, '2025-04-07');

INSERT INTO Vendite VALUES
(96, 6, 17, 8, 373.04, '2024-04-10'),
(97, 13, 23, 5, 71.75, '2024-10-08'),
(98, 10, 22, 8, 773.36, '2024-01-11'),
(99, 12, 29, 10, 593.4, '2024-12-27'),
(100, 3, 4, 3, 198.78, '2024-07-22'),
(101, 15, 23, 9, 567.72, '2024-10-22'),
(102, 4, 19, 5, 406.2, '2024-12-30'),
(103, 11, 16, 7, 90.44, '2024-05-01'),
(104, 6, 43, 9, 419.67, '2024-08-26'),
(105, 11, 25, 10, 129.2, '2024-08-18'),
(106, 11, 30, 7, 90.44, '2024-10-28'),
(107, 6, 46, 9, 419.67, '2024-03-01'),
(108, 4, 26, 7, 568.68, '2024-03-06'),
(109, 1, 39, 8, 261.44, '2024-10-05'),
(110, 13, 9, 6, 86.1, '2024-09-23'),
(111, 13, 17, 2, 28.7, '2024-07-13'),
(112, 12, 34, 7, 415.38, '2024-02-27'),
(113, 11, 33, 4, 51.68, '2024-02-16'),
(114, 2, 38, 3, 284.7, '2024-11-07'),
(115, 15, 43, 10, 630.8, '2024-09-12');

-- Query che processa la vendita 

start transaction;
UPDATE StockLevel AS SL
INNER JOIN Vendite AS V 
ON SL.Id_Prodotto = V.Id_Prodotto
INNER JOIN Negozio AS N 
ON V.Id_Negozio = N.Id_Negozio
SET SL.Quantità = SL.Quantità - V.Quantità
WHERE V.Id_Vendita = 1;
rollback;

-- Query per verificare media quantità venduta Categoria per Trimeste annuo
select C.Id_Categoria
, C.Nome_Categoria
, avg (Quantità) as Media_Vendita
, quarter (Data_Ordine) as Trimestre
from vendite as V
inner join Prodotto as P
on V.Id_Prodotto = P.Id_Prodotto
inner join Categoria as C
on P.Id_Categoria = C.Id_Categoria
group by Id_Categoria, quarter (Data_Ordine)
order by Id_Categoria ,quarter(Data_Ordine);

-- Query per verificare quali prodotti sono sotto la soglia
 SELECT SL.*
 , C.Livello_StockLevel
 , C.Livello_StockLevel - SL.Quantità as Quantità_Da_Rifornire
, case when SL.Quantità < C.Livello_StockLevel THEN 'Si'
else 'No' end as Magazzino_Da_Rifornire
FROM StockLevel AS SL
INNER JOIN Categoria AS C 
ON SL.Id_Categoria = C.Id_Categoria;

-- Query per rifornimento Restock
Start transaction;
UPDATE StockLevel AS SL
INNER JOIN Vendite AS V 
ON SL.Id_Prodotto = V.Id_Prodotto
INNER JOIN Negozio AS N 
ON V.Id_Negozio = N.Id_Negozio
INNER JOIN Categoria AS C 
ON SL.Id_Categoria = C.Id_Categoria
SET SL.Quantità = SL.Quantità + (C.Livello_StockLevel - SL.Quantità)
WHERE SL.Quantità < C.Livello_StockLevel;