CREATE DATABASE taller_mecanico;
USE taller_mecanico;

CREATE TABLE Clientes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    ape VARCHAR(50),
    dni VARCHAR(20),
    tel VARCHAR(20)
);

INSERT INTO Clientes (nom, ape, dni, tel) VALUES
('Juan','Perez','12345678','111111111'),
('Ana','Gomez','23456789','222222222'),
('Luis','Martinez','34567890','333333333'),
('Sofia','Lopez','45678901','444444444'),
('Carlos','Diaz','56789012','555555555');

CREATE TABLE Vehiculos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Matricula VARCHAR(20),
    modelo VARCHAR(50),
    marca VARCHAR(50),
    color VARCHAR(30),
    ID_cli INT,
    FOREIGN KEY (ID_cli) REFERENCES Clientes(ID)
);

INSERT INTO Vehiculos (Matricula, modelo, marca, color, ID_cli) VALUES
('AAA111','Fiesta','Ford','Rojo',1),
('BBB222','Gol','VW','Blanco',2),
('CCC333','Corsa','Chevrolet','Negro',3),
('DDD444','208','Peugeot','Gris',4),
('EEE555','Clio','Renault','Azul',5);

CREATE TABLE Ficha (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    fecha_entrada DATE,
    hora TIME,
    ID_vehiculo INT,
    FOREIGN KEY (ID_vehiculo) REFERENCES Vehiculos(ID)
);

INSERT INTO Ficha (fecha_entrada, hora, ID_vehiculo) VALUES
('2026-01-01','08:00:00',1),
('2026-01-02','09:00:00',2),
('2026-01-03','10:00:00',3),
('2026-01-04','11:00:00',4),
('2026-01-05','12:00:00',5);

CREATE TABLE Mecanicos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    ape VARCHAR(50),
    dni VARCHAR(20),
    tel VARCHAR(20)
);

INSERT INTO Mecanicos (nom, ape, dni, tel) VALUES
('Pedro','Ruiz','11111111','666666666'),
('Mario','Sosa','22222222','777777777'),
('Lucas','Torres','33333333','888888888'),
('Diego','Castro','44444444','999999999'),
('Jorge','Herrera','55555555','101010101');

CREATE TABLE Diagnostico (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_mec INT,
    Especialidad VARCHAR(100),
    FOREIGN KEY (ID_mec) REFERENCES Mecanicos(ID)
);

INSERT INTO Diagnostico (ID_mec, Especialidad) VALUES
(1,'Motor'),
(2,'Electricidad'),
(3,'Frenos'),
(4,'Suspension'),
(5,'Transmision');

CREATE TABLE Reparacion (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_mec INT,
    Horario VARCHAR(50),
    FOREIGN KEY (ID_mec) REFERENCES Mecanicos(ID)
);

INSERT INTO Reparacion (ID_mec, Horario) VALUES
(1,'08-12'),
(2,'09-13'),
(3,'10-14'),
(4,'11-15'),
(5,'12-16');

CREATE TABLE Presupuesto (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    diagnostico TEXT,
    valor DECIMAL(10,2),
    fecha_emision DATE,
    bool_acepta BOOLEAN,
    ID_ficha INT,
    ID_mec INT,
    FOREIGN KEY (ID_ficha) REFERENCES Ficha(ID),
    FOREIGN KEY (ID_mec) REFERENCES Mecanicos(ID)
);

INSERT INTO Presupuesto (diagnostico, valor, fecha_emision, bool_acepta, ID_ficha, ID_mec) VALUES
('Cambio aceite',10000,'2026-01-06',1,1,1),
('Arreglo frenos',20000,'2026-01-07',0,2,2),
('Cambio bateria',15000,'2026-01-08',1,3,3),
('Reparacion motor',50000,'2026-01-09',0,4,4),
('Alineacion',8000,'2026-01-10',1,5,5);

CREATE TABLE Repuestos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    stock INT,
    origen VARCHAR(50),
    precio DECIMAL(10,2),
    unidad_de_medida VARCHAR(20)
);

INSERT INTO Repuestos (nom, stock, origen, precio, unidad_de_medida) VALUES
('Aceite',50,'Argentina',5000,'litro'),
('Filtro',30,'Brasil',3000,'unidad'),
('Bateria',20,'China',20000,'unidad'),
('Pastillas freno',40,'Argentina',8000,'juego'),
('Bujias',60,'Mexico',4000,'unidad');

CREATE TABLE RepXPre (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_rep INT,
    ID_pre INT,
    FOREIGN KEY (ID_rep) REFERENCES Repuestos(ID),
    FOREIGN KEY (ID_pre) REFERENCES Presupuesto(ID)
);

INSERT INTO RepXPre (ID_rep, ID_pre) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);