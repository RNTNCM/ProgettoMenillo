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
