create database corsi_aziendali;
use corsi_aziendali;

create table corsi(
  id INT primary key auto_increment,
  nome varchar(100),
  categoria varchar(50),
  descrizione text,
  durata_ore INT,
  livello enum('Base','Intermedio','Avanzato')
);

create table date_corsi(
  id INT primary key auto_increment,
  corso_id INT,
  foreign key (corso_id) references corsi(id),
  data_inizio date,
  data_fine date,
  orario varchar(30),
  sede varchar(100),
  posti_max INT,
  posti_liberi INT
);

insert into corsi(nome,categoria,descrizione,durata_ore,livello)
values ('Programmazione','Informatica','Impara a scrivere codice e sviluppare software, dalle basi della logica ai linguaggi più richiesti sul mercato.', 60,'intermedio'),
('Grafica','Design','Padroneggia gli strumenti visivi per creare loghi, layout e contenuti digitali dal forte impatto comunicativo.', 60,'intermedio'),
('Design Industriale','Design','Progetta oggetti funzionali e innovativi coniugando estetica, ergonomia e processi produttivi sostenibili.', 40,'base'),
('Sistemista Reti','Informatica','Diventa esperto nella configurazione e sicurezza delle infrastrutture IT per garantire connettività e protezione dati.', 70,'avanzato'),
('Inglese','Lingue','Potenzia la tua conversazione e scrittura per comunicare con sicurezza in contesti professionali e internazionali.', 30,'base');

insert into date_corsi(corso_id,data_inizio,data_fine,orario,sede,posti_max,posti_liberi)
values ( 1,'2026-05-01', '2026-05-21', '09:00 - 13:00', 'Torino', 50, 34),
( 1,'2026-05-01', '2026-05-21', '14:00 - 18:00', 'Torino', 60, 28),
( 4,'2026-05-25', '2026-06-11', '08:00 - 13:00', 'Moncalieri', 60, 54),
( 4,'2026-05-25', '2026-06-11', '14:00 - 19:00', 'Moncalieri', 50, 36),
( 3,'2026-05-18', '2026-05-29', '09:00 - 13:00', 'Rivoli', 60, 23),
( 3,'2026-05-18', '2026-05-29', '14:00 - 18:00', 'Rivoli', 50, 37),  
( 2,'2026-06-01', '2026-06-19', '09:00 - 13:00', 'Alessandria', 60, 19),
( 2,'2026-06-01', '2026-05-19', '14:00 - 18:00', 'Alessandria', 50, 44),
( 5,'2026-06-08', '2026-06-19', '09:00 - 12:00', 'Chieri', 60, 24),
( 5,'2026-06-08', '2026-06-19', '14:00 - 17:00', 'Chieri', 50, 39);

create user 'admin_corsi_aziendali'@'localhost' identified by 'admin';
grant select on corsi_aziendali.* to 'admin_corsi_aziendali'@'localhost';

flush privileges;
