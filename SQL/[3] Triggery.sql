Create or ALTER trigger checkMark
on Oceny after insert
as
 if exists (select * from inserted i where i.Ocena<1 or i.Ocena>6)
  begin
   print 'Wartość oceny nieprawidłowa!'
   rollback;
  end
go

CREATE or ALTER TRIGGER bezpiecznik   
ON Database   
FOR DROP_TABLE, ALTER_TABLE   
AS   
   PRINT 'Edycja i usuwanie zablokowane'   
   ROLLBACK;
go

go
CREATE TRIGGER trgPerson ON Users for INSERT,UPDATE 
AS UPDATE u SET 
u.Imie=UPPER( LEFT(u.Imie,1))+LOWER(RIGHT(u.Imie,len(u.Imie)-1)),
u.Nazwisko=UPPER( LEFT(u.Nazwisko,1))+LOWER(RIGHT(u.Nazwisko,len(u.Nazwisko)-1))
FROM Users u INNER JOIN inserted i ON i.Id = u.Id