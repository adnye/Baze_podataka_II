CREATE DATABASE Vjezba1
GO
USE Vjezba1

CREATE TABLE Studenti
(
	BrojIndeksa VARCHAR(10), 
	Ime NVARCHAR(20), 
	Prezime NVARCHAR(30), 
	ImeRoditelja NVARCHAR(20)
)

CREATE TABLE Gradovi
(
	Naziv NVARCHAR(30),
	PostanskiBroj VARCHAR(10) NOT NULL
)

ALTER TABLE Studenti
ADD StudentID INT NOT NULL IDENTITY(1,1)

ALTER TABLE Studenti
ADD CONSTRAINT PK_Studenti PRIMARY KEY (StudentID)

ALTER TABLE Gradovi
ADD GradID INT PRIMARY KEY IDENTITY(1,1)

ALTER TABLE Studenti
ADD GradID INT CONSTRAINT FK_Studenti_Gradovi FOREIGN KEY REFERENCES Gradovi(GradID)

CREATE TABLE Fakulteti
(
	FakultetID INT CONSTRAINT PK_Fakulteti PRIMARY KEY IDENTITY(1,1), 
	Naziv NVARCHAR(50) NOT NULL
)

CREATE TABLE StudentiFakulteti
(
	StudentID INT CONSTRAINT FK_StudentiFakulteti_Studenti FOREIGN KEY REFERENCES Studenti(StudentID), 
	FakultetID INT CONSTRAINT FK_StudentiFakulteti_Fakulteti FOREIGN KEY REFERENCES Fakulteti(FakultetID), 
	CONSTRAINT PK_StudentiFakulteti PRIMARY KEY(StudentID, FakultetID)
)

ALTER TABLE Studenti
DROP COLUMN ImeRoditelja

ALTER TABLE Studenti
ADD JMBG VARCHAR(15),
	Telefon VARCHAR(13)

ALTER TABLE StudentiFakulteti
DROP CONSTRAINT FK_StudentiFakulteti_Studenti

DROP TABLE Studenti

USE master
GO
DROP DATABASE Vjezba1