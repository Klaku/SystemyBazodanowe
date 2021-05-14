insert into Rola values(1,'Profesor')
insert into Rola values(2,'Student')
insert into Rola values(3,'Guest')



DROP SEQUENCE UsersIdentity
CREATE SEQUENCE UsersIdentity AS BIGINT START WITH 1 INCREMENT BY 1




begin try
	begin transaction
		DECLARE @Seq BIGINT
		SET @Seq=NEXT VALUE FOR dbo.UsersIdentity
		insert into Users values(@Seq,'Kamil','Kowalski','Kielce','91-313','Galeckiego 12')
		insert into Roles values(1,@Seq)
	commit transaction
end try
begin catch
	if XACT_STATE()=1 --is there open transaction
	begin
		rollback transaction
	end;
	throw
end catch

begin try
	begin transaction
		insert into Users values(2,'Kamil','Kowalski','Kielce','91-313','Galeckiego 12')
		insert into Roles values(3,2)
	commit transaction
end try
begin catch
	if XACT_STATE()=1 --is there open transaction
	begin
		rollback transaction
	end;
	throw
end catch

set xact_abort off

create or alter procedure createUserSeq @imie varchar(32), @nazwisko varchar(32), @miasto varchar(32), @KodPocztowy varchar(6), @adres varchar(255)
as 
begin
 	begin try
	begin transaction
		DECLARE @Seq BIGINT
		SET @Seq=NEXT VALUE FOR dbo.UsersIdentity
		insert into Users values(@Seq,@imie,@nazwisko,@miasto, @KodPocztowy, @adres)
		insert into Roles values(3,@Seq)
	commit transaction
end try
begin catch
	if XACT_STATE()=1 --is there open transaction
	begin
		rollback transaction
	end;
	throw
end catch
end

create or alter procedure createUser @id int, @imie varchar(32), @nazwisko varchar(32), @miasto varchar(32), @KodPocztowy varchar(6), @adres varchar(255)
as 
begin
 	begin try
	begin transaction
		insert into Users values(@id,@imie,@nazwisko,@miasto, @KodPocztowy, @adres)
		insert into Roles values(3,@id)
	commit transaction
end try
begin catch
	if XACT_STATE()=1 --is there open transaction
	begin
		rollback transaction
	end;
	throw
end catch
end

create or alter procedure createUserTry @id int, @imie varchar(32), @nazwisko varchar(32), @miasto varchar(32), @KodPocztowy varchar(6), @adres varchar(255)
as 
begin
 	begin try
		insert into Users values(@id,@imie,@nazwisko,@miasto, @KodPocztowy, @adres)
		insert into Roles values(3,@id)
	end try
	begin catch
		print 'we are in catch';
		SELECT  
        ERROR_NUMBER() AS ErrorNumber,  
        ERROR_SEVERITY() AS ErrorSeverity,  
        ERROR_STATE() AS ErrorState,  
        ERROR_PROCEDURE() AS ErrorProcedure,  
        ERROR_LINE() AS ErrorLine,  
        ERROR_MESSAGE() AS ErrorMessage;  
		throw
	end catch
end