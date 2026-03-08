--a) Kreirati bazu podataka pod nazivom ZadaciZaVjezbu.
CREATE DATABASE ZadaciZaVjezbu
GO
USE ZadaciZaVjezbu

--b) U pomenutuj bazi kreirati tabelu Aplikant koja ce sadržavati sljedeće kolone: Ime, Prezime i MjestoRodjenja. 
--Sva navedena polja trebaju da budu tekstualnog tipa, 
--te prilikom kreiranja istih paziti da se ne zauzimaju bespotrebno memorijski resursi.
CREATE TABLE Aplikant
(
	Ime NVARCHAR(15), 
	Prezime NVARCHAR(20), 
	MjestoRodjenja NVARCHAR(25)
)

--c) U tabelu aplikant dodati kolonu AplikantID, te je proglasiti primarnim ključem tabele (kolona mora biti autoinkrement).
ALTER TABLE Aplikant
ADD AplikantID INT CONSTRAINT PK_Aplikant PRIMARY KEY IDENTITY(1,1)

--d) U bazi ZadaciZaVjezbu kreirati tabelu Projekat koji ce sadržavati sljedeće kolone: NazivProjekta, AkronimProjekta, SvrhaProjekta i Cilj projekta. 
--Sva polja u tabeli su tekstualnog tipa te prilikom kreiranja istih paziti da se ne zauzimaju bespotrebno memorijski resursi. 
--Sva navedena polja osim cilja projekta moraju imati vrijednost.
CREATE TABLE Projekat
(
	NazivProjekta NVARCHAR(25) NOT NULL, 
	AkronimProjekta NVARCHAR(10) NOT NULL,
	SvrhaProjekta NVARCHAR(40) NOT NULL, 
	CiljProjekta NVARCHAR(40)
)

--e) U tabelu Projekat dodati kolonu ProjekatID, te je proglasiti primarnim ključem tabele.
ALTER TABLE Projekat
ADD ProjekatID INT CONSTRAINT PK_Projekat PRIMARY KEY IDENTITY(1,1)

--f) U tabelu Aplikant dodati kolonu ProjekatID koje ce biti spolji ključ na tabelu Projekat.
ALTER TABLE Aplikant
ADD ProjekatID INT NOT NULL CONSTRAINT FK_Aplikant_Projekat FOREIGN KEY REFERENCES Projekat(ProjekatID)

--g) U bazi podataka ZadaciZaVjezbu kreirati tabelu TematskaOblast koja ce sadržavati sljedeća polja: TematskaOblastID, Naziv, Opseg. 
--TematskaOblastID predstavlja primarni ključ tabele, te se automatski uvećava. Sva definisana polja moraju imati vrijednost. 
--Prilikom definisanja dužine polja potrebno je obratiti pažnju da se ne zauzimaju bespotrebno memorijski resursi.
CREATE TABLE TematskaOblast
(
	TematskaOblastID INT CONSTRAINT PK_TematskaOblast PRIMARY KEY IDENTITY(1,1), 
	Naziv NVARCHAR(30) NOT NULL, 
	Opseg NVARCHAR(30) NOT NULL,
)

--h) U tabeli Aplikant dodati polje Email koje je tekstualnog tipa i moče ostati prazno.
ALTER TABLE Aplikant
ADD Email NVARCHAR(30)

--i) U tabeli Aplikant obrsati MjestoRodjenja i dodati polja Telefon i MaticniBroj. 
--Oba novokreirana polja su tekstualnog tipa i moraju sadržavati vrijednost.
ALTER TABLE Aplikant
DROP COLUMN MjestoRodjenja

ALTER TABLE Aplikant
ADD Telefon NVARCHAR(20) NOT NULL, MaticniBroj NVARCHAR(15) NOT NULL

--j) Obrisati tabele kreirane u prethodnim zadacima.
ALTER TABLE Aplikant
DROP CONSTRAINT FK_Aplikant_Projekat

DROP TABLE Aplikant
DROP TABLE Projekat
DROP TABLE TematskaOblast

--k) Obrisati kreiranu bazu.
USE master
DROP DATABASE ZadaciZaVjezbu