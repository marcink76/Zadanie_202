CREATE TABLE `pracownicy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `id_dzialu` int(11) DEFAULT NULL,
  `adres` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8

CREATE TABLE `adresy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ulica` varchar(45) NOT NULL,
  `nr_posesji` smallint(6) NOT NULL,
  `nr_lokalu` smallint(6) DEFAULT NULL,
  `kod_pocztowy` varchar(5) NOT NULL,
  `miasto` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  CONSTRAINT `id_adres` FOREIGN KEY (`id`) REFERENCES `pracownicy` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8

CREATE TABLE `stanowiska` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa_stanowiska` varchar(45) NOT NULL,
  `opis` varchar(200) DEFAULT NULL,
  `wypłata_na_stanowisku` decimal(7,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8


select *
from zadanie_202.pracownicy inner join zadanie_202.adresy on zadanie_202.adresy.id = zadanie_202.pracownicy.adres inner join zadanie_202.stanowiska on zadanie_202.pracownicy.id_dzialu = zadanie_202.stanowiska.id;

select sum(zadanie_202.stanowiska.wypłata_na_stanowisku) from zadanie_202.pracownicy inner join zadanie_202.stanowiska on zadanie_202.pracownicy.id_dzialu = zadanie_202.stanowiska.id;

select zadanie_202.pracownicy.imie as IMIE, zadanie_202.pracownicy.nazwisko as NAZWISKO from zadanie_202.pracownicy inner join zadanie_202.adresy on zadanie_202.pracownicy.adres = zadanie_202.adresy.id where zadanie_202.adresy.kod_pocztowy = "80859"