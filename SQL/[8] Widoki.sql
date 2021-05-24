Drop View dbo.StatystykiMiastoOcena
go

CREATE VIEW dbo.StatystykiMiastoOcena
WITH SCHEMABINDING
AS
    Select Miasto,Nazwa, COUNT_BIG(*) AS 'Ilość Ocen'
	from dbo.Oceny as o Join dbo.Przedmiot as p on o.Przedmiot_Id=p.Id Join dbo.Users as u on o.User_Id = u.Id 
	Group by Miasto,Nazwa

go
Select * from dbo.StatystykiMiastoOcena

go
Select * From (Select Miasto,Nazwa, COUNT_BIG(*) AS 'Ilość Ocen'
	from dbo.Oceny as o Join dbo.Przedmiot as p on o.Przedmiot_Id=p.Id Join dbo.Users as u on o.User_Id = u.Id 
	Group by Miasto,Nazwa) t
go

CREATE UNIQUE CLUSTERED INDEX MiastoNazawaPair 
    ON dbo.StatystykiMiastoOcena(Miasto, Nazwa);
go

set statistics io on
Select * from dbo.StatystykiMiastoOcena With (NOEXPAND) where Miasto = 'Olsztyn' 
set statistics io off
go

set statistics io on
Select u.Miasto,p.Nazwa
	from dbo.Oceny as o
	Join dbo.Przedmiot as p on o.Przedmiot_Id=p.Id 
	Join dbo.Users as u on o.User_Id = u.Id 
	where  Miasto='Olsztyn'  Group by u.Miasto,p.Nazwa order by p.Nazwa desc OPTION (MERGE JOIN)
set statistics io off
go

