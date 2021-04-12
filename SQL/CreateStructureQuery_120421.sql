-- Generated by Oracle SQL Developer Data Modeler 20.4.1.406.0906
--   at:        2021-04-12 18:01:30 CEST
--   site:      SQL Server 2012
--   type:      SQL Server 2012



CREATE TABLE Oceny 
    (
     Id INTEGER NOT NULL , 
     Ocena VARCHAR (5) NOT NULL , 
     Przedmiot_Id INTEGER NOT NULL , 
     User_Id INTEGER NOT NULL , 
     Id1 INTEGER NOT NULL 
    )
GO

ALTER TABLE Oceny ADD CONSTRAINT Oceny_PK PRIMARY KEY CLUSTERED (Id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Prowadzacy 
    (
     User_Id INTEGER NOT NULL , 
     Przedmiot_Id INTEGER NOT NULL 
    )
GO

ALTER TABLE Prowadzacy ADD CONSTRAINT Prowadzacy_PK PRIMARY KEY CLUSTERED (User_Id, Przedmiot_Id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Przedmiot 
    (
     Id INTEGER NOT NULL , 
     Nazwa VARCHAR (100) NOT NULL , 
     ECTS INTEGER NOT NULL 
    )
GO

ALTER TABLE Przedmiot ADD CONSTRAINT Przedmiot_PK PRIMARY KEY CLUSTERED (Id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Rola 
    (
     Id INTEGER NOT NULL , 
     Stanowisko VARCHAR (100) NOT NULL 
    )
GO

ALTER TABLE Rola ADD CONSTRAINT Rola_PK PRIMARY KEY CLUSTERED (Id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE Role 
    (
     Rola_Id INTEGER NOT NULL , 
     User_Id INTEGER NOT NULL 
    )
GO

ALTER TABLE Role ADD CONSTRAINT Role_PK PRIMARY KEY CLUSTERED (Rola_Id, User_Id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE "User" 
    (
     Id INTEGER NOT NULL , 
     Imie VARCHAR (32) , 
     Nazwisko VARCHAR (32) , 
     Miasto VARCHAR (255) , 
     KodPocztowy VARCHAR (6) , 
     Adres VARCHAR (255) 
    )
GO

ALTER TABLE "User" ADD CONSTRAINT User_PK PRIMARY KEY CLUSTERED (Id)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE Oceny 
    ADD CONSTRAINT Oceny_Przedmiot_FK FOREIGN KEY 
    ( 
     Przedmiot_Id
    ) 
    REFERENCES Przedmiot 
    ( 
     Id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Oceny 
    ADD CONSTRAINT Oceny_User_FK FOREIGN KEY 
    ( 
     User_Id
    ) 
    REFERENCES "User" 
    ( 
     Id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Prowadzacy 
    ADD CONSTRAINT Prowadzacy_Przedmiot_FK FOREIGN KEY 
    ( 
     Przedmiot_Id
    ) 
    REFERENCES Przedmiot 
    ( 
     Id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Prowadzacy 
    ADD CONSTRAINT Prowadzacy_User_FK FOREIGN KEY 
    ( 
     User_Id
    ) 
    REFERENCES "User" 
    ( 
     Id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Role 
    ADD CONSTRAINT Role_Rola_FK FOREIGN KEY 
    ( 
     Rola_Id
    ) 
    REFERENCES Rola 
    ( 
     Id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE Role 
    ADD CONSTRAINT Role_User_FK FOREIGN KEY 
    ( 
     User_Id
    ) 
    REFERENCES "User"
    ( 
     Id 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             12
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
