-- Generated by Oracle SQL Developer Data Modeler 20.4.1.406.0906
--   at:        2021-03-23 09:48:49 CET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE daneadresowe (
    id           INTEGER NOT NULL,
    adres        VARCHAR2(255 CHAR) NOT NULL,
    kodpocztowy  VARCHAR2(50 CHAR) NOT NULL,
    miasto       VARCHAR2(100 CHAR) NOT NULL,
    user_id      INTEGER NOT NULL
);

ALTER TABLE daneadresowe ADD CONSTRAINT daneadresowe_pk PRIMARY KEY ( id );

CREATE TABLE parauczenplan (
    user_id       INTEGER NOT NULL,
    planzajec_id  INTEGER NOT NULL,
    id            INTEGER NOT NULL,
    ocena         FLOAT(2)
);

ALTER TABLE parauczenplan ADD CONSTRAINT relation_7_pk PRIMARY KEY ( id );

CREATE TABLE planzajec (
    id            INTEGER NOT NULL,
    datastart     DATE NOT NULL,
    datakoniec    DATE NOT NULL,
    termin        DATE NOT NULL,
    sala_id       INTEGER NOT NULL,
    przedmiot_id  INTEGER NOT NULL
);

ALTER TABLE planzajec ADD CONSTRAINT planzajec_pk PRIMARY KEY ( id );

CREATE TABLE prowadzacy (
    user_id       INTEGER NOT NULL,
    przedmiot_id  INTEGER NOT NULL
);

ALTER TABLE prowadzacy ADD CONSTRAINT relation_4_pk PRIMARY KEY ( user_id,
                                                                  przedmiot_id );

CREATE TABLE przedmiot (
    id     INTEGER NOT NULL,
    nazwa  VARCHAR2(100 CHAR) NOT NULL,
    ects   INTEGER NOT NULL
);

ALTER TABLE przedmiot ADD CONSTRAINT przedmiot_pk PRIMARY KEY ( id );

CREATE TABLE rola (
    id          INTEGER NOT NULL,
    stanowisko  VARCHAR2(100 CHAR) NOT NULL
);

ALTER TABLE rola ADD CONSTRAINT rola_pk PRIMARY KEY ( id );

CREATE TABLE role (
    rola_id  INTEGER NOT NULL,
    user_id  INTEGER NOT NULL
);

ALTER TABLE role ADD CONSTRAINT relation_2_pk PRIMARY KEY ( rola_id,
                                                            user_id );

CREATE TABLE sala (
    id     INTEGER NOT NULL,
    numer  INTEGER NOT NULL
);

ALTER TABLE sala ADD CONSTRAINT sala_pk PRIMARY KEY ( id );

CREATE TABLE "User" (
    id        INTEGER NOT NULL,
    imie      VARCHAR2(32 CHAR),
    nazwisko  VARCHAR2(32 CHAR)
);

ALTER TABLE "User" ADD CONSTRAINT user_pk PRIMARY KEY ( id );

ALTER TABLE daneadresowe
    ADD CONSTRAINT daneadresowe_user_fk FOREIGN KEY ( user_id )
        REFERENCES "User" ( id );

ALTER TABLE planzajec
    ADD CONSTRAINT planzajec_przedmiot_fk FOREIGN KEY ( przedmiot_id )
        REFERENCES przedmiot ( id );

ALTER TABLE planzajec
    ADD CONSTRAINT planzajec_sala_fk FOREIGN KEY ( sala_id )
        REFERENCES sala ( id );

ALTER TABLE role
    ADD CONSTRAINT relation_2_rola_fk FOREIGN KEY ( rola_id )
        REFERENCES rola ( id );

ALTER TABLE role
    ADD CONSTRAINT relation_2_user_fk FOREIGN KEY ( user_id )
        REFERENCES "User" ( id );

ALTER TABLE prowadzacy
    ADD CONSTRAINT relation_4_przedmiot_fk FOREIGN KEY ( przedmiot_id )
        REFERENCES przedmiot ( id );

ALTER TABLE prowadzacy
    ADD CONSTRAINT relation_4_user_fk FOREIGN KEY ( user_id )
        REFERENCES "User" ( id );

ALTER TABLE parauczenplan
    ADD CONSTRAINT relation_7_planzajec_fk FOREIGN KEY ( planzajec_id )
        REFERENCES planzajec ( id );

ALTER TABLE parauczenplan
    ADD CONSTRAINT relation_7_user_fk FOREIGN KEY ( user_id )
        REFERENCES "User" ( id );



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             18
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
