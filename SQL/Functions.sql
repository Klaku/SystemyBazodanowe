--Inline
CREATE FUNCTION GetStudentsOceny (@studentid int)
RETURNS TABLE
AS
RETURN 
(
    SELECT * from Oceny where User_Id = @studentid
);

select * from GetStudentsOceny(1)



--Skalarna
go
CREATE or Alter FUNCTION avgOcena (@userId int)  
RETURNS float  
WITH EXECUTE AS CALLER  
AS  
BEGIN  
	Declare @avgOcena float;
     DECLARE @suma float;  
     SET @suma = (select sum(CAST(Oceny.Ocena as float)) from Oceny where User_Id = @userId);   
     Declare @count int;
	 SET @count = (select count(Oceny.Ocena) from Oceny where User_Id = @userId);  
	 if(@count = 0)
		SET @avgOcena = 0;
		Else 
		SET @avgOcena = @suma / @count;
	 RETURN(@avgOcena);  
END

go
Select dbo.avgOcena(2) as 'Srednia'

--MultiStatement
create FUNCTION getPassed()
RETURNS @wynikowa TABLE 
(
    [name] varchar(100) NOT NULL,
    [srednia] float not NULL
)
AS
BEGIN
    insert into @wynikowa
       Select u.Imie+' '+u.Nazwisko as 'name', dbo.avgOcena(u.Id) as srednia from Users as u where dbo.avgOcena(u.Id) >= 3
return
END

Select * from dbo.getPassed();