CREATE TABLE users (

ID char(5),
Nama varchar(255),
Kantor varchar(255),
PRIMARY KEY(ID)
);

INSERT INTO users (ID,Nama,Kantor)
VALUES
('TRC01','Anto','Cabang'),
('TRC02','Siti','Pusat'),
('TRC03','Budi','Pusat');
