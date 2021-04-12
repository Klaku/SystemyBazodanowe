insert into Rola values(1,'Profesor')

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

set xact_abort off